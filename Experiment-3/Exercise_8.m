%% Experiment - 3
% Exercise - 8
clc;
clear;
figure;

%% Frequency response
NUM = [1, 0.5];
DEN = [1, -1.8, 0.81];
Fs = 512;
sys = filt(NUM, DEN);
freqz(NUM, DEN, Fs)
figure;
zplane(NUM, DEN)
