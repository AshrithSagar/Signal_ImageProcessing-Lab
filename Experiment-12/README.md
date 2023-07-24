# Detection of the QRS and Parametrization of the ECG

## Objectives

- To detect QRS complexes in ECG signals using the Pan–Tompkins algorithm.
- To measure parameters of the ECG for analysis of the heart rate and cardiac rhythm.

## Background

The algorithm developed by Pan and Tompkins identifies QRS complexes based on analysis of the slope, amplitude, and width of the QRS. The various stages of the algorithm are shown in Figure 1.

![Figure-1](Figure-1.png)

The bandpass filter, formed using lowpass and highpass filters, reduces noise in the ECG signal. Noise such as muscle noise, 60 Hz interference, and baseline drift are removed by bandpass filtering. The signal is then passed through a differentiator to provide a large response at the high slopes that distinguish QRS complexes from low- frequency ECG components such as the P and T waves.

The next operation is the squaring operation, which emphasizes the higher values expected due to QRS complexes and suppresses smaller values related to the P and T waves, as well as noise in the output of the preceding stage. The squared signal is then passed through a moving-window integrator of window length $N = 30$ samples (for the sampling frequency of $f_s = 200\ \text{Hz}$). The expected result is a single smooth peak 𝑠 related to the QRS complex for each ECG cycle. The output of the moving-window integrator may be used to detect QRS complexes, measure RR intervals, and determine the duration of the QRS complex (see Figure 2).

## Exercises to be worked by hand

1. A digital filter is specified in terms of its impulse response as $$h_1(𝑛) = \delta(𝑛) +\delta(𝑛 − 1) +\delta(𝑛 − 2).$$

   Derive its transfer function as well as the magnitude and phase parts of its frequency response. Explain the nature and effects of the filter.

![Figure-2](Figure-2.png)

2. Another digital filter is specified in terms of its impulse response as $$h_2(𝑛) = \delta(𝑛) − \delta(𝑛 − 1).$$

   Derive its transfer function as well as the magnitude and phase parts of its frequency response. Explain the nature and effects of the filter.

3. The two filters given above are used in series to filter a signal. Derive and plot the impulse response of the combined filter.

   Derive the transfer function as well as the magnitude and phase parts of the frequency response of the combined filter. Explain the nature and effects of the combined filter.

## Detection of the QRS wave

1. Develop a Matlab program to perform the various filtering procedures that compose the Pan–Tompkins algorithm. Use the filter command for each step; see Section 4.3.2 of the textbook. Process each of the three ECG signals from the data base using your program. Prepare plots of the signal being processed over the full duration (or a relevant portion of about 10 − 15 seconds) and over two cardiac cycles, before and after each stage of the Pan–Tompkins method. You may also use ECG3.dat, ECG4.dat, ECG5.dat, ECG6.dat, and ECGS.m.

2. Plot the pole–zero diagram and the frequency response (magnitude and phase) of each of the initial lowpass, highpass, and the combined bandpass filters, and also the derivative-based and integrating filters. Study the plots and describe the characteristics as well as the effects of each stage of the QRS-detection algorithm.

3. Implement a thresholding procedure including a blanking interval for the detection of QRS complexes from the output of the Pan–Tompkins algorithm. Develop Matlab code to use the output of the Pan–Tompkins algorithm to detect QRS complexes. Mark the detected peak locations on the plots of the output of the integrator and also the corresponding original ECG signal, including a correction factor for the delays introduced by the filters.

4. Include steps in your program to compute automatically the following parameters for each ECG signal:

   1. Total number of beats detected in each signal and the heart rate in beats per minute.
   2. Average RR interval and standard deviation of RR intervals of each signal (in ms).
   3. Average QRS width computed over all the beats in each signal (in ms).

   Verify your results by visual comparison of the outputs of your program with the original signals. Determine the number of missed beats or incorrectly detected beats, if any, in each signal. Tabulate and analyze the results for your ECG signals.

**Note:** The amplitude of an ECG signal may start with a value other than zero. As a consequence, the differentiator in the Pan–Tompkins algorithm will amplify the initial step, possibly resulting in an erroneous beat detection. In order to prevent this problem, subtract the value of the first sample of the ECG signal from the entire ECG prior to processing by the Pan–Tompkins algorithm.

## Matlab commands to learn

Use the help command in Matlab and learn the following commands: `filter`, `freqz`, `zplane`.
