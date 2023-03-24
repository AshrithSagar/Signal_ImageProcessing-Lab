%% Experiment - 6
% Exercise - 4
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Resize image
img_resized = imresize(img_gray, 0.5);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_resized)
title('Resized Lenna (256\times 256)')
