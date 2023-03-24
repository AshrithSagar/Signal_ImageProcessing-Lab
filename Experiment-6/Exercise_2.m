%% Experiment - 6
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Interpolate image using average method
N = 5;
mask = ones(N, N) * 1/(N^2);
img_interp = conv2(img_gray, mask);
img_interp = uint8(img_interp);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_interp)
title('Interpolated Lenna')
