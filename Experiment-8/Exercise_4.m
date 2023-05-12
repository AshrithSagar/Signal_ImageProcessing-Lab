%% Experiment - 8
% Exercise - 4
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Edge detection using High Pass Filter Mask
% hpf = [1 0 -1; 1 0 -1; 1 0 -1];
% hpf = [1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1; 1 1 0 -1 -1];
hpf = [0 -1 0; -1 4 -1; 0 -1 0];
img_edges = conv2(img_gray, hpf);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_edges)
title('Edge detection, Lenna (512\times 512)')
