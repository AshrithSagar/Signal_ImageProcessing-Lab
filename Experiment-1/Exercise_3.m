%% Experiment - 1
% Exercise - 3
clc;
clear;
figure;

L = 100;  % Length of the signal
n = 0 : L-1;  % Discrete time index

%% Uniformly distributed random signal
y = rand(1, L) * 4 - 2;

%% Plots
stem(n, y, 'filled')
title('Uniformly distributed random signal')
legend('y[n]')
xlabel('n')
ylabel('Amplitude')
