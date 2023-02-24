%% Experiment - 3
% Exercise - 5
clc;
clear;
figure;

%% Input signal
n = 1 : 200;  % Discrete time index
N = length(n);  % N in N-point DFT
F_s = 200;  % Sampling frequency
F = 30;  % Frequency
f = F / F_s;  % Normalised frequency
x = sin(f * n);

subplot(311)
stem(n, x)
title("Input signal x[n]", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Discrete Fourier Transform
y = fft(x, N);

subplot(312)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')
