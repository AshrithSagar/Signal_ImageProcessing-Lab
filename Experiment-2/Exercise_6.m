%% Experiment - 2
% Exercise - 6
clc;
clear;
figure;

%% (a)
n = 0 : 10;  % Discrete time index

NUM = [3, -2, 4];  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

subplot(211)
stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h')
xlabel('n')
ylabel('Amplitude')

%% (b)
n = 0 : 2;  % Discrete time index
x = [1, -1, 3];  % Input signal

NUM = [3, -2, 4];  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);  % Impulse response
y_c = conv(x, h);

y_f = filter(NUM, DEN, x);

subplot(212)
hold on
stem(y_c, 'filled')
stem(y_f, 'filled')
hold off
title('Response of LSI system', 'Ashrith 200902016')
legend('y_c', 'y_f')
xlabel('n')
ylabel('Amplitude')
