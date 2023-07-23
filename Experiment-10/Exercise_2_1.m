%% Experiment - 10
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('road.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Detect straight lines with Hough transform
% Apply edge detection
Iedge = edge(img_gray, 'canny');

% Perform the Hough transform
[H,theta,rho] = hough(Iedge);

% Find the peaks in the Hough transform
peak = houghpeaks(H, 10);

% Extract the lines from the Hough transform
lines = houghlines(Iedge, theta, rho, peak);

%% Display image
% Display the lines on the original image
figure;
imshow(img_gray);
hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
end
