clear all;
td  = 0.01;
t = 0:td:1;

a = ramp(t) - ramp(t-1) - heaviside(t - 1);
b = ramp(-t+1) - ramp(-t) - heaviside(-t);
c = 0.5 * (heaviside(t) - heaviside(t - 1));

figure;
xlim([0 2])
xlim([0 0.3])
subplot(4,3,1);
plot(t , a);
title("a");
subplot(4,3,2);
plot(t , b);
title("b");
subplot(4,3,3);
plot(t , c);
title("c");
y_1 = conv(a, a) * td;
y_2 = conv(a, b) * td;
y_3 = conv(a, c) * td;
y_4 = conv(b, a) * td;
y_5 = conv(b, b) * td;
y_6 = conv(b, c) * td;
y_7 = conv(c, a) * td;
y_8 = conv(c, b) * td;
y_9 = conv(c, c) * td;
t_conv = 0:0.01:(length(y_1)-1) * td;
subplot(4,3,4);
plot(t_conv ,y_1 );
title("conv(a, a)");
subplot(4,3,5);
plot(t_conv , y_2);
title("conv(a, b)");
subplot(4,3,6);
plot(t_conv ,y_3 );
title("conv(a, c)");
subplot(4,3,7);
plot(t_conv , y_4);
title("conv(b, a)");
subplot(4,3,8);
plot(t_conv ,y_5 );
title("conv(b, b)");
subplot(4,3,9);
plot(t_conv , y_6);
title("conv(b, c)");
subplot(4,3,10);
plot(t_conv ,y_7 );
title("conv(c, a)");
subplot(4,3,11);
plot(t_conv , y_8);
title("conv(c, b)");
subplot(4,3,12);
plot(t_conv ,y_9 );
title("conv(c, c)");


function y = ramp(t)
    y = zeros(size(t));
    for i = 1:length(t)
        if t(i) >= 0
            y(i) = t(i);
        else
            y(i) = 0;
        end
    end
end


