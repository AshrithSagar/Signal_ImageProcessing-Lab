# Experiment - 4

## Functions

### `window`

`window(@WNAME,N)` returns an $N$-point window of type specified by the function handle `@WNAME` in a column vector.

### `fir1`

FIR filter design using the window method.

`B = fir1(N,Wn)` designs an $N$-th order lowpass FIR digital filter and returns the filter coefficients in length $N+1$ vector $B$. The cut-off frequency $Wn$ must be between $0 < Wn < 1.0$, with $1.0$ corresponding to half the sample rate. The filter $B$ is real and has linear phase. The normalized gain of the filter at $Wn$ is $-6 dB$.

`B = fir1(N,Wn,'high')` designs an $N$-th order highpass filter. You can also use `B = fir1(N,Wn,'low')` to design a lowpass filter.

`B = fir1(N,Wn,WIN)` designs an $N$-th order FIR filter using the $N+1$ length vector `WIN` to window the impulse response.

### `freqz`

Frequency response of digital filter

`H = freqz(...,F,Fs)` returns the complex frequency response at the frequencies designated in vector $F$ (in $Hz$), where $Fs$ is the sampling frequency (in $Hz$).

`freqz(...)` with no output arguments plots the magnitude and unwrapped phase of the filter in the current figure window.

### `zplane`

z-plane zero-pole plot.

`zplane(B,A)` where $B$ and $A$ are row vectors containing transfer function polynomial coefficients plots the poles and zeros of $B(z)/A(z)$.

### `sin`

`sin(X)` is the sine of the elements of $X$.

## Exercises

### Exercise - 1

Write a program to design a low pass FIR filter using windowing method. Let pass band frequency is $\omega_p = 0.375 \pi$ and stop band frequency is $\omega_s = 0.5 \pi$. Use hamming window. Try using rectangular, blackman windows also.

```matlab
%% Experiment - 4
% Exercise - 1
clc;
clear;

%% Low pass FIR filter design using the window method
w_p = 0.375;  % Pass band frequency
w_s = 0.5;  % Stop band frequency
w_c = w_p + (w_s - w_p) / 2;  % Cut-off frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_s - w_p));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, w_c, 'low', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response

figure; grid ON;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of Low pass FIR filter', "Ashrith 200902016");
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)');

figure;
zplane(NUM, DEN)
title('Pole-Zero Plot', "Ashrith 200902016");

```

#### Output

![Exercise-1](../Experiment-4/Exercise_1-1.jpg)
![Exercise-1](../Experiment-4/Exercise_1-2.jpg)

#### Observations

A Low pass FIR filter is designed using the window method, with Hamming window. The pass band frequency is $\omega_p = 0.375 \pi$ and stop band frequency is $\omega_s = 0.5 \pi$. The Pole-Zero plot contains 202 poles at the origin. Only the low frequency components are passed.

### Exercise - 2

Design, using window based approach, a high-pass FIR filter whose desired specifications are: $\omega_s = 0.2 \pi$, $\omega_p = 0.3 \pi$. Use hamming window. Hint: Use the built-in function `fir1`. Try using rectangular and blackman windows.

```matlab
%% Experiment - 4
% Exercise - 2
clc;
clear;

%% High pass FIR filter design using the window method
w_s = 0.2;  % Stop band frequency
w_p = 0.3;  % Pass band frequency
w_c = w_s + (w_p - w_s) / 2;  % Cut-off frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_p - w_s));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, w_s, 'high', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response

figure; grid ON;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of High pass FIR filter', "Ashrith 200902016");
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)');

figure;
zplane(NUM, DEN)
title('Pole-Zero Plot', "Ashrith 200902016");
```

#### Output

![Exercise-2](../Experiment-4/Exercise_2-1.jpg)
![Exercise-2](../Experiment-4/Exercise_2-2.jpg)

#### Observations

A High pass FIR filter is designed using the window method, with Hamming window. The stop band frequency is $\omega_s = 0.2 \pi$ and pass band frequency is $\omega_p = 0.3 \pi$. The Pole-Zero plot contains 252 poles at the origin. Only the high frequency components are passed.

### Exercise - 3

Design and plot the frequency response of a band-pass FIR filter whose specifications are as follows: Lower pass band edge = 300Hz, upper pass-band edge = 600Hz, lower stop- band edge = 200Hz and upper stop-band edge = 700Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function `fir1`. Try using rectangular, blackman windows also.

```matlab
%% Experiment - 4
% Exercise - 3
clc;
clear;

%% Band pass FIR filter design using the window method
Fs = 2000;  % Sampling frequency
w_lp = 300 / Fs;  % Lower pass band edge frequency
w_ls = 200 / Fs;  % Lower stop band edge frequency
w_up = 600 / Fs;  % Upper pass band edge frequency
w_us = 700 / Fs;  % Upper stop band edge frequency
w_lc = w_ls + (w_lp - w_ls) / 2;  % Lower cutoff frequency
w_uc = w_up + (w_us - w_up) / 2;  % Upper cutoff frequency
% Stop band attenuation = 50dB

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_us - w_up));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc, w_uc], 'bandpass', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response

figure; grid ON;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of Band pass FIR filter', "Ashrith 200902016");
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)');

figure;
zplane(NUM, DEN)
title('Pole-Zero Plot', "Ashrith 200902016");
```

#### Output

![Exercise-3](../Experiment-4/Exercise_3-1.jpg)
![Exercise-3](../Experiment-4/Exercise_3-2.jpg)

#### Observations

A Band pass FIR filter is designed using the window method, with Hamming window. The Pole-Zero plot contains 503 poles at the origin. Only the mid-band frequency components are passed.

### Exercise - 4

Design and plot the frequency response of a band-stop filter whose specifications are as follows: Lower pass band edge = 200Hz, upper pass-band edge = 700Hz, lower stop- band edge = 300Hz and upper stop-band edge = 600Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function `fir1`.

```matlab
%% Experiment - 4
% Exercise - 4
clc;
clear;

%% Band stop FIR filter design using the window method
Fs = 2000;  % Sampling frequency
w_lp = 200 / Fs;  % Lower pass band edge frequency
w_ls = 300 / Fs;  % Lower stop band edge frequency
w_up = 700 / Fs;  % Upper pass band edge frequency
w_us = 600 / Fs;  % Upper stop band edge frequency
w_lc = w_lp + (w_ls - w_lp) / 2;  % Lower cutoff frequency
w_uc = w_us + (w_up - w_us) / 2;  % Upper cutoff frequency
% Stop band attenuation = 50dB

k = 4;  % Hamming window
N = floor((2 * k * pi) / (w_up - w_us));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc, w_uc], 'stop', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);  % Frequency response

figure; grid ON;
plot(W / pi, 20 * log10(abs(H)))  % Magnitude spectrum
title('Magnitude spectrum of Band stop FIR filter', "Ashrith 200902016");
xlabel('Normalized Frequency  (\times\pi rad/sample)'), ylabel('Gain (dB)');

figure;
zplane(NUM, DEN)
title('Pole-Zero Plot', "Ashrith 200902016");
```

#### Output

![Exercise-4](../Experiment-4/Exercise_4-1.jpg)
![Exercise-4](../Experiment-4/Exercise_4-2.jpg)

#### Observations

A Band stop FIR filter is designed using the window method, with Hamming window. The Pole-Zero plot contains 502 poles at the origin. Only the mid-band frequency components are rejected.

### Exercise - 5

Execute the following:
   1. Simulate the signal having frequencies 10Hz, 30Hz and 50Hz.
   2. Design suitable FIR filter to select only 30Hz component (Use Hamming window).
   3. Filter the signal using the designed filter, and
   4. Plot the spectrum of the input and the filtered signal.

```matlab
%% Experiment - 4
% Exercise - 5
clc;
clear;

%% (a) Simulate the signal having frequencies 10Hz, 30Hz and 50Hz.
Fs = 1024;  % Sampling frequency
n_max = 5;
n = 0 : 1/Fs : n_max - 1;  % Discrete time index
s_10 = sin(2 * pi * 10 * n);
s_30 = sin(2 * pi * 30 * n);
s_50 = sin(2 * pi * 50 * n);
x = s_10 + s_30 + s_50;

%% (b) Design suitable FIR filter to select only 30Hz component (Use Hamming window).
w_lp = 2 * pi * 28 / Fs;  % Lower pass band edge frequency
w_ls = 2 * pi * 29 / Fs;  % Lower stop band edge frequency
w_up = 2 * pi * 31 / Fs;  % Upper pass band edge frequency
w_us = 2 * pi * 32 / Fs;  % Upper stop band edge frequency
w_lc = w_ls + (w_lp - w_ls) / 2;  % Lower cutoff frequency
w_uc = w_up + (w_us - w_up) / 2;  % Upper cutoff frequency

k = 4;  % Hamming window
N = ceil((2 * k * pi) / (w_us - w_up));  % Order of filter
win = window(@hamming, N+1);  % Hamming window
NUM = fir1(N, [w_lc / pi, w_uc / pi], 'bandpass', win);  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

[H, W] = freqz(NUM, DEN);

%% (c) Filter the signal using the designed filter.
y = filter(NUM, DEN, x);

figure;
hold on
plot(y, 'b')
plot(x, 'r')
hold off
title('Filter output', "Ashrith 200902016");
xlabel('n'), ylabel('Amplitude'), legend('y', 'x')

%% (d) Plot the spectrum of the input and the filtered signal.

figure;
subplot(211)
hold on
plot(n * Fs / n_max, abs(fft(x)), 'r')
hold off
title('Input Fourier Transform', "Ashrith 200902016");
xlabel('Frequency'), ylabel('Magnitude'), legend('x')

subplot(212)
hold on
plot(n * Fs / n_max, abs(fft(y)), 'b')
hold off
title('Output Fourier Transform', "Ashrith 200902016");
xlabel('Frequency'), ylabel('Magnitude'), legend('y')
```

#### Output

![Exercise-5](../Experiment-4/Exercise_5-1.jpg)
![Exercise-5](../Experiment-4/Exercise_5-2.jpg)

#### Observations

A notch filter is designed to pass only a particular frequency.
