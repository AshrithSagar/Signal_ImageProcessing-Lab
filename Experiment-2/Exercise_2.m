%% Experiment - 2
% Exercise - 2
clc;
clear;
figure;

n = -100 : 100;  % Discrete time index

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
