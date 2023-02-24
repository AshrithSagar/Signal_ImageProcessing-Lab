%% Experiment - 4
% Exercise - 4
clc;
clear;
figure;

%% Band stop FIR filter design using the window method
Fs = 2000;  % Sampling frequency
w_lp = 200 / Fs;  % Lower pass band edge frequency
w_ls = 300 / Fs;  % Lower stop band edge frequency
w_up = 700 / Fs;  % Upper pass band edge frequency
w_us = 600 / Fs;  % Upper stop band edge frequency
w_lc = w_lp + (w_ls - w_lp) / 2;  % Lower cutoff frequency
w_uc = w_us + (w_up - w_us) / 2;  % Upper cutoff frequency
% Stop band attenuation = 50dB

k = 4;  % Hamming window
N = floor((2 * k * pi) / (w_up - w_us));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc, w_uc], 'stop', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]
freqz(NUM, DEN)  % Frequency response

figure;
H = freqz(NUM, DEN);  % Frequency response
plot(abs(H))  % Magnitude spectrum
title('Magnitude spectrum of Band stop FIR filter')
xlabel('frequency'), ylabel('Gain')
