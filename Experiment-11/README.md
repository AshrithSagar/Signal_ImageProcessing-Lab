# Synchronized Averaging for Noise Reduction

## Objectives

- To study the effect of synchronized averaging on noise.
- To study the effect of the number of trials in repeated stimulation for synchronized averaging.

## Background

Linear filters do not perform well when the signal and noise spectra overlap. Synchronized signal averaging can separate a repetitive signal from noise without distorting the signal. Epochs of event-related potentials (ERP) and somatosensory evoked potentials (SEP) may be obtained a number of times by repeated application of the stimulus; they may then be averaged by using the stimulus as a trigger to align the epochs. If the noise is random with zero mean and is uncorrelated with the signal, averaging will improve the signal-to-noise ratio (SNR).

Let $y_k(n)$ represent one realization or observation of a signal, with $k = 1, 2, \dots, M$ representing the ensemble index, and $n = 1, 2, \dots, N$ representing the time-sample index. Here, $M$ is the number of copies (trials, events, epochs, or realizations) of the signal available, and $N$ is the number of the time samples in each copy of the signal (event). We may express the observed signal as
$$y_k(n) = x_k(n) + \eta_k(n),$$
where $x_k(n)$ represents the original uncorrupted signal and $𝜂_𝑘(𝑛)$ represents the noise in the $𝑘^{th}$ copy of the observed signal. Now, if for each instant of time $𝑛$ we average the $M$ copies of the signal, we get
$$\bar y(n) = \frac{1}{M}\sum_{k=1}^{M} y_k(n) = \frac{1}{M}\sum_{k=1}^{M} x_k(n) + \frac{1}{M}\sum_{k=1}^{M} \eta_k(n); \quad n = 1, 2, \dots, N$$
If the repetitions of the signal are identical and aligned $$\sum_{k=1}^{M} x_k(n) = M x(n)$$ If the noise is random, has zero mean, and has a variance of $\sigma_n^2$, $$\sum_{k=1}^{M} \eta_k(n)$$ will tend to zero as $M$ increases, with the variance given by $𝑀\sigma_n^2$; its RMS value is $\sqrt{𝑀}\sigma_n$. Thus, the SNR of the signal will increase by a factor of $M$ or $\sqrt{M}$. The larger the number of epochs or realizations that are averaged, the better will be the SNR of the result. Note that synchronized averaging is a type of ensemble averaging.

Kamath et al. [1] applied synchronized averaging to improve the SNR of cortical evoked potentials related to electrical and mechanical stimulation of the esophagus. Although improvement in SNR was obtained in some experiments, they also observed that habituation took place as the number of stimuli was increased beyond a certain limit, and that the use of the ERPs obtained after habituation in averaging led to a reduction in the SNR.

Kamath et al. estimated the SNR as follows:

Noise power:
$$\sigma_n^2 = \frac{1}{NT(M-1)}\sum_{m=1}^{M}\sum_{n=1}^{N}[y_k(n) - \bar y_k(n)]^2$$

Signal power:
$$\sigma_{\bar y}^2 = \frac{1}{NT} \{ \sum_{n=1}^{N} [\bar y(n)]^2 \} - \frac{\sigma_\eta^2}{M}$$
$$SNR = \frac{\sigma_{\bar y}^2}{\sigma_\eta^2}$$

Here, $T=\frac{1}{f_s}$ *sec* is the sampling interval.

Kamath et al. also computed the Euclidean distance between the original ERP signals and the averaged signal obtained as
$$D = \frac{1}{M}\sum_{k=1}^{M}\sqrt{\sum_{n=1}^{N}[y_k(n)-\bar y(n)]^2}$$

## Exercises to be worked by hand

1. Write the equation to define the mean of a random variable 𝑥 in terms of its probability density function (PDF) 𝑝𝑥(𝑥).

2. A variable y is given 𝑎𝑠 𝑦 = 𝑥 + 𝜂 where 𝑥 and 𝜂 are statistically independent random processes. Starting with the joint PDF of the random processes 𝑥 and 𝜂, derive an expression for the mean of 𝑦 = 𝑥 + 𝜂. Show all steps.

3. Write the definition of the variance of 𝑥 using the expectation operator and the PDF of 𝑥.

4. With 𝑦 defined as in item 2 above, derive the relationship between the variance of 𝑦, 𝑥, and 𝜂 using the expectation operator (no need to use PDFs and integrals in this case). Show all steps.

## Averaging of SEPs

Copy the data files E11 to E2424 and the Matlab program esoepX.m. The signals were filtered to the band 0.1 − 100 Hz and sampled at 1000 Hz. The number of samples in each signal is N = 511.

The signals are numbered as *Ekk*, where *k* is the trial number, with 𝑘 = 1, 2, . . . , 𝑀, and M = 24. The signals are numbered in the time sequence of the stimulation trials.

Write a Matlab function to compute the average of a certain number of signals (trials) to be specified as an input parameter.

Write a Matlab function to compute the SNR and Euclidean distance between a certain averaged signal and the corresponding set of original signals used, as specified in Eq 5 and 6.

Write a Matlab program to compute several averages of selected ERP signals as follows:

1. Trials 1 − 6, 7 − 12, 13 − 18, and 19 − 24.
2. Trials 1 − 8, 9 − 16, and 17 − 24.
3. Trials 1 − 12 and 13 − 24.
4. Trials 1 − 24.

1. For the case with the trials 1−6, plot each of the signals used as well as the result of

averaging using subplots; for the remaining cases, plot only the results of averaging. For all cases, compute the SNR and Euclidean distance values as given above.

Prepare a table of the various SNR and the Euclidean distance values obtained along with the corresponding signals (trials) used and the number of signals averaged (M). Analyze the results and discuss your findings.

**Reference**: 1. M. V. Kamath, G. Tougas, S. Hollerbach, R. Premji, D. Fitzpatrick, G. Shine, and A. R. M. Upton, “Estimation of habituation and signal-to-noise ratio of cortical evoked potentials to esophageal electrical and mechanical stimulation,” Medical and Biological Engineering and Computing, 35:343-347, 1997.
