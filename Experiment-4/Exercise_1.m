%% Experiment - 4
% Exercise - 1
clc;
clear;
figure;

%% Low pass FIR filter design using the window method
w_p = 0.375;  % Pass band frequency
w_s = 0.5;  % Stop band frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_s - w_p));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, w_s, 'low', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]
freqz(NUM, DEN)  % Frequency response

figure;
H = freqz(NUM, DEN);  % Frequency response
plot(abs(H))  % Magnitude spectrum
title('Magnitude spectrum of Low pass FIR filter')
xlabel('n'), ylabel('Amplitude')
