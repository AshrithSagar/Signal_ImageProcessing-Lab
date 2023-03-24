%% Experiment - 6
% Exercise - 6
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Binarize image
threshold = 100;
img_binary = imbinarize(img_gray);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_binary)
title('Binary Lenna (512\times 512)')
