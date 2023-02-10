%% Experiment - 1
% Exercise - 2
clc;
clear;
figure;

n = -25 : 25;  % Discrete time index
F_s = 500;  % Sampling frequency

%% Frequency 10 Hz
F = 10;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_10 = sin(w * n);

%% Frequency 30 Hz
F = 30;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_30 = sin(w * n);

%% Frequency 60 Hz
F = 60;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_60 = sin(w * n);

%% Plots
y = y_10 + y_30 + y_60;
stem(n, y, 'filled')
title('Superposition of Sinusoidal signals')
legend('10Hz + 30Hz + 60Hz')
xlabel('n')
ylabel('Amplitude')
