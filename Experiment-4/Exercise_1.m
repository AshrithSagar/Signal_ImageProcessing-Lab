%% Experiment - 4
% Exercise - 1
clc;
clear;

%% Low pass FIR filter design using the window method
w_p = 0.375;  % Pass band frequency
w_s = 0.5;  % Stop band frequency
w_c = w_p + (w_s - w_p) / 2;  % Cut-off frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_s - w_p));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, w_c, 'low', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response
figure;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of Low pass FIR filter'); grid ON;
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)')

figure;
zplane(NUM, DEN)
