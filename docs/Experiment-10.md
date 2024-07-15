# Experiment-10

## Exercises

### Exercise-2

```matlab
%% Experiment - 10
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('road.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Detect straight lines with Hough transform
% Initialise Accumulator
t_limit = ceil(sqrt(M^2 + N^2));
accumulator = zeros(360, t_limit);

% Update Accumulator
for i = 1 : M
	for j = 1 : N
		if img_gray(i, j) ~= 0
			for theta = 1 : 360
				t = i * cos(theta) + j * sin(theta);
				t = ceil(abs(t));
				accumulator(theta, t) = accumulator(theta, t) + 1;
			end
		end
	end
end

% Threshold Accumulator
img_lines = zeros(M, N);
threshold = 0.9 * max(accumulator, [], 'all');
for t = 1 : t_limit
	for theta = 1 : 360
		if accumulator(theta, t) > threshold
			for i = 1 : M
				j = (t - i * cos(theta)) / sin(theta);
				j = round(abs(j));
				if and(and((i <= M), (i > 0)), and((j <= N), (j > 0)))
					img_lines(i, j) = 255;
				end
			end
		end
	end
end

%% Display image
figure;
imshow(img_gray)
title('Original Road')

figure;
imshow(img_lines)
title('Hough lines in Road')
```

### Exercise-2-1

```matlab
%% Experiment - 10
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('road.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Detect straight lines with Hough transform
% Apply edge detection
Iedge = edge(img_gray, 'canny');

% Perform the Hough transform
[H,theta,rho] = hough(Iedge);

% Find the peaks in the Hough transform
peak = houghpeaks(H, 10);

% Extract the lines from the Hough transform
lines = houghlines(Iedge, theta, rho, peak);

%% Display image
% Display the lines on the original image
figure;
imshow(img_gray);
hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
end
```

