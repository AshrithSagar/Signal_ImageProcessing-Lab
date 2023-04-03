%% Experiment - 6
% Exercise - 7
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Bit Plane Mapping
for i = 1 : M
   for j = 1 : N
       MSB = nextpow2(img_gray(i, j)) - 1;
       img_bpm(i, j) = 2^MSB;
   end
end

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_bpm)
title('Bit Plane Mapped Lenna (512\times 512)')
