%% Experiment - 4
% Exercise - 3
clc;
clear;
figure;

%% Band pass FIR filter design using the window method
Fs = 2000;  % Sampling frequency
w_lp = 300 / Fs;  % Lower pass band edge frequency
w_ls = 200 / Fs;  % Lower stop band edge frequency
w_up = 600 / Fs;  % Upper pass band edge frequency
w_us = 700 / Fs;  % Upper stop band edge frequency
w_lc = w_ls + (w_lp - w_ls) / 2;  % Lower cutoff frequency
w_uc = w_up + (w_up - w_up) / 2;  % Upper cutoff frequency
% Stop band attenuation = 50dB

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_us - w_up));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc, w_uc], 'bandpass', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]
freqz(NUM, DEN)  % Frequency response

figure;
H = freqz(NUM, DEN);  % Frequency response
plot(abs(H))  % Magnitude spectrum
title('Magnitude spectrum of Band pass FIR filter')
xlabel('frequency'), ylabel('Gain')
