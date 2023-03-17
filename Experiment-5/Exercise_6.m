%% Experiment - 5
% Exercise - 6
clc;
clear;

%% IIR Chebyshev high-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple (dB)
r_s = 80;  % Stop band peak ripple (dB)
f_p = 2000;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 100;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p, 'high');  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Chebyshev high-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
