function [ output_image ] = AssignmentInBuilt( input )

    i = imread(input);
    i = rgb2gray(i);
    i = medfilt2(i,[5,5]);
    i = im2bw(i,graythresh(i));
    L = bwconncomp(~i,4);
    bw = i;
    bw(L.PixelIdList{2}) = 0;
    bw(L.PixelIdList{3}) = 0;
    output_image = bw;

end

