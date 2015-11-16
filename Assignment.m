function [ output_image ] = Assignment( input )

    %Task 1
    input_image = imread(input);
    gray_image = rgb2gray(input_image);
    i = Medium(gray_image, 3);
    level = graythresh(i);
    denoised_image = im2bw(i,level+0.05);
    
    %Task 2
    lables = CCLabaling(denoised_image);
    thing = SelectValue(lables, 1);
    thing = Dilate(thing, strel('disk',1));
    denoised_image = denoised_image + thing;
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables,2) + SelectValue(lables,3);
    
    %Task 3
    se = strel('disk',15);
    dilated_image = Dilate(hole_image,se);
    circle_image = Erode(dilated_image,se);
    circle_image = circle_image - hole_image;
    circle_image = Erode(circle_image, strel('disk',1));
    circle_image = Dilate(circle_image, strel('disk',1));
    count = size(unique(CCLabaling(circle_image)));
    disp(count(1)-1);
    
    %Task 4
    edge_image = EdgeDetect(circle_image);
    edge_image = Dilate(edge_image,strel('disk',1));
    output_image = input_image + Binary2Green(edge_image);
    figure;
    
end