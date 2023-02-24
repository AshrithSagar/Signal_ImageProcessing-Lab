%% Experiment - 2
% Example - 2
clc;
clear;
figure;

%% Without using inbuilt function
n = -5 : 15;  % Discrete time index
x = [n == 0] + 2 * [n == 4] - 3 * [n == 8];  % Input signal
x1 = [0 0 x];  % x[n-1]
x2 = [0 x 0];  % x[n]
x3 = [x 0 0];  % x[n+1]
y = x2 + (x1 + x3) / 2;
y(1) = []; y(end) = [];

subplot(211)
hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Bilinear interpolator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')

%% With using inbuilt function
n = -5 : 15;  % Discrete time index
x = [n == 0] + 2 * [n == 4] - 3 * [n == 8];  % Input signal
y = filter([1/2, 1, 1/2], [1], x);
y(end+1) = 0;
y = y(2:end);  % Left shift by 1 unit

subplot(212)
hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Bilinear interpolator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')
