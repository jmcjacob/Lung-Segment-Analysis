function [ output_image ] = Assignment( input )

    input_image = imread(input);
    input_image = rgb2gray(input_image);
    i = Medium(input_image, 5);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables);
    se = strel('diamond',10);
    dilated_image = CirDilate(hole_image,se);
    output_image = CirErode(dilated_image,se);
    output_image = output_image - hole_image;
    se = strel('diamond',1);
    output_image = CirErode(output_image, se);
    output_image = CirDilate(output_image, se);
    count = size(unique(CCLabaling(output_image)));
    disp(count(1)-1);
    
end