# Experiment-1

## Examples

### Example-1

```matlab%% Experiment - 1
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
```

### Example-2

```matlab%% Experiment - 1
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
```

### Example-3

```matlab%% Experiment - 1
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
```

### Example-4

```matlab%% Experiment - 1
% Example - 4
clc;
clear;
figure;

%% Input signals
L = 50;  % Sequence length
r = rand(1, L);  % Uniformly distributed random sequence
d = 0.8 * (r - 0.5);  % Random noise
n = 0 : 1 : L-1;  % Discrete time index
s = 2 * n .* (0.9 .^ n);  % Uncorrupted signal
x = s + d;  % Noise corrupted signal

subplot(211);
plot(n, d, 'b', n, s, 'g', n, x, 'r')
title('Input signal')
legend('d[n]', 's[n]', 'x[n]')
xlabel('n')
ylabel('Amplitude')

%% Three-point moving average algorithm
x1 = [0 0 x];  % x[n-1]
x2 = [0 x 0];  % x[n]
x3 = [x 0 0];  % x[n+1]
y = 1/3 * (x1 + x2 + x3);  % Three-point moving average
y(1) = []; y(end) = [];

subplot(212);
plot(n, y, 'b', n, s, 'g')
title('Three-point moving average algorithm')
legend('y[n]', 's[n]')
xlabel('n')
ylabel('Amplitude')
```

### Example-5

```matlab%% Experiment - 1
% Example - 5
clc;
clear;
figure;

n = -25 : 25;  % Discrete time index

%% Sinusoidal sequence
F = 10;  % Frequency of the sequence
Fs = 200;  % Sampling frequency
f = F / Fs;  % Normalized frequency
A = 2;  % Amplitude
phi = pi/4;  % Phase shift (radians)
w = 2 * pi * f;  % Angular frequency (radians)
x = A * sin(w * n + phi);  % Sinusoidal sequence

hold on;
plot(n, x, 'b:')
stem(n, x, 'b', 'filled')
hold off;
title('Sinusoidal wave')
xlabel('n')
ylabel('Amplitude')
```

## Exercises

### Exercise-1

```matlab%% Experiment - 1
% Exercise - 1
clc;
clear;
figure;

n = -15 : 15;  % Discrete time index
F_s = 500;  % Sampling frequency

%% Frequency 20 Hz
F = 20;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_20 = sin(w * n);

%% Frequency 30 Hz
F = 30;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_30 = sin(w * n);

%% Frequency 40 Hz
F = 40;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_40 = sin(w * n);

%% Plots
subplot(211)
plot(n, y_20, 'b', n, y_30, 'g', n, y_40, 'r')
title('Sinusoidal signals')
legend('20Hz', '30Hz', '40Hz')
xlabel('n')
ylabel('Amplitude')

subplot(212)
hold on;
stem(n, y_20, 'b', 'filled')
stem(n, y_30, 'g', 'filled')
stem(n, y_40, 'r', 'filled')
hold off;
title('Sinusoidal signals')
legend('20Hz', '30Hz', '40Hz')
xlabel('n')
ylabel('Amplitude')
```

### Exercise-2

```matlab%% Experiment - 1
% Exercise - 2
clc;
clear;
figure;

n = -25 : 25;  % Discrete time index
F_s = 500;  % Sampling frequency

%% Frequency 10 Hz
F = 10;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_10 = sin(w * n);

%% Frequency 30 Hz
F = 30;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_30 = sin(w * n);

%% Frequency 60 Hz
F = 60;  % Frequency of the signal
f_n = F / F_s;  % Normalised frequency
w = 2 * pi * f_n;  % Angular frequency
y_60 = sin(w * n);

%% Plots
y = y_10 + y_30 + y_60;
stem(n, y, 'filled')
title('Superposition of Sinusoidal signals')
legend('10Hz + 30Hz + 60Hz')
xlabel('n')
ylabel('Amplitude')
```

### Exercise-3

```matlab%% Experiment - 1
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
```

### Exercise-4

```matlab%% Experiment - 1
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
```

### Exercise-5

```matlab%% Experiment - 1
% Exercise - 5
clc;
clear;
figure;

%% Input signals
L = 50;  % Sequence length
r = rand(1, L);  % Uniformly distributed random sequence
d = 0.8 * (r - 0.5);  % Random noise
n = 0 : 1 : L-1;  % Discrete time index
s = 2 * n .* (0.9 .^ n);  % Uncorrupted signal
x = s + d;  % Noise corrupted signal

%% 3-point moving average algorithm
x_1 = [0 0 x];  % x[n-1]
x_2 = [0 x 0];  % x[n]
x_3 = [x 0 0];  % x[n+1]

y_3 = 1/3 * (x_1 + x_2 + x_3);
y_3(1) = []; y_3(end) = [];

%% 5-point moving average algorithm
x_1 = [0 0 0 0 x];  % x[n-2]
x_2 = [0 0 0 x 0];  % x[n-1]
x_3 = [0 0 x 0 0];  % x[n]
x_4 = [0 x 0 0 0];  % x[n+1]
x_5 = [x 0 0 0 0];  % x[n+2]

y_5 = 1/5 * (x_1 + x_2 + x_3 + x_4 + x_5);
y_5(1) = []; y_5(1) = [];
y_5(end) = []; y_5(end) = [];

%% Plots
subplot(411)
plot(n, x)
title('Input signal')
xlabel('n')
ylabel('Amplitude')

subplot(412)
plot(n, y_3, 'b', n, x, 'r')
title('3-point moving average algorithm')
legend('3-point', 'Input')
xlabel('n')
ylabel('Amplitude')

subplot(413)
plot(n, y_5, 'c', n, x, 'r')
title('5-point moving average algorithm')
legend('5-point', 'Input')
xlabel('n')
ylabel('Amplitude')

subplot(414)
plot(n, y_3, 'b', n, y_5, 'c', n, x, 'r')
title('Moving average algorithms')
legend('3-point', '5-point', 'Input')
xlabel('n')
ylabel('Amplitude')
```

