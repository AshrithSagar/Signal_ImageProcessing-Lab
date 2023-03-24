%% Experiment - 6
% Exercise - 5
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Resize image
img_rotated = imrotate(img_gray, 90);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_rotated)
title('Rotated Lenna (512\times 512)')
