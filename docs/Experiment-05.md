# Experiment-5

## Exercises

### Exercise-1

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

### Exercise-10

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

### Exercise-2

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

### Exercise-3

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

### Exercise-4

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

### Exercise-5

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

### Exercise-6

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

### Exercise-7

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

### Exercise-8

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

### Exercise-9

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

