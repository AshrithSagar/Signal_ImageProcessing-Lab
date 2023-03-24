%% Experiment - 6
% Exercise - 1
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Decimate a given image by a factor of 2
rate = 2;
for i = 1 : M
   for j = 1 : N
        img_decimated(ceil(i/rate), ceil(j/rate)) = img_gray(i, j);
   end
end

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_decimated)
title('Decimated Lenna (256\times 256)')
