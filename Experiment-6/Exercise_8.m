%% Experiment - 6
% Exercise - 8
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Image cropping
img_crop = imcrop(img_gray, [150 100 225 500]);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_crop)
title('Cropped Lenna')
