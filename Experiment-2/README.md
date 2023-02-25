# Discrete Time System and its Properties

## Examples

1. Determine and plot the response of an accumulator for an input sequence $x[n] = u[n] + 2 u[n-1] - 3 u[n-3]$. Consider the system is at rest.

2. Determine and plot the response of an bilinear interpolator for an input sequence $x[n] = \delta[n] + 2\delta[n-4] - 3\delta[n-8]$. Consider the system is at rest.

3. Investigate the linearity property of a causal system described by the difference equation $y[n] - 0.4 y[n-1] + 0.75 y[n-2] = 2.2403 x[n] + 2.4908 x[n-1] + 2.2403 x[n-2]$, where $x[n] = \cos(2 \pi f n)$.

4. Investigate the shift invariance property of a causal system given in Example-3. Given $x[n] = c_1\cos(2 \pi f_1 n) + c_2 \cos(2 \pi f_2 n)$. Select $f_1$ and $f_2$ as low and high normalized frequencies and choose any arbitrary constants $c_1$ and $c_2$.

5. Simulate an M-point moving average filter (smoothing FIR filter) given by the equation $y[n] = \sum_{k=0}^{M-1} x[n-k]$ to retrieve low frequency signal, where $x[n] = c_1\cos(2 \pi f_1 n) + c_2 \cos(2 \pi f_2 n)$. Select $f_1$ and $f_2$ as low and high normalized frequencies.

6. Find the convolution x[n] of the signals $x1[n] = u[n] - u[n-10]$ and $x2[n] = u[n+1] - u[n-5]$. And show that the convolution satisfies commutative property.

7. Implement Example-1 using inbuilt function.

8. Simulate an M-point moving average filter (smoothing FIR filter) given by the equation $y[n] = \sum_{k=0}^{M-1} x[n-k]$ to retrieve low frequency signal, where $x[n] = c_1\cos(2 \pi f_1 n) + c_2 \cos(2 \pi f_2 n)$. Select $f_1$ and $f_2$ as low and high normalized frequencies.

## Exercises

1. Compute the Impulse response of the LSI system given in the Example 3 using `filter` command.

2. Repeat the previous question using inbuilt function `impz`.

3. Investigate the stability of the given causal LSI system characterized by the difference equation: $y[n]+1.5y[n−1]+0.9y[n−2]=x[n]−0.8x[n−1]$

4. Consider the following LSI system characterized by the difference equation: $y[n] = x[n] − 4x[n − 1] + 3x[n − 2] + 1.7y[n − 1] − y[n − 2]$. Compute and plot the impulse response of the system. Is this system stable?

5. Find the impulse response of the systems given below, by using `impz` function:

6. Consider a system described by the difference equation $y[n] = 3x[n] − 2x[n − 1] + 4x[n − 2]$. Compute and plot
a) The impulse response $h[n]$ of the system for $0 \le n \le 10$.
b) The response $y[n]$ of the system to the signal $x[n] = [1,−1,3],0 \le n \le 2$, by using the command `conv` and the command `filter`.

7. Find the system output $y[n]$, $0 \le n \le 10$, of an LSI system when the input $x[n] = \delta[n] + 3\delta[n − 1] + 4\delta[n − 3]$, and the impulse response $h[n] = (0.5)^n(u[n] − u[n − 5])$. Plot the vectors $x$, $h$, and $y$ on the same plot using `subplot` commands.
