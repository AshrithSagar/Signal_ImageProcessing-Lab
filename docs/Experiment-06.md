# Experiment-6

## Exercises

### Exercise-1

```matlab
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
```

### Exercise-2

```matlab
%% Experiment - 6
% Exercise - 2
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Interpolate image using average method
N = 5;
mask = ones(N, N) * 1/(N^2);
img_interp = conv2(img_gray, mask);
img_interp = uint8(img_interp);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_interp)
title('Interpolated Lenna')
```

### Exercise-3

```matlab
%% Experiment - 6
% Exercise - 3
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Transpose image
img_transpose = img_gray';

%% Flip image about vertical axis
img_vertical = fliplr(img_gray);

%% Flip image about horizontal axis
img_horizontal = flipud(img_gray);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_transpose)
title('Transposed Lenna (512\times 512)')

figure;
imshow(img_vertical)
title('Vertically flipped Lenna (512\times 512)')

figure;
imshow(img_horizontal)
title('Horizontally flipped Lenna (512\times 512)')
```

### Exercise-4

```matlab
%% Experiment - 6
% Exercise - 4
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Resize image
img_resized = imresize(img_gray, 0.5);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_resized)
title('Resized Lenna (256\times 256)')
```

### Exercise-5

```matlab
%% Experiment - 6
% Exercise - 5
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Resize image
img_rotated = imrotate(img_gray, 90);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_rotated)
title('Rotated Lenna (512\times 512)')
```

### Exercise-6

```matlab
%% Experiment - 6
% Exercise - 6
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Binarize image
threshold = 100;
img_binary = imbinarize(img_gray);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_binary)
title('Binary Lenna (512\times 512)')
```

### Exercise-7

```matlab
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
```

### Exercise-8

```matlab
%% Experiment - 6
% Exercise - 8
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Image cropping
img_crop = imcrop(img_gray, [150 100 225 500]);

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_crop)
title('Cropped Lenna')
```

### Exercise-9

```matlab
%% Experiment - 6
% Exercise - 9
clc;
clear;

%% Read image
img_rgb = imread('lenna.jpg');  % Read image
img_gray = rgb2gray(img_rgb);  % Convert to grayscale
[M, N] = size(img_gray);

%% Negative image
img_negative = 255 - img_gray;

%% Display image
figure;
imshow(img_gray)
title('Original Lenna (512\times 512)')

figure;
imshow(img_negative)
title('Negative Lenna (512\times 512)')
```

