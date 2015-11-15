function [ output_image ] = Assignment( input )

    input_image = imread(input);
    gray_image = rgb2gray(input_image);
    i = Medium(gray_image, 2);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables);
    se = strel('disk',15);
    dilated_image = CirDilate(hole_image,se);
    circle_image = CirErode(dilated_image,se);
    circle_image = circle_image - hole_image;
    circle_image = CirErode(circle_image, strel('disk',1));
    circle_image = CirDilate(circle_image, strel('disk',1));
    count = size(unique(CCLabaling(circle_image)));
    disp(count(1)-1);
    edge_image = edge(circle_image);
    
    output_image = input_image + Binary2green(edge_image);
    
end