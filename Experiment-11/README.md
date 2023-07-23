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
If the repetitions of the signal are identical and aligned $\sum_{k=1}^{M} x_k(n) = M x(n)$, If the noise is random, has zero mean, and has a variance of $\sigma_n^2$, $\sum_{k=1}^{M} \eta_k(n)$ will tend to zero as $M$ increases, with the variance given by $𝑀\sigma_n^2$; its RMS value is $\sqrt{𝑀}\sigma_n$. Thus, the SNR of the signal will increase by a factor of $M$ or $\sqrt{M}$. The larger the number of epochs or realizations that are averaged, the better will be the SNR of the result. Note that synchronized averaging is a type of ensemble averaging.

Kamath et al. [1] applied synchronized averaging to improve the SNR of cortical evoked potentials related to electrical and mechanical stimulation of the esophagus. Although improvement in SNR was obtained in some experiments, they also observed that habituation took place as the number of stimuli was increased beyond a certain limit, and that the use of the ERPs obtained after habituation in averaging led to a reduction in the SNR.

Kamath et al. estimated the SNR as follows:

Noise power:
$$\sigma_n^2 = \frac{1}{NT(M-1)}\sum_{m=1}^{M}\sum_{n=1}^{N}[y_k(n) - \bar y_k(n)]^2$$

Signal power:
$$\sigma_{\bar y}^2 = \frac{1}{NT} \Big\{ \sum_{n=1}^{N} [\bar y(n)]^2\Big\} - \frac{\sigma_\eta^2}{M}$$
$$SNR = \frac{\sigma_{\bar y}^2}{\sigma_\eta^2}$$

Here, $T=\frac{1}{f_s}$ *sec* is the sampling interval.

Kamath et al. also computed the Euclidean distance between the original ERP signals and the averaged signal obtained as
$$D = \frac{1}{M}\sum_{k=1}^{M}\sqrt{\sum_{n=1}^{N}[y_k(n)-\bar y(n)]^2}$$
