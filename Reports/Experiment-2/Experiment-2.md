# Experiment - 2

## Examples

### Example - 1

> Determine and plot the response of an accumulator for an input sequence 𝑥[𝑛] = 𝑢[𝑛] + 2𝑢[𝑛 − 1] − 3𝑢[𝑛 − 3]. Consider the system is at rest.

```matlab
%% Experiment - 2
% Example - 1
clc;
clear;
figure;

%% Without using inbuilt function
n = -5 : 10; % Discrete time index
x = [n >= 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal

y = 0;  % y[-1] = 0
for k = 1 : length(n)
	term = y(end) + x(k);
	y = [y term];
end
y = y(2:end);  % Left shift by 1 unit

subplot(211)
hold on;
stem(x, 'filled')
stem(y, 'filled')
hold off;
title('Accumulator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')

%% With using inbuilt function
n = -5 : 10; % Discrete time index
x = [n >= 0] + 2 * [n >= 1] - 3 * [n >= 3];  % Input signal

y = filter([1], [1, -1], x);

subplot(212)
hold on;
stem(x, 'filled')
stem(y, 'filled')
hold off;
title('Accumulator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')
```

#### Output

![Example-1](../Experiment-2/Example_1.jpg)

### Example - 2

> Determine and plot the response of an bilinear interpolator for an input sequence 𝑥[𝑛] = 𝛿[𝑛] + 2𝛿[𝑛 − 4] − 3𝛿[𝑛 − 8]. Consider the system is at rest.

```matlab
%% Experiment - 2
% Example - 2
clc;
clear;
figure;

%% Without using inbuilt function
n = -5 : 15;  % Discrete time index
x = [n == 0] + 2 * [n == 4] - 3 * [n == 8];  % Input signal
x1 = [0 0 x];  % x[n-1]
x2 = [0 x 0];  % x[n]
x3 = [x 0 0];  % x[n+1]
y = x2 + (x1 + x3) / 2;
y(1) = []; y(end) = [];

subplot(211)
hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Bilinear interpolator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')

%% With using inbuilt function
n = -5 : 15;  % Discrete time index
x = [n == 0] + 2 * [n == 4] - 3 * [n == 8];  % Input signal
y = filter([1/2, 1, 1/2], [1], x);
y(end+1) = 0;
y = y(2:end);  % Left shift by 1 unit

subplot(212)
hold on;
stem(n, x, 'filled')
stem(n, y, 'filled')
hold off;
title('Bilinear interpolator response', 'Ashrith 200902016')
legend('Input x[n]', 'Output y[n]')
xlabel('n'), ylabel('Amplitude')
```

#### Output

![Example-2](../Experiment-2/Example_2.jpg)

### Example - 3

> Investigate the linearity property of a causal system described by the differenceequation 𝑦[𝑛]−0.4𝑦[𝑛−1]+0.75𝑦[𝑛−2]=2.2403𝑥[𝑛]+2.4908𝑥[𝑛− 1] + 2.2403𝑥[𝑛 − 2]. Where 𝑥[𝑛] = cos (2𝜋𝑓𝑛)

```matlab
%% Experiment - 2
% Example - 3
clc;
clear;
figure;

%% Linearity property of LSI systems
n = -100 : 100;  % Discrete time index
f_1 = 0.01;  % Normalised frequency 1
f_2 = 0.02;  % Normalised frequency 2
c_1 = 2;
c_2 = 3;

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

x_1 = cos(2 * pi * f_1 * n);
x_2 = cos(2 * pi * f_2 * n);
x = c_1 * x_1 + c_2 * x_2;  % Linear combination of x_1 and x_2

y_1 = filter(NUM, DEN, x_1);
y_2 = filter(NUM, DEN, x_2);
y_c = c_1 * y_1 + c_2 * y_2;  % Output of combined individual outputs

y = filter(NUM, DEN, x);  % Output of combined inputs
y_d = y - y_c;

hold on;
stem(n, y_c, 'filled')
stem(n, y, 'filled')
stem(n, y_d, 'filled')
hold off;
title('Linearity property of LSI systems', 'Ashrith 200902016')
legend('y_c', 'y', 'y_d')
xlabel('n'), ylabel('Amplitude')
```

#### Output

![Example-3](../Experiment-2/Example_3.jpg)

### Example - 4

> Investigate the shift invariance property of a causal system given in Example-3. Given 𝑥[𝑛] = 𝑐_1 cos(2𝜋𝑓_1 𝑛) + 𝑐_2 𝑐𝑜𝑠(2𝜋𝑓_2 𝑛). Select 𝑓_1 and 𝑓_2 as low and high normalized frequencies and choose any arbitrary constants 𝑐_1 and 𝑐_2

```matlab
%% Experiment - 2
% Example - 4
clc;
clear;
figure;

%% Shift Invariant property of LSI systems
n = 0 : 100;  % Discrete time index
k = 10;  % Delay

f_1 = 0.01;  % Normalised frequency 1
f_2 = 0.02;  % Normalised frequency 2
c_1 = 2;
c_2 = 3;

x = c_1 * cos(2 * pi * f_1 * n) + c_1 * cos(2 * pi * f_2 * n);  % Input sequence
x_d = x(k+1:end);  % Delayed input sequence

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

y = filter(NUM, DEN, x);  % Response of system for input sequence
y_d = y(k+1:end);  % Delayed response sequence

y_di = filter(NUM, DEN, x_d);  % Response of system for delayed input
d = y_d - y_di;  % Difference

hold on;
stem(y_di, 'filled')
stem(y_d, 'filled')
stem(d, 'filled')
hold off;
title('Shift Invariant property of LSI systems', 'Ashrith 200902016')
legend('y_{di}', 'y_d', 'd')
xlabel('n'), ylabel('Amplitude')
```

#### Output

![Example-4](../Experiment-2/Example_4.jpg)

### Example - 5

> Simulate an M-point moving average filter (smoothing FIR filter) given by
> the equation 𝑦[𝑛] = 1 ∑𝑀−1 𝑥[𝑛 − 𝑘] to retrieve low frequency signal. where 𝑥[𝑛] = 𝑐_1 cos(2𝜋𝑓_1 𝑛) + 𝑐_2 𝑐𝑜𝑠(2𝜋𝑓_2 𝑛). Select 𝑓_1 and 𝑓_2 as low and high normalized frequencies.

```matlab
%% Experiment - 2
% Example - 5
clc;
clear;
figure;

%% M-point Moving Average Filter (Smoothing FIR Filter)
n = -50 : 100;  % Discrete time index
f_1 = 0.01;
f_2 = 0.95;

s_1 = cos(2 * pi * f_1 * n);  % Low frequency signal
s_2 = cos(2 * pi * f_2 * n);  % High frequency signal
x = s_1 + s_2;  % Input sequence

Ms = [3, 5, 7];  % M-point Moving Average
for M = Ms
	NUM = 1/M * ones(1, M);  % Numerator coefficients of T[z]
	DEN = [1];  % Denominator coefficients of T[z]

	y_M = filter(NUM, DEN, x);

	subplot(length(Ms), 1, find(M == Ms))
	hold on;
	stem(n, x, 'filled')
	stem(n, s_1, 'filled')
	stem(n, y_M, 'filled')
	hold off;
	legend('x', 's_1', 'y')
	title(M + "-point Moving Average Filter (Smoothing FIR Filter)", 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude')
end
```

#### Output

![Example-5](../Experiment-2/Example_5.jpg)

### Example - 6

> Find the convolution 𝑥[𝑛] of the signals 𝑥1[𝑛] = 𝑢[𝑛] − 𝑢[𝑛 − 10] and 𝑥2[𝑛] = 𝑢[𝑛 + 1] − 𝑢[𝑛 − 5]. And show that the convolution satisfies commutative property.

```matlab
%% Experiment - 2
% Example - 6
clc;
clear;
figure;

%% Input signals
n = -20 : 20;  % Discrete time index
u = ge(n, 0);
u5 = ge(n, 5);
u10 = ge(n, 10);
u_1 = ge(n, -1);

x1 = u - u10;
range_x1 = n(x1 ~= 0);
start_index_x1 = range_x1(1);
end_index_x1 = range_x1(end);

x2 = u_1 - u5;
range_x2 = n(x2 ~= 0);
start_index_x2 = range_x2(1);
end_index_x2 = range_x2(end);

%% Convolution (x1 * x2)
flip_x2 = fliplr(x2);  % x2[-n]
range_flip_x2 = n(flip_x2 ~= 0);
start_index_flip_x2 = range_flip_x2(1);
end_index_flip_x2 = range_flip_x2(end);

flip_x2 = flip_x2(find(start_index_flip_x2 == n) : find(end_index_flip_x2 == n));
x = zeros(1, length(n));

for i = start_index_x1 + start_index_x2 : end_index_x1 + end_index_x2
	temp = zeros(1, length(n));
	temp(find(start_index_x2 + i == n) : find(end_index_x2 + i == n)) = flip_x2;
	s = sum(x1 .* temp);
	x(n == i) = s;
	subplot(211)
	stem(n, x1), hold on, stem(n, temp, 'r'), hold off
	title("Input signals x1 and x2", 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude'), legend('x1[m]', 'x2[n-m]')
	subplot(212)
	stem(n, x, 'k')
	title('x[n] = x1[n] \ast x2[n]', 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude')
	pause(0.5)
end

pause(2)

%% Convolution (x2 * x1)
flip_x1 = fliplr(x1);  % x1[-n]
range_flip_x1 = n(flip_x1 ~= 0);
start_index_flip_x1 = range_flip_x1(1);
end_index_flip_x1 = range_flip_x1(end);

flip_x1 = flip_x1(find(start_index_flip_x1 == n) : find(end_index_flip_x1 == n));
x = zeros(1, length(n));

for i = start_index_x1 + start_index_x2 : end_index_x1 + end_index_x2
	temp = zeros(1, length(n));
	temp(find(start_index_x1 + i == n) : find(end_index_x1 + i == n)) = flip_x1;
	s = sum(x2 .* temp);
	x(n == i) = s;
	subplot(211)
	stem(n, x2), hold on, stem(n, temp, 'r'), hold off
	title("Input signals x1 and x2", 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude'), legend('x2[m]', 'x1[n-m]')
	subplot(212)
	stem(n, x, 'k')
	title('x[n] = x2[n] \ast x1[n]', 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude')
	pause(0.5)
end
```

#### Output

![Example-6](../Experiment-2/Example_6-1.jpg)

![Example-6](../Experiment-2/Example_6-2.jpg)

### Example - 7

> Implement Example-1 using inbuilt function.

```matlab
%% Experiment - 2
% Example - 7
clc;
clear;
figure;

%% Input signals
n = -20 : 20;  % Discrete time index
u = ge(n, 0);
u5 = ge(n, 5);
u10 = ge(n, 10);
u_1 = ge(n, -1);

x1 = u - u10;
x2 = u_1 - u5;

%% Convolution (x1 * x2), using conv()
x_12 = conv(x1, x2);
subplot(211)
stem(x_12, 'k')
title('x[n] = x1[n] \ast x2[n]', 'Ashrith 200902016')
xlabel('n'), ylabel('Amplitude')

%% Convolution (x1 * x2), using conv()
x_21 = conv(x2, x1);
subplot(212)
stem(x_21, 'k')
title('x[n] = x2[n] \ast x1[n]', 'Ashrith 200902016')
xlabel('n'), ylabel('Amplitude')
```

#### Output

![Example-7](../Experiment-2/Example_7.jpg)

### Example - 8

> Simulate an M-point moving average filter (smoothing FIR filter) given by the equation 𝑦[𝑛] = 1 ∑𝑀−1 𝑥[𝑛 − 𝑘] to retrieve low frequency signal. where 𝑥[𝑛] = cos(2𝜋𝑓 𝑛) + 𝑐𝑜𝑠(2𝜋𝑓 𝑛). Select 𝑓 and 𝑓 as low and high normalized frequencies.

```matlab
%% Experiment - 2
% Example - 8
clc;
clear;
figure;

%% M-point Moving Average Filter (Smoothing FIR Filter)
n = -50 : 100;  % Discrete time index
f_1 = 0.01;
f_2 = 0.95;

s_1 = cos(2 * pi * f_1 * n);  % Low frequency signal
s_2 = cos(2 * pi * f_2 * n);  % High frequency signal
x = s_1 + s_2;  % Input sequence

Ms = [3, 5, 7];  % M-point Moving Average
for M = Ms
	NUM = 1/M * ones(1, M);  % Numerator coefficients of T[z]
	DEN = [1];  % Denominator coefficients of T[z]

	h = impz(NUM, DEN);  % Impulse response
	y_M = conv(x, h);

	subplot(length(Ms), 1, find(M == Ms))
	hold on;
	stem(x, 'filled')
	stem(s_1, 'filled')
	stem(y_M, 'filled')
	hold off;
	legend('x', 's_1', 'y')
	title(M + "-point Moving Average Filter (Smoothing FIR Filter)", 'Ashrith 200902016')
	xlabel('n'), ylabel('Amplitude')
end
```

#### Output

![Example-8](../Experiment-2/Example_8.jpg)

## Exercises

### Exercise - 1

> Compute the Impulse response of the LSI system given in the Example 3 using filter command.

```matlab
%% Experiment - 2
% Exercise - 1
clc;
clear;
figure;

n = -100 : 100;  % Discrete time index

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

x = [n == 0];  % delta[n]

h = filter(NUM, DEN, x);

stem(n, h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-1](../Experiment-2/Exercise_1.jpg)

### Exercise - 2

> Repeat the previous question using inbuilt function impz.

```matlab
%% Experiment - 2
% Exercise - 2
clc;
clear;
figure;

n = -100 : 100;  % Discrete time index

NUM = [2.2403, 2.4908, 2.2403];  % Numerator coefficients of T[z]
DEN = [1, -0.4, 0.75];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-2](../Experiment-2/Exercise_2.jpg)

### Exercise - 3

> Investigate the stability of the given causal LSI system characterized by the
> differenceequation: 𝑦[𝑛]+1.5𝑦[𝑛−1]+0.9𝑦[𝑛−2]=𝑥[𝑛]−0.8𝑥[𝑛−1]

```matlab
%% Experiment - 2
% Exercise - 3
clc;
clear;
% figure;

n = -100 : 100;  % Discrete time index

NUM = [1, -0.8];  % Numerator coefficients of T[z]
DEN = [1, 1.5, 0.9];  % Denominator coefficients of T[z]

sys = filt(NUM, DEN)  % Define the system
[p, z] = pzmap(sys);  % Calculate poles and zeros
stable = all(abs(p) < 1)  % Check whether all poles lie within unit circle
```

#### Output

![Exercise-3](../Experiment-2/Exercise_3.jpg)

### Exercise - 4

> Consider the following LSI system characterized by the difference equation: 𝑦[𝑛] =
> 𝑥[𝑛] − 4𝑥[𝑛 − 1] + 3𝑥[𝑛 − 2] + 1.7𝑦[𝑛 − 1] − 𝑦[𝑛 − 2]. Compute and plot the
> impulse response of the system. Is this system stable?

```matlab
%% Experiment - 2
% Exercise - 4
clc;
clear;
figure;

n = -100 : 100;  % Discrete time index

NUM = [1, -4, 3];  % Numerator coefficients of T[z]
DEN = [1, -1.7, 1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

sys = filt(NUM, DEN)  % System
[p, z] = pzmap(sys);  % Poles and Zeros
stable = all(abs(p) < 1)  % Check whether all poles lie within unit circle

stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-4](../Experiment-2/Exercise_4-1.jpg)

![Exercise-4](../Experiment-2/Exercise_4-2.jpg)

### Exercise - 5

> Find the impulse response of the systems given below, by using impz function:
>
> 1. 𝐻(𝑧) = 1+2𝑧−1 (1+0.2𝑧−1)(1+0.6𝑧−1)
> 2. 𝐻(𝑧) = 1+𝑧−1 (1−0.5𝑧−1)(1+0.3𝑧−1)

```matlab
%% Experiment - 2
% Exercise - 5
clc;
clear;
figure;

%% (a)
n = -100 : 100;  % Discrete time index

NUM_a = [1, 2];  % Numerator coefficients of T[z]
DEN_a = [1, 0.8, 0.12];  % Denominator coefficients of T[z]

h_a = impz(NUM_a, DEN_a);  % Impulse response

subplot(211)
stem(h_a, 'filled')
title('(a) Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')

%% (b)
n = -100 : 100;  % Discrete time index

NUM_b = [1, 1];  % Numerator coefficients of T[z]
DEN_b = [1, -0.2, -0.15];  % Denominator coefficients of T[z]

h_b = impz(NUM_b, DEN_b);  % Impulse response

subplot(212)
stem(h_b, 'filled')
title('(b) Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-5](../Experiment-2/Exercise_5.jpg)

### Exercise - 6

> Consider a system described by the difference equation 𝑦[𝑛] = 3𝑥[𝑛] − 2𝑥[𝑛 − 1] + 4𝑥[𝑛 − 2]
> Compute and plot
> a) The impulse response h[n] of the system for 0 ≤ 𝑛 ≤ 10.
> b) The response y[n] of the system to the signal 𝑥[𝑛] = [1,−1,3],0 ≤ 𝑛 ≤ 2, by
> using the command conv and the command filter.

```matlab
%% Experiment - 2
% Exercise - 6
clc;
clear;
figure;

%% (a)
n = 0 : 10;  % Discrete time index

NUM = [3, -2, 4];  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);

subplot(211)
stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h'), xlabel('n'), ylabel('Amplitude')

%% (b)
n = 0 : 2;  % Discrete time index
x = [1, -1, 3];  % Input signal

NUM = [3, -2, 4];  % Numerator coefficients of T[z]
DEN = [1];  % Denominator coefficients of T[z]

h = impz(NUM, DEN);  % Impulse response
y_c = conv(x, h);

y_f = filter(NUM, DEN, x);

subplot(212)
hold on
stem(y_c, 'filled')
stem(y_f, 'filled')
hold off
title('Response of LSI system', 'Ashrith 200902016')
legend('y_c', 'y_f'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-6](../Experiment-2/Exercise_6.jpg)

### Exercise - 7

> Find the system output 𝑦[𝑛], 0 ≤ 𝑛 ≤ 10, of an LSI system when the input 𝑥[𝑛] =
> 𝛿[𝑛] + 3𝛿[𝑛 − 1] + 4𝛿[𝑛 − 3], and the impulse response h[𝑛] = (0.5)𝑛(𝑢[𝑛] − 𝑢[𝑛 − 5]). Plot the vectors x, h, and y on the same plot using subplot commands.

```matlab
%% Experiment - 2
% Exercise - 7
clc;
clear;
figure;

n = 0 : 10;  % Discrete time index
x = [n == 0] + 3 * [n == 1] + 4 * [n == 3];  % Input signal
h = (0.5 .^ n) .* (ge(n, 0) - ge(n, 5));  % Impulse response

y = conv(x, h);  % System output

subplot(311)
stem(x, 'filled')
title('Input signal', 'Ashrith 200902016')
legend('x[n]'), xlabel('n'), ylabel('Amplitude')

subplot(312)
stem(h, 'filled')
title('Impulse response of LSI system', 'Ashrith 200902016')
legend('h[n]'), xlabel('n'), ylabel('Amplitude')

subplot(313)
stem(y, 'filled')
title('Response of LSI system', 'Ashrith 200902016')
legend('y[n]'), xlabel('n'), ylabel('Amplitude')
```

#### Output

![Exercise-7](../Experiment-2/Exercise_7.jpg)
