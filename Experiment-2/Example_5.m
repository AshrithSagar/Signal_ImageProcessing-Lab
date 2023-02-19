%% Experiment - 2
% Example - 5
clc;
clear;
figure;

%% M-point Moving Average Filter (Smoothing FIR Filter)
n = -50 : 100;  % Discrete time index
f_1 = 0.01;
f_2 = 0.99;

s_1 = cos(2 * pi * f_1 * n);  % Low frequency signal
s_2 = cos(2 * pi * f_2 * n);  % High frequency signal
x = s_1 + s_2;  % Input sequence

M = 5;  % M-point Moving Average
NUM = 1/M * ones(1, M);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

y_M = filter(NUM, DEN, x);

hold on;
stem(n, x, 'filled')
stem(n, s_1, 'filled')
stem(n, y_M, 'filled')
legend('x', 's_1', 'y')
hold off;
