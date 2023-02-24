%% Experiment - 2
% Example - 8
clc;
clear;
figure;

%% M-point Moving Average Filter (Smoothing FIR Filter)
n = -50 : 100;  % Discrete time index
f_1 = 0.01;
f_2 = 0.95;

s_1 = cos(2 * pi * f_1 * n);  % Low frequency signal
s_2 = cos(2 * pi * f_2 * n);  % High frequency signal
x = s_1 + s_2;  % Input sequence

Ms = [3, 5, 7];  % M-point Moving Average
for M = Ms
	NUM = 1/M * ones(1, M);  % Numerator coefficients of T[z]
	DEN = [1];  % Denominator coefficients of T[z]

	h = impz(NUM, DEN);  % Impulse response
	y_M = conv(x, h);

	subplot(length(Ms), 1, find(M == Ms))
	hold on;
	stem(x, 'filled')
	stem(s_1, 'filled')
	stem(y_M, 'filled')
	hold off;
	legend('x', 's_1', 'y')
	title(M + "-point Moving Average Filter (Smoothing FIR Filter)", 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude')
end
