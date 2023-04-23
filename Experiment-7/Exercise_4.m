%% Experiment - 7
% Exercise - 4
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Image reconstruction from DFT without inbuilt function
% DFT of an image without inbuilt function
img_dft_real = zeros(M, N);  %% DFT results
img_dft_imag = zeros(M, N);  %% DFT results
m = 1 : M; n = 1 : N;
img_input = double(img_gray);

for k = 1 : M
    disp(k);
    for l = 1 : N
        twiddle_matrix_real = (cos(2 * pi * m / M) .^ k) .* (cos(2 * pi * n / N) .^ l);
        img_dft_real(k, l) = sum(img_input .* twiddle_matrix_real, 'all');
        twiddle_matrix_imag = (sin(2 * pi * m / M) .^ k) .* (sin(2 * pi * n / N) .^ l);
        img_dft_imag(k, l) = sum(img_input .* twiddle_matrix_imag, 'all');
    end
end
img_dft_real = 1/(M * N) * img_dft_real;
img_dft_imag = 1/(M * N) * img_dft_imag;
img_dft = img_dft_real - i * img_dft_imag;

% Inverse DFT
img_idft = zeros(M, N);  %% IDFT results
m = 1 : M; n = 1 : N;

for k = 1 : M
    disp(k);
    for l = 1 : N
        twiddle_matrix_real = (cos(2 * pi * m / M) .^ k) .* (cos(2 * pi * n / N) .^ l);
        img_idft_real(k, l) = sum(img_dft .* twiddle_matrix_real, 'all');
        twiddle_matrix_imag = (sin(2 * pi * m / M) .^ k) .* (sin(2 * pi * n / N) .^ l);
        img_idft_imag(k, l) = sum(img_dft .* twiddle_matrix_imag, 'all');
    end
end
img_idft_real = 1/(M * N) * img_idft_real;
img_idft_imag = 1/(M * N) * img_idft_imag;
img_idft = img_idft_real + i * img_idft_imag;

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_idft)
title('Reconstructed image from DFT of Lenna (512\times 512)')
