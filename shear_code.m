% It sheares whole image rather than the minimum bounding box on the image
% So the output may not be as expected.


% +ve slant = angle between vertical axis and counter clock-wise direction
% -ve slant = angle between vertical axis and clock-wise direction

clear all;
close all;
clc;

i=imread('E:\TI project\finger print detection\samples\1\1.JPG');

slantAngleInDegree=10; 
slantAngleInRadian=(3.14*slantAngleInDegree)/180;
slant=atan(slantAngleInRadian);  

%%%%%%%%%%% For binary image
binImg=im2bw(i);
figure,imshow(binImg),title('Binary Image');

% image is negatively sheared by 'slant' 
deslant=(-1)*slant;
T = maketform('affine', [1 0 0; deslant 1 0; 0 0 1] );
B = imtransform(~binImg,T);     
shearedImg=~B;
figure; imshow(shearedImg); title('Sheared Image');


%{
%%%%%%%%%%% For Gray Scale image
A=imread('a03-040-04-07.png');
A=rgb2gray(A);
theta = 0.25;  % if theta = 25 degree
T = maketform('affine', [1 0 0; theta 1 0; 0 0 1] );
h1 = figure; imshow(A); title('Original Image');
white = 255;
R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(A,T,R,'FillValues',white); 
h2 = figure; imshow(B); title('Sheared Image');
%}

%%%%%%%%%% For color image
%{
A=imread('sh1.png');
a = 0.45;
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
h1 = figure; imshow(A); title('Original Image');
orange = [255 127 0]';
R = makeresampler({'cubic','nearest'},'fill');
B = imtransform(A,T,R,'FillValues',orange); 
h2 = figure; imshow(B);
title('Sheared Image');
%}