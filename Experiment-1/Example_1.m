%% Experiment - 1
% Example - 1
clc;
clear;
figure;

n = -15 : 15;  % Discrete time index

%% Unit sample sequence
delta_n = (n == 0);
subplot(211);
stem(n, delta_n, 'filled')
title('Unit sample sequence')
legend("delta(n)")
xlabel('n')
ylabel('d')

%% Delayed Unit sample sequence
DELAY = 5;
delta_n_delay = (n == DELAY);
subplot(212);
stem(n, delta_n_delay, 'filled')
title('Unit sample sequence delayed by 5 units')
legend("delta(n-5)")
xlabel('n')
ylabel('Amplitude')
