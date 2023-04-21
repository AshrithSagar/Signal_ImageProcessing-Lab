%% Experiment - 7
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Contrast stretching transformation
% Histogram
img_histogram = zeros(256, 1);
for i = 1 : M
    for j = 1 : N
        intensity = img_gray(i, j) + 1;
        img_histogram(intensity) = img_histogram(intensity) + 1;
    end
end

% Contrast stretching by Histogram Equalisation
contrast_stretch_table = uint8(cumsum(img_histogram) / sum(img_histogram) * 255);

img_contrast_stretched = zeros(M, N);
for i = 1 : M
    for j = 1 : N
        img_contrast_stretched(i, j) = contrast_stretch_table(1 + img_gray(i, j));
    end
end

% Min-Max Normalisation
img_max = max(img_gray, [], 'all');  % Maximum intensity 
img_min = min(img_gray, [], 'all');  % Minimum intensity
img_contrast_stretched_2 = uint8((img_gray - img_min) / (img_max - img_min) * 255);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_contrast_stretched)
title('Contrast Stretched Lenna (512\times 512)')
