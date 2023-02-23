%% Experiment - 2
% Example - 7
clc;
clear;
figure;

%% Input signals
n = -20 : 20;  % Discrete time index
u = ge(n, 0);
u5 = ge(n, 5);
u10 = ge(n, 10);
u_1 = ge(n, -1);

x1 = u - u10;
x2 = u_1 - u5;

%% Convolution (x1 * x2), using conv()
x_12 = conv(x1, x2);
subplot(211)
stem(x_12, 'k')
xlabel('n'), ylabel('Amplitude'), title('x[n] = x1[n] \ast x2[n]')

%% Convolution (x1 * x2), using conv()
x_21 = conv(x2, x1);
subplot(212)
stem(x_21, 'k')
xlabel('n'), ylabel('Amplitude'), title('x[n] = x2[n] \ast x1[n]')
