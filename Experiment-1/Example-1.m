%% Experiment - 1
% Example - 1
clc;
clear;
figure;

%% Unit Sample Sequence
n = -100: 100;  % Discrete Time Index
delta_n = (n == 0);
subplot(211);
stem(n, delta_n,'filled')
legend("delta(n)")

%% Delayed Unit sample sequence
DELAY = 5;
delta_n_delay = (n == DELAY);
subplot(212);
stem(n, delta_n_delay,'filled')
legend("delta(n-5)")
