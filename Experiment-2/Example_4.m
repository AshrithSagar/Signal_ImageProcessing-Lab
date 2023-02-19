%% Experiment - 2
% Example - 4
clc;
clear;
figure;

%% Shift Invariant property of LSI systems
n = 0 : 100;  % Discrete time index
k = 10;  % Delay

c_1 = 2;
c_2 = 3;
f_1 = 0.01;
f_2 = 0.02;

x = c_1 * cos(2 * pi * f_1 * n) + c_1 * cos(2 * pi * f_2 * n);  % Input sequence
x_d = x(k+1:end);  % Delayed input sequence

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

y = filter(NUM, DEN, x);  % Response of system for input sequence
y_d = y(k+1:end);  % Delayed response sequence
y_di = filter(NUM, DEN, x_d);  % Response of system for delayed input
d = y_d - y_di;  % Difference

hold on;
stem(y_di, 'filled')
stem(y_d, 'filled')
stem(d, 'filled')
hold off;
title('Shift Invariant property of LSI systems')
legend('y_{di}', 'y_d', 'd')
xlabel('n')
ylabel('Amplitude')
