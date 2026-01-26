%Fundamental Oeporation for Image Processing in MATLAB
%Date: 18/01/2026
clc;
clear all;
close all;
%Basic Operations that clear the command window and closes the figure
%window
B= randi([0,255],8,8);
display(B);
%to create a 8*8 matrix with random numbers ranging between 0 and 255
I=imread("images.jpeg");
figure
imshow(I);
%Uploading the basic input image
figure %for opening seperate window for each image
Ig=rgb2gray(I); %keyword to convert image to grayscale
imshow(Ig);
%grayscale image shown
I_red=imread("images.jpeg");
I_red(:,:,2)=0; %making the pixels of green channel zero
I_red(:,:,3)=0; %making the pixels of blue channel zero
figure
imshow(I_red);
%the image is converted to red channel only
%to make it blue or green set the other two respective colour pixels to
%zero
Ib=Ig>100;
figure
imshow(Ib);
%the above logical expression sets the value of pixels above 100 to 1 and
%below that to 0 to convert the image to black and white.
