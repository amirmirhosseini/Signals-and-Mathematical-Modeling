clc; clear; close all;

ts = 1e-9; T = 1e-5; tau = 1e-6;
C = physconst('LightSpeed');  
R = 450;
td = 2 * R / C;
fs = 1 / ts;
t = 0:ts:T;
signal = zeros(size(t));

for k = 0:1
    p_start = k * T;
    p_end = k * T + tau;
    ti = find((t >= p_start) & (t < p_end));   
    signal(ti) = 1;
end

figure;
plot(t, signal);
ylim([-1 1.5]);
xlim([0 T]);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

alphaa = 0.5;
td
rsignal = zeros(size(t));
rsignal(td*1e9:(td + tau)*1e9) = alphaa;

hold on;
plot(t, rsignal, 'LineWidth', 4, 'Color', 'r');
title('Transmitted Signal and Recieved Signal');
legend('Transmitted Signal', 'Recieved Signal');
%%
% محاسبه همبستگی
correlation = my_corr(signal, rsignal, ts);
td_plot = 3.002e-6;
R_plot = td_plot * physconst('lightspeed')/2;
%% noise افزایش nthroot
timelen=length(t);
err = zeros(1, timelen);

m = 0;
j=0;
while m < 10
    j = j+1;
    meanerr = zeros(1, 100);
    for n = 1:100   
        noise = nthroot(j, 5) * randn(1, timelen);
        [r, lag] = xcorr(signal, rsignal+noise);
        [~, index] = max(r);
        lag_max = lag(index);
        td = abs(lag_max)*ts;
        R_2 = td*physconst('lightspeed')/2;
        m = abs(450 - R_2);
        meanerr(n) = m;
    end
    err(j) = sum(meanerr)/100;
    m = sum(meanerr)/100;
    if m > 10
        break;
    end
end
plot(1:j, err(1:j));
%% noise افزایش خطی

err = zeros(1, timelen);

m = 0;
j=0;
while m < 10
    j = j+1;
    meanerr = zeros(1, 100);
    for n = 1:100   
        noise = j * randn(1, timelen);
        [r, lag] = xcorr(signal, rsignal+noise);
        [~, index] = max(r);
        lag_max = lag(index);
        td = abs(lag_max)*ts;
        R_2 = td*physconst('lightspeed')/2;
        m = abs(450 - R_2);
        meanerr(n) = m;
    end
    err(j) = sum(meanerr)/100;
    m = sum(meanerr)/100;
    if m > 10
        break;
    end
end
plot(1:j, err(1:j));






%%
function correlation = my_corr(signal, rsignal, ts)    
    len = length(signal);   
    correlation = zeros(1, 2 * len - 1);
    
    % محاسبه همبستگی برای هر lag
    for lag = 1:(2 * len - 1)  
        sumProd = 0;   
        
        for i = 1:len  
            index = i + lag - len;  
            if index > 0 && index <= len  
                sumProd = sumProd + signal(i) * rsignal(index);  
            end  
        end  
        
        correlation(lag) = sumProd;   
    end  
    
    disp('corr vals:');  
    disp(correlation);  
    
    % رسم همبستگی بر حسب lag
    lag_time = ((1:length(correlation)) - len) * ts; % تبدیل lag به زمان
    figure;
    plot(lag_time, correlation);
    title('Correlation');
    xlabel('Lag Time (s)');
    xlim([0 1e-5])
    ylabel('Correlation Value');

end  


