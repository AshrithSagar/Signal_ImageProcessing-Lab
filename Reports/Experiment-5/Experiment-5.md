# Experiment - 5

## Functions

### `buttord`

Butterworth filter order selection.

`[N, Wn] = buttord(Wp, Ws, Rp, Rs)` returns the order $N$ of the lowest order digital Butterworth filter which has a passband ripple of no more than $R_p \ dB$ and a stopband attenuation of at least $R_s \ dB$. $W_p$ and $W_s$ are the passband and stopband edge frequencies, normalized from $0$ to $1$ (where $1$ corresponds to $\pi$ radians/sample).

### `cheb1ord`

Chebyshev Type I filter order selection.

`[N, Wp] = cheb1ord(Wp, Ws, Rp, Rs)` returns the order $N$ of the lowest order digital Chebyshev Type I filter which has a passband ripple of no more than $R_p \ dB$ and a stopband attenuation of at least $R_s \ dB$. $W_p$ and $W_s$ are the passband and stopband edge frequencies, normalized from $0$ to $1$ (where $1$ corresponds to $\pi$ radians/sample).

### `butter`

Butterworth digital and analog filter design.

`[B,A] = butter(N,Wn)` designs an $N-$th order lowpass digital Butterworth filter and returns the filter coefficients in length $N+1$ vectors $B$ (numerator) and $A$ (denominator). The coefficients are listed in descending powers of $z$. The cutoff frequency $W_n$ must be $0.0 < W_n < 1.0$, with $1.0$ corresponding to half the sample rate.

### `cheby1`

Chebyshev Type I digital and analog filter design.

`[B,A] = cheby1(N,R,Wp)` designs an $N-$th order lowpass digital Chebyshev filter with $R$ decibels of peak-to-peak ripple in the passband. `cheby1` returns the filter coefficients in length $N+1$ vectors $B$ (numerator) and $A$ (denominator). The passband-edge frequency $W_p$ must be $0.0 < W_p < 1.0$, with $1.0$ corresponding to half the sample rate. Use $R=0.5$ as a starting point, if you are unsure about choosing $R$.

### `bilinear`

Bilinear transformation with optional frequency prewarping.

`[NUMd,DENd] = bilinear(NUM,DEN,Fs)`, where $\text{NUM}$ and $\text{DEN}$ are row vectors containing numerator and denominator transfer function coefficients, $\text{NUM}(s)/\text{DEN}(s)$, in descending powers of $s$, transforms to $z-$transform coefficients $\text{NUMd}(z)/\text{DENd}(z)$

### `freqz`

Frequency response of digital filter

`H = freqz(...,F,Fs)` returns the complex frequency response at the frequencies designated in vector $F$ (in $Hz$), where $F_s$ is the sampling frequency (in $Hz$).

`freqz(...)` with no output arguments plots the magnitude and unwrapped phase of the filter in the current figure window.

### `zplane`

z-plane zero-pole plot.

`zplane(B,A)` where $B$ and $A$ are row vectors containing transfer function polynomial coefficients plots the poles and zeros of $B(z)/A(z)$.

## Exercises

### Exercise - 1

Design an IIR Butterworth Low-pass filter, given the following specifications. Also plot the frequency response. Specifications: $r_p = 1\ dB$, $r_s = 40\ dB$, $f_p = 100\ Hz$ and $f_s = 500\ Hz$. Take sampling frequency as $10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 1
clc;
clear;

%% IIR Butterworth low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 40;  % Stop band peak ripple
f_p = 100;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 500;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'low');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-1](../Experiment-5/Exercise_1-1.jpg)
![Exercise-1](../Experiment-5/Exercise_1-2.jpg)

#### Observations

A Low pass Butterworth IIR filter is designed. Only the low frequency components are passed.

### Exercise - 2

Design an IIR Butterworth High-pass filter, given the following specifications. Also plot the frequency response. Specifications: $r_p = 10\ dB$, $r_s = 40\ dB$, $f_p = 3000\ Hz$ and $f_s = 1000\ Hz$. Take sampling frequency as $10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 2
clc;
clear;

%% IIR Butterworth high-pass filter
F_s = 10000;  % Sampling frequency
r_p = 10;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = 3000;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 1000;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'high');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth high-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-2](../Experiment-5/Exercise_2-1.jpg)
![Exercise-2](../Experiment-5/Exercise_2-2.jpg)

#### Observations

A High pass Butterworth IIR filter is designed. Only the high frequency components are passed.

### Exercise - 3

Design an IIR Butterworth Band-pass filter, given the following specifications. Also plot the frequency response. Specifications: Pass-band of $600\ Hz$ to $2000\ Hz$, Stop-band till $450\ Hz$ and then $2300\ Hz$ onwards, $r_p = 10\ dB$, $r_s = 40\ dB$ and sampling frequency is $10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 3
clc;
clear;

%% IIR Butterworth band-pass filter
F_s = 10000;  % Sampling frequency
r_p = 10;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = [600 2000];  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = [450 2300];  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn);  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth band-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-3](../Experiment-5/Exercise_3-1.jpg)
![Exercise-3](../Experiment-5/Exercise_3-2.jpg)

#### Observations

A Band pass Butterworth IIR filter is designed. Only the mid frequency components are passed.

### Exercise - 4

Design an IIR Butterworth Band-stop filter, given the following specifications. Also plot the frequency response. Specifications: Stop-band of $600\ Hz$ to $2000\ Hz$, pass- band till $450\ Hz$ and then $2300\ Hz$ onwards, $r_p = 10\ dB$, $r_s = 40\ dB$ and sampling frequency is $10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 4
clc;
clear;

%% IIR Butterworth band-stop filter
F_s = 10000;  % Sampling frequency
r_p = 10;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = [450 2300];  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = [600 2000];  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'stop');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth band-stop filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-4](../Experiment-5/Exercise_4-1.jpg)
![Exercise-4](../Experiment-5/Exercise_4-2.jpg)

#### Observations

A Band stop Butterworth IIR filter is designed. Only the mid frequency components are rejected.

### Exercise - 5

Design and plot the frequency response of an IIR low pass Chebyshev filter that loses no more than $1\ dB$ in the pass-band and at least $80\ dB$ of attenuation in the stop-band. The pass-band and stop-band edge frequencies are $100\ Hz$ and $2 \ kHz$ respectively. Assume a sampling rate of $10 \ kHz$.

```matlab
%% Experiment - 5
% Exercise - 5
clc;
clear;

%% IIR Chebyshev low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple (dB)
r_s = 80;  % Stop band peak ripple (dB)
f_p = 100;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 2000;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p, 'low');  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Chebyshev low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-5](../Experiment-5/Exercise_5-1.jpg)
![Exercise-5](../Experiment-5/Exercise_5-2.jpg)

#### Observations

A Low pass Chebyshev IIR filter is designed. Only the low frequency components are passed.

### Exercise - 6

Design and plot the frequency response of an IIR high pass Chebyshev filter that loses no more than $1\ dB$ in the pass-band and at least $80\ dB$ of attenuation in the stop- band. The pass-band and stop-band edge frequencies are $2 \ kHz$ and $100 \ Hz$ respectively. Assume a sampling rate of $10 \ kHz$.

```matlab
%% Experiment - 5
% Exercise - 6
clc;
clear;

%% IIR Chebyshev high-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple (dB)
r_s = 80;  % Stop band peak ripple (dB)
f_p = 2000;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 100;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p, 'high');  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Chebyshev high-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-6](../Experiment-5/Exercise_6-1.jpg)
![Exercise-6](../Experiment-5/Exercise_6-2.jpg)

#### Observations

A High pass Chebyshev IIR filter is designed. Only the high frequency components are passed.

### Exercise - 7

Execute the following:
   1. Simulate a signal having frequency components of $10\ Hz$, $30\ Hz$ and $50\ Hz$.
   2. Design suitable Butterworth IIR filter to select only $30\ Hz$ component.
   3. Filter the signal using the designed filter, and
   4. Plot the spectrum of the input and the filtered signal.

```matlab
%% Experiment - 5
% Exercise - 7
clc;
clear;

%% Input signal
F_s = 1000;  % Sampling frequency
n = 0 : 1/F_s : 1;
x_10 = sin(2 * pi * 10 * n);
x_30 = sin(2 * pi * 30 * n);
x_50 = sin(2 * pi * 50 * n);
x = x_10 + x_30 + x_50;

%% IIR Butterworth band-pass filter
r_p = 1;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = [29 31];  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = [25 40];  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s);  % Butterworth filter order
[NUM, DEN] = butter(N, Wn);  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Butterworth band-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")

%% Spectrum of input and filtered signal
y = filter(NUM, DEN, x);

figure;
subplot(211)
plot(n, abs(fft(x))); grid ON;
title("Mangnitude Spectrum of Input signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')

subplot(212)
plot(n, abs(fft(y))); grid ON;
title("Mangnitude Spectrum of Filtered signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')
```

#### Output

![Exercise-7](../Experiment-5/Exercise_7-1.jpg)
![Exercise-7](../Experiment-5/Exercise_7-2.jpg)
![Exercise-7](../Experiment-5/Exercise_7-3.jpg)

#### Observations

A Band pass (Notch) Butterworth IIR filter is designed. Only the particular frequency components are passed.

### Exercise - 8

Execute the following:
   1. Simulate a signal having frequency components of $10\ Hz$, $30\ Hz$ and $50\ Hz$.
   2. Design suitable Chebyshev IIR filter to select only $30\ Hz$ component.
   3. Filter the signal using the designed filter, and
   4. Plot the spectrum of the input and the filtered signal.

```matlab
%% Experiment - 5
% Exercise - 8
clc;
clear;

%% Input signal
F_s = 1000;  % Sampling frequency
n = 0 : 1/F_s : 1;
x_10 = sin(2 * pi * 10 * n);
x_30 = sin(2 * pi * 30 * n);
x_50 = sin(2 * pi * 50 * n);
x = x_10 + x_30 + x_50;

%% IIR Chebyshev band-pass filter
r_p = 10;  % Pass band peak ripple (dB)
r_s = 40;  % Stop band peak ripple (dB)
f_p = [29 31];  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = [25 35];  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p);  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of IIR Chebyshev band-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUM, DEN);
title("Pole-Zero Plot", "Ashrith 200902016")

%% Spectrum of input and filtered signal
y = filter(NUM, DEN, x);

figure;
subplot(211)
plot(n, abs(fft(x))); grid ON;
title("Mangnitude Spectrum of Input signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')

subplot(212)
plot(n, abs(fft(y))); grid ON;
title("Mangnitude Spectrum of Filtered signal", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude')
```

#### Output

![Exercise-8](../Experiment-5/Exercise_8-1.jpg)
![Exercise-8](../Experiment-5/Exercise_8-2.jpg)
![Exercise-8](../Experiment-5/Exercise_8-3.jpg)

#### Observations

A Band pass (Notch) Chebyshev IIR filter is designed. Only the particular frequency components are passed.

### Exercise - 9

Design an analog IIR low pass butterworth filter and convert it into digital using Bilinear transformation. Plot the frequency response. Specifications: $r_p = 1\ dB$, $r_s = 40\ dB$, $f_p = 100\ Hz$, $f_s = 500\ Hz$ and Sampling frequency = $F_s = 10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 9
clc;
clear;

%% IIR Butterworth low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 40;  % Stop band peak ripple
f_p = 100;  w_p = 2 * pi * f_p / F_s;  % Pass band edge frequency
f_s = 500;  w_s = 2 * pi * f_s / F_s;  % Stop band edge frequency

[N, Wn] = buttord(w_p, w_s, r_p, r_s, 's');  % Butterworth filter order
[NUM, DEN] = butter(N, Wn, 'low');  % Butterworth filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of analog IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

%% Bilinear transformation
[NUMd,DENd] = bilinear(NUM, DEN, F_s);

[H, W] = freqz(NUMd, DENd);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of digital IIR Butterworth low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUMd, DENd);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-9](../Experiment-5/Exercise_9-1.jpg)
![Exercise-9](../Experiment-5/Exercise_9-2.jpg)
![Exercise-9](../Experiment-5/Exercise_9-3.jpg)

#### Observations

An Analog IIR Low pass Butterworth filter is designed and converted into a Digital filter using Bilinear transformation. $H(s)$ is converted to $H(z)$, effectively by substituting $s = \frac{2 F_s (z-1)}{z+1}$.

### Exercise - 10

Design an analog IIR low pass chebyshev filter and convert it into digital using Bilinear transformation. Plot the frequency response. Specifications: $r_p = 1\ dB$, $r_s = 80\ dB$, $f_p = 100\ Hz$, $f_s = 2000\ Hz$ and Sampling frequency $ = 10\ kHz$.

```matlab
%% Experiment - 5
% Exercise - 10
clc;
clear;

%% IIR Chebyshev low-pass filter
F_s = 10000;  % Sampling frequency
r_p = 1;  % Pass band peak ripple
r_s = 80;  % Stop band peak ripple
f_p = 100;  w_p = 2 * f_p / F_s;  % Pass band edge frequency
f_s = 2000;  w_s = 2 * f_s / F_s;  % Stop band edge frequency

[N, Wn] = cheb1ord(w_p, w_s, r_p, r_s);  % Chebyshev filter order
[NUM, DEN] = cheby1(N, r_p, w_p, 'low');  % Chebyshev filter

[H, W] = freqz(NUM, DEN);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of analog IIR Chebyshev low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

%% Bilinear transformation
[NUMd,DENd] = bilinear(NUM, DEN, F_s);

[H, W] = freqz(NUMd, DENd);  % Frequency response

figure;
plot(W / pi, 20 * log10(abs(H))); grid ON;
title("Frequency response of digital IIR Chebyshev low-pass filter", "Ashrith 200902016")
xlabel('Normalised frequency (\times \pi rad/sample)'), ylabel('Magnitude (dB)')

figure;
zplane(NUMd, DENd);
title("Pole-Zero Plot", "Ashrith 200902016")
```

#### Output

![Exercise-10](../Experiment-5/Exercise_10-1.jpg)
![Exercise-10](../Experiment-5/Exercise_10-2.jpg)
![Exercise-10](../Experiment-5/Exercise_10-3.jpg)

#### Observations

An Analog IIR Low pass Chebyshev filter is designed and converted into a Digital filter using Bilinear transformation. $H(s)$ is converted to $H(z)$, effectively by substituting $s = 2 F_s \cfrac{z-1}{z+1}$.
