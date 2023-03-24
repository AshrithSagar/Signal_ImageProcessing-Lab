%% Experiment - 6
% Exercise - 9
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Negative image
img_negative = 255 - img_gray;

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_negative)
title('Negative Lenna (512\times 512)')
