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
