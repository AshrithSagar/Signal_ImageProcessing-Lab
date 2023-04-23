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
