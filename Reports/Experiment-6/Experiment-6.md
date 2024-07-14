# Experiment - 6

## Functions

### `imread`

Read image from graphics file. `[...] = imread(FILENAME)` attempts to infer the format of the file from its content.

### `rgb2gray`

Convert RGB image or colormap to grayscale. `rgb2gray` converts RGB images to grayscale by eliminating the hue and saturation information while retaining the luminance. `I = rgb2gray(RGB)` converts the truecolor image RGB to the grayscale intensity image `I`.

### `size`

Size of array. `[M,N] = size(X)` for matrix `X`, returns the number of rows and columns in `X` as separate output variables.

### `imshow`

Display image in Handle Graphics figure. `imshow(I)` displays the grayscale image `I`.

### `ones`

Ones array. `ones(M,N)` or `ones([M,N])` is an $M$-by-$N$ matrix of ones.

### `conv2`

Two dimensional convolution. `C = conv2(A, B)` performs the $2$-D convolution of matrices $A$ and $B$. If `[ma,na] = size(A)`, `[mb,nb] = size(B)`, and `[mc,nc] = size(C)`, then `mc = max([ma+mb-1,ma,mb])` and `nc = max([na+nb-1,na,nb])`.

### `uint8`

Convert to unsigned 8-bit integer. `I = uint8(X)` converts the elements of the array `X` into unsigned $8$-bit integers.

### `fliplr`

Flip array in left/right direction. `Y = fliplr(X)` returns `X` with the order of elements flipped left to right along the second dimension.

### `flipud`

Flip array in up/down direction. `Y = flipud(X)` returns `X` with the order of elements flipped upside down along the first dimension.

### `imresize`

Resize image. `B = imresize(A, SCALE)` returns an image that is SCALE times the size of `A`, which is a grayscale, RGB, binary or a categorical image.

### `imrotate`

Rotate image. `B = imrotate(A,ANGLE)` rotates image `A` by `ANGLE` degrees in a counterclockwise direction around its center point. To rotate the image clockwise, specify a negative value for `ANGLE`.

### `imbinarize`

Binarize grayscale 2D image or 3D volume by thresholding. `BW = imbinarize(I)` binarizes image `I` with a global threshold computed using Otsu's method, which chooses the threshold to minimize the intraclass variance of the thresholded black and white pixels. `BW` is the output binary image.

### `nextpow2`

Next higher power of 2. `nextpow2(N)` returns the first $P$ such that `2.^P >= abs(N)`. It is often useful for finding the nearest power of two sequence length for FFT operations.

### `imcrop`

Crop image. `I2 = imcrop(I,RECT)`. RECT can be a 4-element vector with the form `[XMIN YMIN WIDTH HEIGHT]`;

## Exercises

### Exercise - 1

Write a program to decimate a given image.

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

#### Output

<p align="center">
  <img alt="Exercise-1" src="../Experiment-6/Exercise_1-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-1" src="../Experiment-6/Exercise_1-2.jpg" width="40%">
</p>

#### Observations

The image is decimated by a factor of 2, effectively downsampled to half the size.

### Exercise - 2

Write a program to interpolate the given image using average method.

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

#### Output

<p align="center">
  <img alt="Exercise-2" src="../Experiment-6/Exercise_2-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-2" src="../Experiment-6/Exercise_2-2.jpg" width="40%">
</p>

#### Observations

The image is interpolated using average method, effectively causing blurring action.

### Exercise - 3

Write a program to
   1. Transpose an image
   2. Flip an image about the vertical axis
   3. Flip an image about the horizontal axis

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

#### Output

<p align="center">
  <img alt="Exercise-3" src="../Experiment-6/Exercise_3-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-3" src="../Experiment-6/Exercise_3-2.jpg" width="40%">
</p>
<p align="center">
  <img alt="Exercise-3" src="../Experiment-6/Exercise_3-3.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-3" src="../Experiment-6/Exercise_3-4.jpg" width="40%">
</p>

#### Observations

Transposed, Vertically flipped, Horizontally flipped images are obtained.

### Exercise - 4

Write a program to resize an image using inbuilt function `imresize`.

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

#### Output

<p align="center">
  <img alt="Exercise-4" src="../Experiment-6/Exercise_4-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-4" src="../Experiment-6/Exercise_4-2.jpg" width="40%">
</p>

#### Observations

The image is resized using `imresize`.

### Exercise - 5

Write a program to rotate an image using inbuilt function `imrotate`.

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

#### Output

<p align="center">
  <img alt="Exercise-5" src="../Experiment-6/Exercise_5-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-5" src="../Experiment-6/Exercise_5-2.jpg" width="40%">
</p>

#### Observations

The image is rotated using `imrotate`.

### Exercise - 6

Write a program to convert a grayscale image to binary (thresholding).

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

#### Output

<p align="center">
  <img alt="Exercise-6" src="../Experiment-6/Exercise_6-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-6" src="../Experiment-6/Exercise_6-2.jpg" width="40%">
</p>

#### Observations

The image is binarized using `imbinarize`

### Exercise - 7

Write a program to perform bit-plane mapping (i.e. determine the visually significant bits in the image) of an image.

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

#### Output

<p align="center">
  <img alt="Exercise-7" src="../Experiment-6/Exercise_7-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-7" src="../Experiment-6/Exercise_7-2.jpg" width="40%">
</p>

#### Observations

Bit Plane Mapping is performed; Only the visually significant bits in the image are retained.

### Exercise - 8

Write a program to extract a rectangular portion of an image using inbuilt function `imcrop`.

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

#### Output

<p align="center">
  <img alt="Exercise-8" src="../Experiment-6/Exercise_8-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-8" src="../Experiment-6/Exercise_8-2.jpg" width="40%">
</p>

#### Observations

The image is cropped using `imcrop`.

### Exercise - 9

Write a program to find the negative of an image.

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

#### Output

<p align="center">
  <img alt="Exercise-9" src="../Experiment-6/Exercise_9-1.jpg" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Exercise-9" src="../Experiment-6/Exercise_9-2.jpg" width="40%">
</p>

#### Observations

The image is negated by converting every intensity to $(255-\text{Current intensity})$.
