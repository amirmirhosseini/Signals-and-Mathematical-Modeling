clear all;
tic;

load('DataFit.mat');

func = zeros(10, 10, 20);
r = 1;
s = 1;
t = 1;

for a0 = 0.1 : 0.1 : 1
    for w0 = 0 : pi : 10*pi
        for phi0 = 0 : pi/10 : 2*pi
            func(r, s, t) = sum((y - a0*sin(w0*x + phi0)).^2);
            t = plus(t, 1);
        end
        t = 1;
        s = plus(s, 1);
    end
    t = 1;
    s = 1;
    r = plus(r, 1);
end

[value, index] = min(func(:));
[r, s, t] = ind2sub(size(func), index);

start_a = (r-1)*0.1;
stop_a = (r+1)*0.1;
start_w = (s-2)*pi;
stop_w = s*pi;
start_phi = (t-2)*pi/10;
stop_phi = t*pi/10;
func = zeros(20, 20, 20);
r = 1;
s = 1;
t = 1;

for a0 = start_a : 0.01 : stop_a
    for w0 = start_w : pi/10 : stop_w
        for phi0 = start_phi : pi/100 : stop_phi
            func(r, s, t) = sum((y - a0*sin(w0*x + phi0)).^2);
            t = plus(t, 1);
        end
        t = 1;
        s = plus(s, 1);
    end
    t = 1;
    s = 1;
    r = plus(r, 1);
end

[value, index] = min(func(:));
[r, s, t] = ind2sub(size(func), index);

a0 = (r-1)*0.01 + start_a;
w0 = (s-1)*(pi/10) + start_w;
phi0 = (t-1)*(pi/100) + start_phi;

second_time = toc;
disp(second_time);
