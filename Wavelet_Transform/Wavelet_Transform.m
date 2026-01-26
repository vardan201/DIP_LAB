clc ;
clear all;
close all;

I =imread('img.jpeg');
%I=imrotate(I,90);
%subplot(2,3,1);
imshow(I);
title('Original Image');
figure;
%the original image is also a grayscale image
%Ig=rgb2gray(I);

Ig=I;
%subplot(2,3,2);
imshow(Ig);
title('Grayscale Image');
figure;
%doing the discrete wavelet transform 
[Ia,Iv,Ih,Id]=dwt2(Ig,'haar');
Ia=uint8(Ia);
Iv=uint8(Iv);
Ih=uint8(Ih);
Id=uint8(Id);

%subplot(2,3,3);
imshow(Ia);
title('Approximation (LL) Image - Ia');
figure;
%subplot(2,3,4);
imshow(Iv);
title('Vertical Detail (LH) Image - Iv');
figure;
%subplot(2,3,5);
imshow(Ih);
title('Horizontal Detail (HL) Image - Ih');
figure;
%subplot(2,3,6);
imshow(Id);
title('Diagonal Detail (HH) Image - Id');
figure;

%recovering the original image
I_recover=idwt2(Ia,Iv,Ih,Id,'haar');
I_recover = uint8(I_recover);
imshow(I_recover);
title('Recovered Image');