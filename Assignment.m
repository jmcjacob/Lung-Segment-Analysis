function [ output_image ] = Assignment( input )

    input_image = imread(input);
    input_image = rgb2gray(input_image);
    i = imfilter(input_image, fspecial('average', [2,2]));
    %i = Medium(i, 2);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables);
    se = strel('disk',15);
    dilated_image = CirDilate(hole_image,se);
    output_image = CirErode(dilated_image,se);
    output_image = output_image - hole_image;
    output_image = CirErode(output_image, strel('disk',1));
    output_image = CirDilate(output_image, strel('disk',5));
    count = size(unique(CCLabaling(output_image)));
    disp(count(1)-1);
    
end