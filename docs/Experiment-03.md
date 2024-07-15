# Experiment-3

## Exercises

### Exercise-1

```matlab
%% Experiment - 3
% Exercise - 1
clc;
clear;
figure;

%% Input signal
n = 1 : 200;  % Discrete time index
N = length(n);  % N in N-point DFT
c_1 = 2; c_2 = 2;
w_1 = 0.01; w_2 = 0.05;
x = c_1 * sin(w_1 * n) + c_2 * sin(w_2 * n);

subplot(311)
stem(n, x)
title("Input signal x[n] = c_1sin(w_1n)+c_2sin(w_2n)", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Fourier transform
y = fft(x, N);

subplot(312)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')
```

### Exercise-2

```matlab
%% Experiment - 3
% Exercise - 2
clc;
clear;
figure;

%% Input signal
N = 400;  % N in N-point DFT
n = 1 : N;  % Discrete time index
w = 1 : N;  % Discrete frequency index
c_1 = 2; c_2 = 2;
w_1 = 0.01; w_2 = 0.09;  % Normalised frequencies
x = c_1 * sin(w_1 * n) + c_2 * sin(w_2 * n);

subplot(211)
stem(n, x)
title("Input signal x[n] = c_1sin(w_1n)+c_2sin(w_2n)", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Time-shifting property of DTFT
k = 10;  % Delay
x_d = x(k+1 : end);  % Delayed input signal
y_di = fft(x_d, N);

y = fft(x, N);
y_d = exp(-i * k .* w) .* y;

window = 1 : length(n) - k;
d = y_d(window) - y_di(window);

subplot(212)
hold on;
stem(window, y_d(window), 'b')
stem(window, d(window), 'r')
hold off;
title("Time-shifting property of DTFT", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('y_d', 'd')
```

### Exercise-3

```matlab
%% Experiment - 3
% Exercise - 3
clc;
clear;
figure;

%% Input signal
N = 400;  % N in N-point DFT
n = 1 : N;  % Discrete time index
w = 1 : N;  % Discrete frequency index
c_1 = 2; c_2 = 2;
w_1 = 0.01; w_2 = 0.05;  % Normalised frequencies
x = c_1 * sin(w_1 * n) + c_2 * sin(w_2 * n);

subplot(211)
stem(n, x)
title("Input signal x[n] = c_1sin(w_1n)+c_2sin(w_2n)", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Frequency-shifting property of DTFT
k = 10;  % Delay
y = fft(x, N);
y_d = y(k+1 : end);  % Delayed output signal

x_d = exp(i * k .* w) .* x;
y_di = fft(x_d, N);

window = 1 : length(n) - k;
d = y_d(window) - y_di(window);

subplot(212)
hold on;
stem(window, y_d(window), 'b')
stem(window, d(window), 'r')
hold off;
title("Frequency-shifting property of DTFT", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('y_d', 'd')
```

### Exercise-4

```matlab
%% Experiment - 3
% Exercise - 4
clc;
clear;
figure;

%% Input signal
n = 1 : 100;  % Discrete time index
N = 2 * length(n) - 1;  % N in N-point DFT
c_1 = 2; c_2 = 2;
w_1 = 0.1; w_2 = 0.15;  % Normalised frequencies
x_1 = c_1 * sin(w_1 * n);
x_2 = c_2 * sin(w_2 * n);

subplot(211)
hold on;
stem(n, x_1)
stem(n, x_2)
hold off;
title("Input signals", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x_1[n]', 'x_2[n]')

%% Convolution property of DTFT
y_1 = fft(x_1, N);
y_2 = fft(x_2, N);

x_conv = conv(x_1, x_2);
y_x_conv = fft(x_conv, N);

y_y1_y2 = y_1 .* y_2;

window = 1 : N;
d = y_x_conv(window) - y_y1_y2(window);

subplot(212)
hold on;
stem(window, y_x_conv(window), 'b')
stem(window, d(window), 'r')
hold off;
title("Convolution property of DTFT", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('y_d', 'd')
```

### Exercise-5

```matlab
%% Experiment - 3
% Exercise - 5
clc;
clear;
figure;

%% Input signal
n = 1 : 200;  % Discrete time index
N = length(n);  % N in N-point DFT
F_s = 200;  % Sampling frequency
F = 30;  % Frequency
f = F / F_s;  % Normalised frequency
x = sin(f * n);

subplot(311)
stem(n, x)
title("Input signal x[n]", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Discrete Fourier Transform
y = fft(x, N);

subplot(312)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')
```

### Exercise-6

```matlab
%% Experiment - 3
% Exercise - 6
clc;
clear;
figure;

%% Input signal
n = 1 : 100;  % Discrete time index
N = length(n);  % N in N-point DFT
x = ecg(N);

subplot(311)
plot(n, x)
title("Input ECG signal x[n]", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Discrete Fourier Transform
y = fft(x, N);

subplot(312)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

%% Function definitions
function x = ecg(L)
    a0 = [0,  1, 40,  1,   0, -34, 118, -99,   0,   2,  21,   2,   0,   0,   0];
    d0 = [0, 27, 59, 91, 131, 141, 163, 185, 195, 275, 307, 339, 357, 390, 440];
    a = a0 / max(a0);
    d = round(d0 * L / d0(15));
    d(15) = L;
    for i = 1:14
        m = d(i) : d(i+1) - 1;
        slope = (a(i+1) - a(i)) / (d(i+1) - d(i));
        x(m+1) = a(i) + slope * (m - d(i));
    end
end
```

### Exercise-7

```matlab
%% Experiment - 3
% Exercise - 7
clc;
clear;
figure;

%% Input signal
n = 1 : 100;  % Discrete time index
N = length(n);  % N in N-point DFT
x = ecg(N);

subplot(411)
plot(n, x)
title("Input ECG signal x[n]", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x')

%% Discrete Fourier Transform
y = fft(x, N);

subplot(412)
stem(n, abs(y), 'b')
title("Magnitude spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

subplot(413)
stem(n, angle(y), 'r')
title("Phase spectrum", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude')

%% Reconstruction from DFT
x_r = ifft(y, N);

subplot(414)
plot(n, x_r)
title("Reconstructed ECG signal x_r[n]", "Ashrith 200902016")
xlabel('n'), ylabel('Amplitude'), legend('x_r')

%% Function definitions
function x = ecg(L)
    a0 = [0,  1, 40,  1,   0, -34, 118, -99,   0,   2,  21,   2,   0,   0,   0];
    d0 = [0, 27, 59, 91, 131, 141, 163, 185, 195, 275, 307, 339, 357, 390, 440];
    a = a0 / max(a0);
    d = round(d0 * L / d0(15));
    d(15) = L;
    for i = 1:14
        m = d(i) : d(i+1) - 1;
        slope = (a(i+1) - a(i)) / (d(i+1) - d(i));
        x(m+1) = a(i) + slope * (m - d(i));
    end
end
```

### Exercise-8

```matlab
%% Experiment - 3
% Exercise - 8
clc;
clear;
figure;

%% Frequency response
NUM = [1, 0.5];
DEN = [1, -1.8, 0.81];
Fs = 512;
sys = filt(NUM, DEN);
freqz(NUM, DEN, Fs)
figure;
zplane(NUM, DEN)
```

