%% Experiment - 2
% Exercise - 5
clc;
clear;
figure;

%% (a)
n = -100 : 100;  % Discrete time index

NUM_a = [1, 2];  % Numerator coefficients of T[z]
DEN_a = [1, 0.8, 0.12];  % Denominator coefficients of T[z]

h_a = impz(NUM_a, DEN_a);

subplot(211)
stem(h_a, 'filled')
title('(a) Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')

%% (b)
n = -100 : 100;  % Discrete time index

NUM_b = [1, 1];  % Numerator coefficients of T[z]
DEN_b = [1, -0.2, -0.15];  % Denominator coefficients of T[z]

h_b = impz(NUM_b, DEN_b);

subplot(212)
stem(h_b, 'filled')
title('(b) Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
