function [] = lungAnalysis( input )
%LUNGANALYSIS Takes a lung section x-ray and idenfies tumours.
% Takes a lung section xray image and counts and highlights cuircular
% tumors in the lung sections.

%---Task 1 - Removes Noise
    input_image = imread(input);                                        % Reads the image.
    gray_image = rgb2gray(input_image);                                 % Convers the image to grayscale.
    i = Medium(gray_image, 3);                                          % Applies a Medium filter to the image to smoothen the image.
    i = RemoveValue(i, 210);                                            % Removes any outlying values within the image.
    i = imadjust(i,[0.16 0.6],[],0.9);                                  % Brighten the image making the tumors stand out.
    denoised_image = im2bw(i,graythresh(i));                            % Convers the image to logical based on a calculated threshold.
    denoised_image = Erode(denoised_image,strel('square',3));           % Performs a binary erode with a 3x3 square to remove noise.
    denoised_image = Dilate(denoised_image,strel('square',3));          % Performs a binary dilagte with a 3x3 squre to restore all other parts of the image.
    figure, imshow(denoised_image), title('Task 1');                    % Displays the newly denoised image.
    
%---Task 2 - Lung Segmentations
    lables = bwlabel(~denoised_image,4);                                % Labels all the features within the image.
    hole_image = SelectValue(lables,2) + SelectValue(lables,3);         % Selects the second and third largest features within the image.
    dilated_image = Dilate(hole_image,strel('disk',15));                % Dilates the image with a large stucturing element to close all gaps.
    circle_image = Erode(dilated_image,strel('disk',15));               % Erodes the image with the same structuing element to restore the now closed image.
    figure, imshow(circle_image), title('Task 2');                      % Displays the segmented image.
    
%---Task 3 - Counts Tumours
    circle_image = circle_image - hole_image;                           % Subtracks the closed image with segmented image resulting in just the tumors.
    circle_image = Erode(circle_image, strel('disk',1));                % Erodes the image removing any left over noise.
    circle_image = Dilate(circle_image, strel('disk',1));               % Dilates the image restoring featurs to the original size.
    [labels,count] = bwlabel(circle_image,4);                           % Labels the image and retuns a count of labels.
    disp(count);                                                        % Displays the count of segmented tumors.
    
    dots = regionprops(labels, 'centroid');                             % Finds the center of each of the positions.
    center = cat(1, dots.Centroid);                                     % Concatenate the structuing element containing the centroids into a single matrix.
    figure, imshow(input_image), title('Task 3');                       % Displays the original inputted image.
    hold on, plot(center(:,1),center(:,2), 'r+'), hold off;             % Plots the cneters of the featurs onto the origianal image with red crosses.
    
%---Task 4 - Segments Tumours
    edge_image = EdgeDetect(circle_image);                              % Find the edges of the segmented circles.
    edge_image = Dilate(edge_image,strel('disk',1));                    % Dilates the edges making them more visable.
    colour_circle = logical2rgb(circle_image);                          % Converts the segmented circle image to a uint8 rgb image.
    green_edge = Binary2Green(edge_image);                              % Converts the edge image into a green uint8 image.
    figure,imshow(colour_circle+green_edge), title('Task 4');           % Displays the result of adding the green edges to the segmented circles.
    
end