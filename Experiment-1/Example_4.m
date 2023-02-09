%% Experiment - 1
% Example - 4
clc;
clear;
figure;

%% Input signals
L = 50;  % Sequence length
r = rand(1, L);  % Uniformly distributed random sequence
d = 0.8 * (r - 0.5);  % Random noise
n = 0 : 1 : L-1;  % Discrete time index
s = 2 * n .* (0.9 .^ n);  % Uncorrupted signal
x = s + d;  % Noise corrupted signal

subplot(211);
plot(n, d, 'b', n, s, 'g', n, x, 'r')
title('Input signal')
legend('d[n]', 's[n]', 'x[n]')
xlabel('n')
ylabel('Amplitude')

%% Three-point moving average algorithm
x1 = [0 0 x];  % x[n-1]
x2 = [0 x 0];  % x[n]
x3 = [x 0 0];  % x[n+1]
y = 1/3 * (x1 + x2 + x3);  % Three-point moving average
y(1) = []; y(end) = [];

subplot(212);
plot(n, y, 'b', n, s, 'g')
title('Three-point moving average algorithm')
legend('y[n]', 's[n]')
xlabel('n')
ylabel('Amplitude')
