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
    
end