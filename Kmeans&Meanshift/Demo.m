% This code is a comparison between “k-means” “mean-shift” 

clc
clear all
close all

%% image

I    = imread('3.jpg');    % Original: also test 2.jpg

% kmeans parameter
K    = 8;                  % Cluster Numbers
% meanshift parameter
bw   = 0.2;                % Mean Shift Bandwidth

Ikm          = Km(I,K);                     % Kmeans (color)
[Ims, Nms]   = Ms(I,bw);                    % Mean Shift (color)

%% Display
figure()
subplot(231); imshow(I);    title('Original'); 
subplot(232); imshow(Ikm);  title(['Kmeans',' : ',num2str(K)]);

subplot(234); imshow(Ims);  title(['MeanShift',' : ',num2str(Nms)]);



