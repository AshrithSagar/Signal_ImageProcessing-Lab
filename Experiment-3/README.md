# Discrete Fourier Transform and its Properties

## Exercises

1. Generate a sequence $x[n] = c_1\sin(\omega_1 n) + c_2 \sin(\omega_2 n), 0 \le \omega_1, \omega_2 \le \pi$. With the help of inbuilt `fft` function, determine the Fourier transform and plot the Fourier spectrum of $x[n]$.

2. Consider the Discrete time sequence defined in Q1. Verify the time-shifting property of DTFT.

3. Consider the Discrete time sequence defined in Q1. Verify the frequency-shifting property of DTFT.

4. Consider the Discrete time sequence defined in Q1. Verify the convolution property of DTFT.

5. Find the DFT of a sine wave of frequency 30 Hz sampled at 200 Hz and plot its magnitude and phase spectrum.

6. Compute DFT of an ECG signal. Plot ECG signal and its Magnitude spectrum.

7. With the help of inbuilt `ifft` function, reconstruct the ECG signal from its DFT obtained in Q6.

8. Find the frequency response by using `freqz` function of the system characterized by the difference equation as given below. Take 512 frequency samples for $0 \le \omega \le \pi$.
   $y[n] - 1.8 y[n-1] + 0.81 y[n-2] = x[n] + 0.5 x[n-1]$
