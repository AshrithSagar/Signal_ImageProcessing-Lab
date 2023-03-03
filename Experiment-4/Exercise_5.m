%% Experiment - 4
% Exercise - 5
clc;
clear;

%% (a) Simulate the signal having frequencies 10Hz, 30Hz and 50Hz.
Fs = 1024;  % Sampling frequency
n_max = 5;
n = 0 : 1/Fs : n_max - 1;  % Discrete time index
s_10 = sin(2 * pi * 10 * n);
s_30 = sin(2 * pi * 30 * n);
s_50 = sin(2 * pi * 50 * n);
x = s_10 + s_30 + s_50;

%% (b) Design suitable FIR filter to select only 30Hz component (Use Hamming window).
w_lp = 2 * pi * 28 / Fs;  % Lower pass band edge frequency
w_ls = 2 * pi * 29 / Fs;  % Lower stop band edge frequency
w_up = 2 * pi * 31 / Fs;  % Upper pass band edge frequency
w_us = 2 * pi * 32 / Fs;  % Upper stop band edge frequency
w_lc = w_ls + (w_lp - w_ls) / 2;  % Lower cutoff frequency
w_uc = w_up + (w_us - w_up) / 2;  % Upper cutoff frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_us - w_up));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc / pi, w_uc / pi], 'bandpass', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);

%% (c) Filter the signal using the designed filter.
y = filter(NUM, DEN, x);

figure;
hold on
plot(y, 'b')
plot(x, 'r')
hold off
title('Filter output', "Ashrith 200902016");
xlabel('n'), ylabel('Amplitude'), legend('y', 'x')

%% (d) Plot the spectrum of the input and the filtered signal.

figure;
hold on
plot(n * Fs / n_max, abs(fft(y)), 'b')
plot(n * Fs / n_max, abs(fft(x)), 'r')
hold off
title('Fourier Transform', "Ashrith 200902016");
xlabel('Frequency'), ylabel('Magnitude'), legend('y', 'x')
