# Discrete Time System and its Properties

## Examples

1. Determine and plot the response of an accumulator for an input sequence 𝑥[𝑛] = 𝑢[𝑛] + 2𝑢[𝑛 − 1] − 3𝑢[𝑛 − 3]. Consider the system is at rest.

2. Determine and plot the response of an bilinear interpolator for an input sequence 𝑥[𝑛] = 𝛿[𝑛] + 2𝛿[𝑛 − 4] − 3𝛿[𝑛 − 8]. Consider the system is at rest.

3. Investigate the linearity property of a causal system described by the differenceequation 𝑦[𝑛]−0.4𝑦[𝑛−1]+0.75𝑦[𝑛−2]=2.2403𝑥[𝑛]+2.4908𝑥[𝑛− 1] + 2.2403𝑥[𝑛 − 2]. Where 𝑥[𝑛] = cos (2𝜋𝑓𝑛)

4. Investigate the shift invariance property of a causal system given in Example-3. Given 𝑥[𝑛] = 𝑐_1 cos(2𝜋𝑓_1 𝑛) + 𝑐_2 𝑐𝑜𝑠(2𝜋𝑓_2 𝑛). Select 𝑓_1 and 𝑓_2 as low and high normalized frequencies and choose any arbitrary constants 𝑐_1 and 𝑐_2

5. Simulate an M-point moving average filter (smoothing FIR filter) given by
the equation 𝑦[𝑛] = 1 ∑𝑀−1 𝑥[𝑛 − 𝑘] to retrieve low frequency signal. where 𝑥[𝑛] = 𝑐_1 cos(2𝜋𝑓_1 𝑛) + 𝑐_2 𝑐𝑜𝑠(2𝜋𝑓_2 𝑛). Select 𝑓_1 and 𝑓_2 as low and high normalized frequencies.

6. Find the convolution 𝑥[𝑛] of the signals 𝑥1[𝑛] = 𝑢[𝑛] − 𝑢[𝑛 − 10] and 𝑥2[𝑛] = 𝑢[𝑛 + 1] − 𝑢[𝑛 − 5]. And show that the convolution satisfies commutative property.

7. Implement Example-1 using inbuilt function.

8. Simulate an M-point moving average filter (smoothing FIR filter) given by the equation 𝑦[𝑛] = 1 ∑𝑀−1 𝑥[𝑛 − 𝑘] to retrieve low frequency signal. where 𝑥[𝑛] =
cos(2𝜋𝑓 𝑛) + 𝑐𝑜𝑠(2𝜋𝑓 𝑛). Select 𝑓 and 𝑓 as low and high normalized frequencies.

## Exercises

1. Compute the Impulse response of the LSI system given in the Example 3 using filter command.

2. Repeat the previous question using inbuilt function impz.

3. Investigate the stability of the given causal LSI system characterized by the
differenceequation: 𝑦[𝑛]+1.5𝑦[𝑛−1]+0.9𝑦[𝑛−2]=𝑥[𝑛]−0.8𝑥[𝑛−1]

4. Consider the following LSI system characterized by the difference equation: 𝑦[𝑛] =
𝑥[𝑛] − 4𝑥[𝑛 − 1] + 3𝑥[𝑛 − 2] + 1.7𝑦[𝑛 − 1] − 𝑦[𝑛 − 2]. Compute and plot the
impulse response of the system. Is this system stable?

5. Find the impulse response of the systems given below, by using impz function:

6. Consider a system described by the difference equation 𝑦[𝑛] = 3𝑥[𝑛] − 2𝑥[𝑛 − 1] + 4𝑥[𝑛 − 2]
Compute and plot
a) The impulse response h[n] of the system for 0 ≤ 𝑛 ≤ 10.
b) The response y[n] of the system to the signal 𝑥[𝑛] = [1,−1,3],0 ≤ 𝑛 ≤ 2, by
using the command conv and the command filter.

7. Find the system output 𝑦[𝑛], 0 ≤ 𝑛 ≤ 10, of an LSI system when the input 𝑥[𝑛] =
𝛿[𝑛] + 3𝛿[𝑛 − 1] + 4𝛿[𝑛 − 3], and the impulse response h[𝑛] = (0.5)𝑛(𝑢[𝑛] − 𝑢[𝑛 − 5]). Plot the vectors x, h, and y on the same plot using subplot commands.
