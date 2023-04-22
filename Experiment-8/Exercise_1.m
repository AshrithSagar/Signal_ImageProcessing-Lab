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
