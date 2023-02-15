%% Experiment - 2
% Example - 2
clc;
clear;
figure;

%% Without using inbuilt function
n = -2 : 8;  % Discrete time index
x = [n == 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal
x1 = [0 0 x];  % x[n-1]
x2 = [0 x 0];  % x[n]
x3 = [x 0 0];  % x[n+1]
y = x2 + (x1 + x3) / 2;
y(1) = []; y(end) = [];

hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Bilinear interpolator response')
legend('Input x[n]', 'Output y[n]')
xlabel('n')
ylabel('Amplitude')
