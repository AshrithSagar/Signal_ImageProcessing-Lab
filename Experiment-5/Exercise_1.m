%% Experiment - 5
% Exercise - 1
clc;
clear;

%% IIR Butterworth low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 40;  % Stop band peak ripple
f_p = 100;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 500;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'low');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
