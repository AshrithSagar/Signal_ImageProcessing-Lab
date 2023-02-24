# Designing Finite Impulse Response (FIR) Filters

## Exercises

1. Write a program to design a low pass FIR filter using windowing method. Let pass band frequency is $\omega_p = 0.375 \pi$ and stop band frequency is $\omega_s = 0.5 \pi$. Use hamming window. Try using rectangular, blackman windows also.

2. Design, using window based approach, a high-pass FIR filter whose desired specifications are: $\omega_s = 0.2 \pi$, $\omega_p = 0.3 \pi$. Use hamming window. Hint: Use the built-in function `fir1`. Try using rectangular and blackman windows.

3. Design and plot the frequency response of a band-pass FIR filter whose specifications are as follows: Lower pass band edge = 300Hz, upper pass-band edge = 600Hz, lower stop- band edge = 200Hz and upper stop-band edge = 700Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function `fir1`. Try using rectangular, blackman windows also.

4. Design and plot the frequency response of a band-stop filter whose specifications are as follows: Lower pass band edge = 200Hz, upper pass-band edge = 700Hz, lower stop- band edge = 300Hz and upper stop-band edge = 600Hz, stop band attenuation = 50dB. The sampling frequency is 2kHz. Use the built-in function `fir1`.

5. Execute the following:
   1. Simulate the signal having frequencies 10Hz, 30Hz and 50Hz.
   2. Design suitable FIR filter to select only 30Hz component (Use Hamming window).
   3. Filter the signal using the designed filter, and
   4. Plot the spectrum of the input and the filtered signal.
