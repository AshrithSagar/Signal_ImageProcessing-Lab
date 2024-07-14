# Experiment - 8

## Functions

`imnoise`
Add noise to image.
`J = imnoise(I,TYPE,...)` Add noise of a given TYPE to the intensity image $I$.

`medfilt2`
2-D median filtering.
`B = medfilt2(A,[M N])` performs median filtering of the matrix A in two dimensions. Each output pixel contains the median value in the M-by-N neighborhood around the corresponding pixel in the input image. medfilt2 pads the image with zeros on the edges, so the median values for the points within [M N]/2 of the edges may appear distorted.

## Exercises

### Exercise - 1

```matlab
%% Experiment - 8
% Exercise - 1
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Corrupt image with 'Salt and Pepper' noise
img_noised = imnoise(img_gray, 'salt & pepper');

%% Neighbourhood-averaging filter
N = 5;
mask = ones(N, N) * 1/(N^2);
img_filtered = conv2(img_noised, mask);
img_filtered = uint8(img_filtered);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_noised)
title('Salt & Pepper noise added Lenna (512\times 512)')

figure;
imshow(img_filtered)
title('Neighbourhood-averaging on Salt & Pepper noise added Lenna')
```

#### Output

![Exercise-1](../Experiment-8/Exercise_1-1.jpg)
![Exercise-1](../Experiment-8/Exercise_1-2.jpg)
![Exercise-1](../Experiment-8/Exercise_1-3.jpg)

### Exercise - 2

```matlab
%% Experiment - 8
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Median filtering of an image
img_median_filtered = medianFilter2(img_gray, [5, 5]);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_median_filtered)
title('Median filtered Lenna (512\times 512)')

%% medianFilter2: 2-D Median filtering
% Performs zero-padding around edges.
function [output_image] = medianFilter2(input_image, mask_size)
	% input_image: [M, N]
	% mask_size: [m, n]
	[M, N] = size(input_image);
	m = mask_size(1); n = mask_size(2);

	zero_padded_input_image = padarray(input_image, [floor(m/2), floor(n/2)]);
	output_image = zeros(M, N);

	for i = 1 : M
		for j = 1 : N
			patches = zero_padded_input_image(i : i+m-1, j : j+n-1);
			output_image(i, j) = median(patches, 'all');
		end
	end

	output_image = uint8(output_image);
end
```

#### Output

![Exercise-2](../Experiment-8/Exercise_2-1.jpg)
![Exercise-2](../Experiment-8/Exercise_2-2.jpg)

### Exercise - 3

```matlab
%% Experiment - 8
% Exercise - 3
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Corrupt image with 'Salt and Pepper' noise
img_noised = imnoise(img_gray, 'salt & pepper');

%% Median filter
mask_size = [3, 3];
img_median_filtered = medianFilter2(img_noised, mask_size);
img_medfilt2 = medfilt2(img_noised, mask_size);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_noised)
title('Salt & Pepper noise added Lenna (512\times 512)')

figure;
imshow(img_median_filtered)
title('Median filtered Lenna (512\times 512)')

figure;
imshow(img_medfilt2)
title('Median filtered Lenna `medfilt2` (512\times 512)')

%% medianFilter2: 2-D Median filtering
% Performs zero-padding around edges.
function [output_image] = medianFilter2(input_image, mask_size)
	% input_image: [M, N]
	% mask_size: [m, n]
	[M, N] = size(input_image);
	m = mask_size(1); n = mask_size(2);

	zero_padded_input_image = padarray(input_image, [floor(m/2), floor(n/2)]);
	output_image = zeros(M, N);

	for i = 1 : M
		for j = 1 : N
			patches = zero_padded_input_image(i : i+m-1, j : j+n-1);
			output_image(i, j) = median(patches, 'all');
		end
	end

	output_image = uint8(output_image);
end
```

#### Output

![Exercise-3](../Experiment-8/Exercise_3-1.jpg)
![Exercise-3](../Experiment-8/Exercise_3-2.jpg)
![Exercise-3](../Experiment-8/Exercise_3-3.jpg)
![Exercise-3](../Experiment-8/Exercise_3-4.jpg)

### Exercise - 4

```matlab
%% Experiment - 8
% Exercise - 4
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Edge detection using High Pass Filter Mask
% hpf = [1 0 -1; 1 0 -1; 1 0 -1];
% hpf = [1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1];
hpf = [0 -1 0; -1 4 -1; 0 -1 0];
img_edges = conv2(img_gray, hpf);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_edges)
title('Edge detection, Lenna (512\times 512)')
```

#### Output

![Exercise-4](../Experiment-8/Exercise_4-1.jpg)
![Exercise-4](../Experiment-8/Exercise_4-2.jpg)
