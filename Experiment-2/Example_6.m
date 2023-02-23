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
	xlabel('n'), ylabel('Amplitude'), legend('x1[m]', 'x2[n-m]')
	subplot(212)
	stem(n, x, 'k')
	xlabel('n'), ylabel('Amplitude'), title('x[n] = x1[n] \ast x2[n]')
	pause(0.5)
end

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
	xlabel('n'), ylabel('Amplitude'), legend('x2[m]', 'x1[n-m]')
	subplot(212)
	stem(n, x, 'k')
	xlabel('n'), ylabel('Amplitude'), title('x[n] = x2[n] \ast x1[n]')
	pause(0.5)
end
