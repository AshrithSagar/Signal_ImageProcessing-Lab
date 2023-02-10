%% Experiment - 1
% Exercise - 4
clc;
clear;
figure;

%% (a)
n = -10 : 10;  % Discrete time index
u_n = [n >= 0];  % Unit step sequence
x_a = sin(pi/3 * n) .* u_n;

subplot(411)
hold on;
stem(n, x_a, 'filled')
plot(n, x_a, 'b:')
hold off;
title('x_a[n] = sin(pi/3 * n) * u[n]')
xlabel('n')
ylabel('Amplitude')

%% (b)
n = -10 : 10;  % Discrete time index
x_b = (0.5 .^ n) .* exp(i * pi / 2 * n);
magnitude = abs(x_b);
phase = angle(x_b);

subplot(412)
hold on;
stem(n, magnitude, 'b', 'filled')
stem(n, phase, 'g', 'filled')
plot(n, magnitude, 'b:', n, phase, 'g:')
hold off;
title('x_b[n] = 0.5^n * exp(i * pi/2 * n)')
legend('Magnitude', 'Phase')
xlabel('n')
ylabel('Amplitude')

%% (c)
n = 0 : 20;  % Discrete time index
x_c = 10 * exp(-0.3 * (n - 10)) .* [(n >= 10) - (n >= 20)];

subplot(413)
hold on;
stem(n, x_c, 'filled')
plot(n, x_c, 'b:')
hold off;
title('x_c[n] = 10 * exp(-0.3 * (n-10)) * (u[n-10] - u[n-20])')
xlabel('n')
ylabel('Amplitude')

%% (d)
n = -5 : 5;  % Discrete time index
x_d = 2 * (n == -2) - (n == 4);

subplot(414)
hold on;
stem(n, x_d, 'filled')
plot(n, x_d, 'b:')
hold off;
title('x_d[n] = 2*\delta(n+2) - \delta(n-4)')
xlabel('n')
ylabel('Amplitude')
