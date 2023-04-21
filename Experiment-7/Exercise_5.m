%% Experiment - 7
% Exercise - 5
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% DFT Transformation and Reconstruction
% DFT of an image with inbuilt function
img_dft = fft2(img_gray);

% Reconstruction of image from DFT with inbuilt function
img_reconstructed = uint8(ifft2(img_dft));

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
plot(img_dft)
title('DFT of Lenna')

figure;
plot(abs(img_dft))
title('Magnitude spectrum of DFT of Lenna')

figure;
imshow(img_reconstructed);
title('Reconstructed image from DFT of Lenna (512\times 512)')
