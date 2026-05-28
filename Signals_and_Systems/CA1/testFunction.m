%% testing WITHOUT NOISE

mm=length(t);
x1 = rand(1,mm);
a1 = 6;b1 = 4;
y1 = a1*x1 + b1;
optimal_params = fsolve(@(params) p2_4(params, y1, x1), initial_guess);  

a1_test = optimal_params(1);  
b1_test = optimal_params(2);  

disp(a1_test);
disp(b1_test);
%% testing the function WITH NOISE
x2 = rand(1,mm);
Noise = sqrt(0.3)*randn(1,mm);
a2 = 5;
b2 = 7;
y2 = a2*x2+b2+Noise;
optimal_params = fsolve(@(params) p2_4(params, y2, x2), initial_guess);  

a2_test = optimal_params(1);  
b2_test = optimal_params(2);  
disp(a2_test);
disp(b2_test);
