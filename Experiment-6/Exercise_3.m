%% Experiment - 6
% Exercise - 3
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Transpose image
img_transpose = img_gray';

%% Flip image about vertical axis
img_vertical = fliplr(img_gray);

%% Flip image about horizontal axis
img_horizontal = flipud(img_gray);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_transpose)
title('Transposed Lenna (512\times 512)')

figure;
imshow(img_vertical)
title('Vertically flipped Lenna (512\times 512)')

figure;
imshow(img_horizontal)
title('Horizontally flipped Lenna (512\times 512)')
