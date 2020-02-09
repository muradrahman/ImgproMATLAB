  
%% Read in image
I = imread('100TK.jpg');
imshow(I);
%%  Convert to grayscale image
Igray = rgb2gray(I);
imshow(Igray);

 %% Problem: illumination doesn't allow for easy segmentation
level = 0.6;
Ithresh = imbinarize(Igray,level);
imshowpair(I, Ithresh, 'montage');