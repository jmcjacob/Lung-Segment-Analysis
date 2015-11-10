function [ output_image ] = Assignment( input )

    input_image = imread(input);
    input_image = rgb2gray(input_image);
    i = Medium(input_image, 5);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    lables = CCLabaling(denoised_image);
    hole_image = SelectValue(lables);
    dilated_image = Dilate(hole_image,6);
    output_image = Erode(dilated_image,6);
    output_image = output_image - hole_image;
    output_image = Erode(output_image, 1);
    output_image = Dilate(output_image, 1);
    count = size(unique(CCLabaling(output_image)));
    disp(count(1)-1);
    
end