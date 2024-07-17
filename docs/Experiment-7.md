# Experiment-7

## Exercises

### Exercise-1

```matlab
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
```

### Exercise-2

```matlab
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
imshow(img_contrast_stretched_2)
title('Contrast Stretched Lenna (512\times 512)')
```

### Exercise-3

```matlab
%% Experiment - 7
% Exercise - 3
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% DFT of an image without inbuilt function
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

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
plot(img_dft)
title('DFT of Lenna')
```

### Exercise-4

```matlab
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
```

### Exercise-5

```matlab
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
```

### Exercise-6

```matlab
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
```
