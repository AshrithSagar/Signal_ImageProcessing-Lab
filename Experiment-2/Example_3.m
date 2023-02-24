%% Experiment - 2
% Example - 3
clc;
clear;
figure;

%% Linearity property of LSI systems
n = -100 : 100;  % Discrete time index
f_1 = 0.01;  % Normalised frequency 1
f_2 = 0.02;  % Normalised frequency 2
c_1 = 2;
c_2 = 3;

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

x_1 = cos(2 * pi * f_1 * n);
x_2 = cos(2 * pi * f_2 * n);
x = c_1 * x_1 + c_2 * x_2;  % Linear combination of x_1 and x_2

y_1 = filter(NUM, DEN, x_1);
y_2 = filter(NUM, DEN, x_2);
y_c = c_1 * y_1 + c_2 * y_2;  % Output of combined individual outputs

y = filter(NUM, DEN, x);  % Output of combined inputs
y_d = y - y_c;

hold on;
stem(n, y_c, 'filled')
stem(n, y, 'filled')
stem(n, y_d, 'filled')
hold off;
title('Linearity property of LSI systems', 'Ashrith 200902016')
legend('y_c', 'y', 'y_d')
xlabel('n'), ylabel('Amplitude')
