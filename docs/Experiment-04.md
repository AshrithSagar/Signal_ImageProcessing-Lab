# Experiment-4

## Examples

## Exercises

### Exercise-1

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

### Exercise-2

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

### Exercise-3

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

### Exercise-4

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

### Exercise-5

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

