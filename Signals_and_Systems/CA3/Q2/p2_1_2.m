clear all;

tic;

load('DataFit.mat');

a0 = 0.01:0.01:1;
w0 = 0:pi/10:10*pi;
phi0 = 0:pi/100:2*pi;

numA0 = length(a0);
numW0 = length(w0);
numPhi0 = length(phi0);

result = zeros(numA0, numW0, numPhi0);

for i = 1:numA0
    amplitude = a0(i);
    for j = 1:numW0
        frequency = w0(j);
        for k = 1:numPhi0
            phase = phi0(k);
            sineValue = amplitude * sin(frequency * x + phase);
            result(i, j, k) = sum((y - sineValue).^2);
        end
    end
end

[value, index] = min(result(:));
[i, j, k] = ind2sub(size(result), index);

amplitude = a0(i);
frequency = w0(j);
phase = phi0(k);

executionTime = toc;
