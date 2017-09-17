
clc;
clear;
img1 = imread('1.JPG');
img2 = imread('7.BMP');
max = 50;
for i=-10:0.1:10
    img3 = img1;
    img3 = img_rotate_func(img3,i);
    x = matching_func( img3,img2 );
    if x>max
        max = x;
    end
    
end

disp(max);
