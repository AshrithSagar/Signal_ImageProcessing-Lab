%% Experiment - 2
% Exercise - 4
clc;
clear;
figure;

n = -100 : 100;  % Discrete time index

NUM = [1, -4, 3];  % Numerator coefficients of T[z]
DEN = [1, -1.7, 1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

sys = filt(NUM, DEN)  % System
[p, z] = pzmap(sys);  % Poles and Zeros
stable = all(abs(p) < 1)  % Check whether all poles lie within unit circle

stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h')
xlabel('n')
ylabel('Amplitude')
