%% Experiment - 3
% Exercise - 4
clc;
clear;
figure;

%% Input signal
n = 1 : 100;  % Discrete time index
N = 2 * length(n) - 1;  % N in N-point DFT
c_1 = 2; c_2 = 2;
w_1 = 0.1; w_2 = 0.15;  % Normalised frequencies
x_1 = c_1 * sin(w_1 * n);
x_2 = c_2 * sin(w_2 * n);

subplot(211)
hold on;
stem(n, x_1)
stem(n, x_2)
hold off;
title("Input signals", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x_1[n]', 'x_2[n]')

%% Convolution property of DTFT
y_1 = fft(x_1, N);
y_2 = fft(x_2, N);

x_conv = conv(x_1, x_2);
y_x_conv = fft(x_conv, N);

y_y1_y2 = y_1 .* y_2;

window = 1 : N;
d = y_x_conv(window) - y_y1_y2(window);

subplot(212)
hold on;
stem(window, y_x_conv(window), 'b')
stem(window, d(window), 'r')
hold off;
title("Convolution property of DTFT", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('y_d', 'd')
