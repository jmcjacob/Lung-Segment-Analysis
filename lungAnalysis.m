function [] = lungAnalysis( input )

    %Task 1
    input_image = imread(input);
    gray_image = rgb2gray(input_image);
    i = Medium(gray_image, 3);
    i = RemoveValue(i, 210);
    i = imadjust(i,[0.16 0.6],[],0.9);
    level = graythresh(i);
    denoised_image = im2bw(i,level);
    denoised_image = Erode(denoised_image,strel('square',3));
    denoised_image = Dilate(denoised_image,strel('square',3));
    figure('name','Task 1'), imshow(denoised_image), title('Task 1');
    
    %Task 2
    lables = bwlabel(~denoised_image);
    figure, imshow(lables);
    hole_image = SelectValue(lables,2) + SelectValue(lables,3);
    dilated_image = Dilate(hole_image,strel('disk',15));
    circle_image = Erode(dilated_image,strel('disk',15));
    figure('name', 'Task 2'), imshow(circle_image), title('Task 2');
    
    %Task 3
    circle_image = circle_image - hole_image;
    circle_image = Erode(circle_image, strel('disk',1));
    circle_image = Dilate(circle_image, strel('disk',1));
    [labels,count] = bwlabel(circle_image);
    disp(count);
    dots = regionprops(labels, 'centroid');
    center = cat(1, dots.Centroid);
    figure('name', 'Task 3'), imshow(input_image), title('Task 3');
    hold on
    plot(center(:,1),center(:,2), 'r*')
    hold off
    
    %Task 4
    edge_image = EdgeDetect(circle_image);
    edge_image = Dilate(edge_image,strel('disk',1));
    %figure('name', 'Task 4'),imshow(logical2rgb(circle_image)+Binary2Green(edge_image)), title('Task 4');
end