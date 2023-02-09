%% Experiment - 1
% Example - 5
clc;
clear;
figure;

n = -25 : 25;  % Discrete time index

%% Sinusoidal sequence
F = 10;  % Frequency of the sequence
Fs = 200;  % Sampling frequency
f = F / Fs;  % Normalized frequency
A = 2;  % Amplitude
phi = pi/4;  % Phase shift (radians)
w = 2 * pi * f;  % Angular frequency (radians)
x = A * sin(w * n + phi);  % Sinusoidal sequence

plot(n, x)
title('Sinusoidal wave')
xlabel('n')
ylabel('Amplitude')
