clc; clear; close all;

data = load("p2.mat");  
data
f=figure;
plot(data.t,data.x)
%%
plot(data.t,data.y)
%%
plot(data.x,data.y,'.')
%%
x = data.x; 
y = data.y; 
t = data.t; 

initial_guess = [1; 1]; 

optimal_params = fsolve(@(params) p2_4(params, y, x), initial_guess);  

a_optimal = optimal_params(1);  
b_optimal = optimal_params(2);  
disp(['Optimal a: ', num2str(a_optimal)]);  
disp(['Optimal b: ', num2str(b_optimal)]);  


figure;  
plot(t, y, 'o', 'DisplayName', 'Data y(t)');  
hold on;  
plot(t, a_optimal * x + b_optimal, 'r-', 'DisplayName', 'Fitted Line');  
xlabel('Time (t)');  
ylabel('Value');  
legend show;  
title('Data and Fitted Line');  
hold off;  

