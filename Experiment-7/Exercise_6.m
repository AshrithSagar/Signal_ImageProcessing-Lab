%% Experiment - 7
% Exercise - 1
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% DFT of a rotated image
img_rotated = imrotate(img_gray, 90);
img_rotated_dft = fft2(img_rotated);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
plot(img_rotated_dft)
title('DFT of Rotated Lenna')

figure;
plot(abs(img_rotated_dft))
title('Magnitude spectrum of DFT of Rotated Lenna')
