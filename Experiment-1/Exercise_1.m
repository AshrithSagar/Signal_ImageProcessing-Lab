%% Experiment - 1
% Exercise - 1
clc;
clear;
figure;

n = -15 : 15;  % Discrete time index
F_s = 500;  % Sampling frequency

%% Frequency 20 Hz
F = 20;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_20 = sin(w * n);

%% Frequency 30 Hz
F = 30;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_30 = sin(w * n);

%% Frequency 40 Hz
F = 40;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_40 = sin(w * n);

%% Plots
subplot(211)
plot(n, y_20, 'b', n, y_30, 'g', n, y_40, 'r')
title('Sinusoidal signals')
legend('20Hz', '30Hz', '40Hz')
xlabel('n')
ylabel('Amplitude')

subplot(212)
hold on;
stem(n, y_20, 'b', 'filled')
stem(n, y_30, 'g', 'filled')
stem(n, y_40, 'r', 'filled')
hold off;
title('Sinusoidal signals')
legend('20Hz', '30Hz', '40Hz')
xlabel('n')
ylabel('Amplitude')
