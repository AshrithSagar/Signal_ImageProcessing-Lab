%% Experiment - 1
% Example - 2
clc;
clear;
figure;

n = -15 : 15;  % Discrete time index

%% Unit step sequence
delta_n = (n >= 0);
subplot(211);
stem(n, delta_n, 'filled')
title('Unit step sequence')
legend("u(n)")
xlabel('n')
ylabel('Amplitude')

%% Delayed Unit step sequence
DELAY = 5;
delta_n_delay = (n >= DELAY);
subplot(212);
stem(n, delta_n_delay, 'filled')
title('Unit sample sequence delayed by 5 units')
legend("u(n-5)")
xlabel('n')
ylabel('Amplitude')
