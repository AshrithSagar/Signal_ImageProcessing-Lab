%% Experiment - 5
% Exercise - 7
clc;
clear;

%% Input signal
F_s = 1000;  % Sampling frequency
n = 0 : 1/F_s : 1;
x_10 = sin(2 * pi * 10 * n);
x_30 = sin(2 * pi * 30 * n);
x_50 = sin(2 * pi * 50 * n);
x = x_10 + x_30 + x_50;

%% IIR Butterworth band-pass filter
r_p = 1;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = [29 31];  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = [25 40];  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn);  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth band-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")

%% Spectrum of input and filtered signal
y = filter(NUM, DEN, x);

figure;
subplot(211)
plot(n, abs(fft(x))); grid ON;
title("Mangnitude Spectrum of Input signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')

subplot(212)
plot(n, abs(fft(y))); grid ON;
title("Mangnitude Spectrum of Filtered signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')
