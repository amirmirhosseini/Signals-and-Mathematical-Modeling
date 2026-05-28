clc; clear
%%
syms x(t) y(t) t s;
D1x = diff(x(t),t);
D1y = diff(y(t),t);
D2y = diff(y(t),t,2);

eq = D2y+3*D1y+2*y(t)==x(t);
EQ = laplace(eq , t , s);
syms X(s) Y(s) yp_0;
EQ = subs(EQ , [laplace(y(t), t, s), laplace(x(t), t, s), subs(diff(y(t), t), t, 0)], [Y(s) X(s) yp_0]);
EQ = subs(EQ , [yp_0 , y(0)], [1 1]);
%%
x(t)=5; % خود متلب ۱ رو پله در نظر میگیره چون معکوس لاپلاس یک تقسیم بر اس رو گفت میشه ۱
X_S = laplace(x(t),t,s);
EQ2 = subs(EQ,X(s),X_S);
%%
syms tempY;
EQ3 = subs(EQ2,Y(s),tempY);
Y_S = solve(EQ3 , tempY);
clear EQ3 tempY;

y(t) = ilaplace(Y_S);
ts = 0.01;
yTs=[];
time = 0:0.01:10-0.01;
for i=time
    yTs = [yTs y(i)];
end
figure;
plot(time,yTs);
