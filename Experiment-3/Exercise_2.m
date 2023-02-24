%% Experiment - 3
% Exercise - 2
clc;
clear;
figure;

%% Input signal
N = 400;  % N in N-point DFT
n = 1 : N;  % Discrete time index
w = 1 : N;  % Discrete frequency index
c_1 = 2; c_2 = 2;
w_1 = 0.01; w_2 = 0.09;  % Normalised frequencies
x = c_1 * sin(w_1 * n) + c_2 * sin(w_2 * n);

subplot(211)
stem(n, x)
title("Input signal x[n] = c_1sin(w_1n)+c_2sin(w_2n)", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Time-shifting property of DTFT
k = 10;  % Delay
x_d = x(k+1 : end);  % Delayed input signal
y_di = fft(x_d, N);

y = fft(x, N);
y_d = exp(-i * k .* w) .* y;

window = 1 : length(n) - k;
d = y_d(window) - y_di(window);

subplot(212)
hold on;
stem(window, y_d(window), 'b')
stem(window, d(window), 'r')
hold off;
title("Time-shifting property of DTFT", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('y_d', 'd')
