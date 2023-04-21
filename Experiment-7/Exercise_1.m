%% Experiment - 7
% Exercise - 1
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Histogram of an image without inbuilt function
img_histogram = zeros(256, 1);
for i = 1 : M
   for j = 1 : N
      intensity = img_gray(i, j) + 1;
      img_histogram(intensity) = img_histogram(intensity) + 1;
   end
end

%% Histogram of an image with inbuilt function
img_histogram_imhist = imhist(img_gray);

difference = img_histogram_imhist - img_histogram;
diff = any(difference)

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
plot(img_histogram)
title('Histogram of Lenna')

figure;
plot(img_histogram_imhist)
title('Histogram of Lenna `imhist`')
