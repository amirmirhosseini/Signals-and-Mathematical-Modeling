clc; clear
%%%
syms x(t)  y(t) t s;
syms B;
D1x = diff(x(t),t);
D1y = diff(y(t),t);
D2y = diff(y(t),t,2);

eq = x(t)-y(t)+B*(D1x-D1y) == D2y;

EQ = laplace(eq,t,s);
syms X(s) Y(s) H(s);
EQ = subs(EQ,[laplace(x(t),t,s) laplace(y(t),t,s)],[X(s) Y(s)]);
EQ = subs(EQ , [subs(diff(y(t), t), t, 0) , y(0) , x(0)] , [0 0 0]);
syms tempVar;
EQ2 = subs(EQ,X(s), tempVar);
X_S = solve(EQ2 , tempVar);

H(s) = Y(s)/X(s);
H(s) = subs(H(s) , X(s),  X_S);
H(s) = simplify(H(s));
%%
%%X(s)=1
HS1 = subs(H(s), B , 0);
Y1=HS1;
yt1 = ilaplace(Y1);
%%
HS2 = subs(H(s), B , 2);
Y2=HS2;
yt2 = ilaplace(Y2);
%%
HS3 = subs(H(s), B , 100);
Y3=HS3;
yt3 = ilaplace(Y3);