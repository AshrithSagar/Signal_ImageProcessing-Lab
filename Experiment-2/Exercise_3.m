%% Experiment - 2
% Exercise - 3
clc;
clear;
% figure;

n = -100 : 100;  % Discrete time index

NUM = [1, -0.8];  % Numerator coefficients of T[z]
DEN = [1, 1.5, 0.9];  % Denominator coefficients of T[z]

sys = filt(NUM, DEN)  % Define the system
[p, z] = pzmap(sys);  % Calculate poles and zeros
stable = all(abs(p) < 1)  % Check whether all poles lie within unit circle
