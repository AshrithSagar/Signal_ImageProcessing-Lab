%% Experiment - 3
% Exercise - 1
clc;
clear;
figure;

%% Input signal
n = 1 : 200;  % Discrete time index
N = length(n);  % N in N-point DFT
c_1 = 2; c_2 = 2;
w_1 = 0.01; w_2 = 0.05;
x = c_1 * sin(w_1 * n) + c_2 * sin(w_2 * n);

subplot(311)
stem(n, x)
title("Input signal x[n] = c_1sin(w_1n)+c_2sin(w_2n)", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Fourier transform
y = fft(x, N);

subplot(312)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')
