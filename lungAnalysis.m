function [ output_image ] = lungAnalysis( input )

    %Task 1
    input_image = imread(input);
    gray_image = rgb2gray(input_image);
    i = Medium(gray_image, 3);
    i = RemoveValue(i, 210);
    i = imadjust(i,[0.1 0.65],[], 1.5);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    %figure, imshow(denoised_image);
    
    %Task 2
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables,2) + SelectValue(lables,3);
    dilated_image = Dilate(hole_image,strel('disk',15));
    circle_image = Erode(dilated_image,strel('disk',15));
    %figure, imshow(circle_image);
    
    %Task 3
    circle_image = circle_image - hole_image;
    circle_image = Erode(circle_image, strel('square',2));
    circle_image = Dilate(circle_image, strel('square',2));  
    count = size(unique(CCLabaling(circle_image)));
    disp(count(1)-1);
    %figure, imshow(circle_image); 
    
    %Task 4
    edge_image = EdgeDetect(circle_image);
    edge_image = Dilate(edge_image,strel('disk',1));
    output_image = input_image + Binary2Green(edge_image);
    figure, imshow(output_image);
    
end