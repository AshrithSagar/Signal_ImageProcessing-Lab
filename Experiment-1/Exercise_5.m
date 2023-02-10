%% Experiment - 1
% Exercise - 5
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

%% 3-point moving average algorithm
x_1 = [0 0 x];  % x[n-1]
x_2 = [0 x 0];  % x[n]
x_3 = [x 0 0];  % x[n+1]

y_3 = 1/3 * (x_1 + x_2 + x_3);
y_3(1) = []; y_3(end) = [];

%% 5-point moving average algorithm
x_1 = [0 0 0 0 x];  % x[n-2]
x_2 = [0 0 0 x 0];  % x[n-1]
x_3 = [0 0 x 0 0];  % x[n]
x_4 = [0 x 0 0 0];  % x[n+1]
x_5 = [x 0 0 0 0];  % x[n+2]

y_5 = 1/5 * (x_1 + x_2 + x_3 + x_4 + x_5);
y_5(1) = []; y_5(1) = [];
y_5(end) = []; y_5(end) = [];

%% Plots
subplot(411)
plot(n, x)
title('Input signal')
xlabel('n')
ylabel('Amplitude')

subplot(412)
plot(n, y_3, 'b', n, x, 'r')
title('3-point moving average algorithm')
legend('3-point', 'Input')
xlabel('n')
ylabel('Amplitude')

subplot(413)
plot(n, y_5, 'c', n, x, 'r')
title('5-point moving average algorithm')
legend('5-point', 'Input')
xlabel('n')
ylabel('Amplitude')

subplot(414)
plot(n, y_3, 'b', n, y_5, 'c', n, x, 'r')
title('Moving average algorithms')
legend('3-point', '5-point', 'Input')
xlabel('n')
ylabel('Amplitude')
