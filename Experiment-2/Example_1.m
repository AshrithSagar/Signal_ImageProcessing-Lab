%% Experiment - 2
% Example - 1
clc;
clear;
figure;

%% Without using inbuilt function
n = -5 : 10; % Discrete time index
x = [n >= 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal

y = 0;  % y[-1] = 0
for k = 1 : length(n)
	term = y(end) + x(k);
	y = [y term];
end
y = y(2:end);  % Left shift by 1 unit

subplot(211)
hold on;
stem(x, 'filled')
stem(y, 'filled')
hold off;
title('Accumulator response', 'Ashrith 20092016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')

%% With using inbuilt function
n = -5 : 10; % Discrete time index
x = [n >= 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal

y = filter([1], [1, -1], x);

subplot(212)
hold on;
stem(x, 'filled')
stem(y, 'filled')
hold off;
title('Accumulator response', 'Ashrith 20092016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')
