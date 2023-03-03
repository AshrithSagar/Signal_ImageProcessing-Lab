%% Experiment - 4
% Exercise - 2
clc;
clear;

%% High pass FIR filter design using the window method
w_s = 0.2;  % Stop band frequency
w_p = 0.3;  % Pass band frequency
w_c = w_s + (w_p - w_s) / 2;  % Cut-off frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_p - w_s));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, w_s, 'high', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response

figure; grid ON;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of High pass FIR filter', "Ashrith 200902016");
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)');

figure;
zplane(NUM, DEN)
