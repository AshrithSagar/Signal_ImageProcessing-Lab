# Experiment-9

## Exercises

### Exercise-1

```matlab
%% Experiment - 9
% Exercise - 1
clc;
clear;

%% Radon transform of a Modified Shepp-Logon Phantom
img_phantom = phantom('Modified Shepp-Logan', 512);
theta = 0 : 179;
img_radon = radon(img_phantom, theta);
% img_iradon = iradon(img_phantom, theta);

%% Display image
figure;
imshow(img_phantom)
title('Modified Shepp-Logon Phantom')

figure;
imshow(img_radon)
title('Radon transform of a Modified Shepp-Logon Phantom')

% figure;
% imshow(img_iradon)
% title('Reconstruction through Inverse Radon transform')
```

