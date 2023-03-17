%% Experiment - 5
% Exercise - 10
clc;
clear;

%% IIR Chebyshev low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 80;  % Stop band peak ripple
f_p = 100;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 2000;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p, 'low');  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of analog IIR Chebyshev low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

%% Bilinear transformation
[NUMd,DENd] = bilinear(NUM, DEN, F_s);

[H, W] = freqz(NUMd, DENd);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of digital IIR Chebyshev low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUMd, DENd);
title("Pole-Zero Plot", "Ashrith 200902016")
