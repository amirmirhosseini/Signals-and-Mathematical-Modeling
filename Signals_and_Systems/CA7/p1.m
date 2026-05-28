clc; clear
syms i(t) Vin(t) R L C s
syms I(s) VIN(s)
%syms tau;

V_R = R * i(t);
V_L = L * diff(i(t), t);      
V_C = 1/C * int(i(t), t,-Inf,t);      

eqn = V_R + V_L + V_C == Vin(t);


EQN = laplace(eqn, t, s);
EQN = subs(EQN, laplace(i(t), t, s), I(s));
EQN = subs(EQN, laplace(Vin(t), t, s), VIN(s));
EQN = subs(EQN, laplace(int(i(t), t, -Inf, t), t, s), I(s)/s);

EQN = subs(EQN,i(0),0);
%EQN = simplify(EQN);

pretty(EQN)
EQN2 = isolate(EQN,I(s));
syms solveVar;
EQN3= subs(EQN2,I(s),solveVar);
I_S = solve(EQN3,solveVar);
clear EQN3;

syms Y(s) X(s) H(s);

Y(s)= laplace(V_C,t,s);
X(s)= laplace(Vin(t),t,s);
X(s) = subs(X(s), laplace(Vin(t), t, s), VIN(s));
Y(s) = subs(Y(s), laplace(int(i(t), t, -Inf, t), t, s), I(s)/s);

H(s)=Y(s)/X(s);
H(s)=subs(H(s),I(s),I_S);
%%
VIN(s) = 1/s;
%%C=4/3 ; L=0.25 ; R=1;
H(s) = subs(H(s), [C L R],[4/3 0.25 1]);
V_C_S = VIN(s)*H(s);
V_C_t = ilaplace(V_C_S);

%disp(simplify(H(s)));