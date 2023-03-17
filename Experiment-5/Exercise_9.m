%% Experiment - 5
% Exercise - 9
clc;
clear;

%% IIR Butterworth low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 40;  % Stop band peak ripple
f_p = 100;  w_p = 2 * pi * f_p / F_s;  % Pass band edge frequency
f_s = 500;  w_s = 2 * pi * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s, 's');  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'low');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of analog IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

%% Bilinear transformation
[NUMd,DENd] = bilinear(NUM, DEN, F_s);

[H, W] = freqz(NUMd, DENd);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of digital IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUMd, DENd);
title("Pole-Zero Plot", "Ashrith 200902016")
