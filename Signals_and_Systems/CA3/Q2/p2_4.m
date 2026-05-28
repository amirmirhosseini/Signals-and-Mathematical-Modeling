tic
clc; clear; close all;
load DataFit.mat

syms a0;
syms phi0;
syms w0;

mseFunction = 1000*mean((y - a0*sin(w0*x + phi0)).^2);

grad_a0 = diff(mseFunction, a0);
grad_w0 = diff(mseFunction, w0);
grad_phi0 = diff(mseFunction, phi0);

curvature_a0_a0 = diff(grad_a0, a0);
curvature_w0_w0 = diff(grad_w0, w0);
curvature_phi0_phi0 = diff(grad_phi0, phi0);
curvature_a0_w0 = diff(grad_a0, w0);
curvature_a0_phi0 = diff(grad_a0, phi0);
curvature_w0_phi0 = diff(grad_w0, phi0);

mseFunctionHandle = matlabFunction(mseFunction, 'Vars', {a0, w0, phi0});
gradA0Handle = matlabFunction(grad_a0, 'Vars', {a0, w0, phi0});
gradW0Handle = matlabFunction(grad_w0, 'Vars', {a0, w0, phi0});
gradPhi0Handle = matlabFunction(grad_phi0, 'Vars', {a0, w0, phi0});

curvatureFunctionHandle = matlabFunction([curvature_a0_a0, curvature_a0_w0, curvature_a0_phi0; 
                                          curvature_a0_w0, curvature_w0_w0, curvature_w0_phi0; 
                                          curvature_a0_phi0, curvature_w0_phi0, curvature_phi0_phi0], ...
                                         'Vars', {a0, w0, phi0});

currentA0 = 2;
currentW0 = 10;
currentPhi0 = 0;

iterationCount = 0;
maxIterations = 1500;
convergenceTolerance = 1e-6;

while iterationCount < maxIterations
    gradients = [gradA0Handle(currentA0, currentW0, currentPhi0); 
                 gradW0Handle(currentA0, currentW0, currentPhi0); 
                 gradPhi0Handle(currentA0, currentW0, currentPhi0)];
    
    curvatureMatrix = curvatureFunctionHandle(currentA0, currentW0, currentPhi0);
    
    delta = -curvatureMatrix \ gradients;
    newA0 = currentA0 + delta(1);
    newW0 = currentW0 + delta(2);
    newPhi0 = currentPhi0 + delta(3);
    
    if abs(mseFunctionHandle(currentA0, currentW0, currentPhi0) - ...
           mseFunctionHandle(newA0, newW0, newPhi0)) <= convergenceTolerance || ...
       (abs(newA0 - currentA0) <= convergenceTolerance && ...
        abs(newW0 - currentW0) <= convergenceTolerance && ...
        abs(newPhi0 - currentPhi0) <= convergenceTolerance)
        break;
    end
    
    currentA0 = newA0;
    currentW0 = newW0;
    currentPhi0 = newPhi0;
    iterationCount = iterationCount + 1;
end

disp(currentA0);
disp(currentW0);
disp(currentPhi0);
toc
