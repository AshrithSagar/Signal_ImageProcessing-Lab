%% Experiment - 4
% Exercise - 5
clc;
clear;
figure;

%% (a) Simulate the signal having frequencies 10Hz, 30Hz and 50Hz.
n = 1 : 100;  % Discrete time index
s_10 = sin(10 * n);
s_30 = sin(30 * n);
s_50 = sin(50 * n);
x = s_10 + s_30 + s_50;

%% (b) Design suitable FIR filter to select only 30Hz component (Use Hamming window).
Fs = 200;  % Sampling frequency
w_lp = 20 / Fs;  % Lower pass band edge frequency
w_ls = 10 / Fs;  % Lower stop band edge frequency
w_up = 40 / Fs;  % Upper pass band edge frequency
w_us = 50 / Fs;  % Upper stop band edge frequency
w_lc = w_ls + (w_lp - w_ls) / 2;  % Lower cutoff frequency
w_uc = w_up + (w_up - w_up) / 2;  % Upper cutoff frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_us - w_up));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc, w_uc], 'bandpass', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]
freqz(NUM, DEN)  % Frequency response

%% (c) Filter the signal using the designed filter.
y = filter(NUM, DEN, x);

figure;
plot(y)
title('Filter output')
xlabel('n'), ylabel('Amplitude'), legend('y')

%% (d) Plot the spectrum of the input and the filtered signal.
figure;

subplot(211)
hold on;
plot(abs(y))
plot(abs(x))
hold off;
title('Magnitude spectrum')
xlabel('frequency'), ylabel('Gain'), legend('y', 'x')

subplot(212)
hold on;
plot(angle(y))
plot(angle(x))
hold off;
title('Phase spectrum')
xlabel('frequency'), ylabel('Gain'), legend('y', 'x')
