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
    thing = CirDilate(thing, strel('disk',1));
    imshow(thing);
    denoised_image = denoised_image + thing;
    figure, imshow(denoised_image);
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables,2) + SelectValue(lables,3);
    
    %Task 3
    se = strel('disk',15);
    dilated_image = CirDilate(hole_image,se);
    circle_image = CirErode(dilated_image,se);
    circle_image = circle_image - hole_image;
    circle_image = CirErode(circle_image, strel('disk',1));
    circle_image = CirDilate(circle_image, strel('disk',1));
    count = size(unique(CCLabaling(circle_image)));
    disp(count(1)-1);
    
    %Task 4
    edge_image = edge(circle_image);
    output_image = input_image + Binary2green(edge_image);
    figure;
    
end