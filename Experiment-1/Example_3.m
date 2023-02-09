%% Experiment - 1
% Example - 3
clc;
clear;
figure;

n = -25 : 25;  % Discrete time index

%% Complex exponential sequence
k = 2;
c = -1/12 + i * pi/6;
x = k * exp(c*n);
xr = real(x);  % Real part
xi = imag(x);  % Imaginary part
m = abs(x);  % Magnitude

subplot(311);
stem(n, xr, 'filled')
title('Real part of Complex Exponential Sequence')
xlabel('n')
ylabel('Amplitude')

subplot(312);
stem(n, xi, 'filled')
title('Imaginary part of Complex Exponential Sequence')
xlabel('n')
ylabel('Amplitude')

subplot(313);
stem(n, m, 'filled')
title('Magnitude of Complex Exponential Sequence')
xlabel('n')
ylabel('Amplitude')
