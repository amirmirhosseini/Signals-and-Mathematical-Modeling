f = figure;
t = 0:2*pi/100:2*pi;
plot(t,sin(t))
hold on
plot(t,cos(t) ,'--r')
ylabel('Function value')
xlabel({'time','0 \leq t \leq 2\pi'})
title('Sin and Cos functions','Color','red')
legend('Sin','Cos')
xlim([0 2*pi])
ylim([-1.4 1.4])
