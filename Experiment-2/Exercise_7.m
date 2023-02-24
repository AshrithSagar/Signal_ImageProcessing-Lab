%% Experiment - 2
% Exercise - 7
clc;
clear;
figure;

n = 0 : 10;  % Discrete time index
x = [n == 0] + 3 * [n == 1] + 4 * [n == 3];  % Input signal
h = (0.5 .^ n) .* (ge(n, 0) - ge(n, 5));  % Impulse response

y = conv(x, h);  % System output

subplot(311)
stem(x, 'filled')
title('Input signal', 'Ashrith 200902016')
legend('x[n]'), xlabel('n'), ylabel('Amplitude')

subplot(312)
stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h[n]'), xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(y, 'filled')
title('Response of LSI system', 'Ashrith 200902016')
legend('y[n]'), xlabel('n'), ylabel('Amplitude')
