%% Experiment - 2
% Example - 1
clc;
clear;
figure;

%% With using inbuilt function
n = 0 : 10; % Discrete time index
x = [n >= 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal
y = filter([1], [1, -1], x);

hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Accumulator response')
legend('Input x[n]', 'Output y[n]')
xlabel('n')
ylabel('Amplitude')
