function [ output_image ] = logical2rgb( input_image)
%LOGICAL2RGB converts a logical image into a uint8 3 channel image.

    % Finds the size of the image and creates a new rgb image.
    [m,n] = size(input_image);
    output_image = zeros(m,n,3);
    
    % Sets all the colour channels to 255 where tge value is 1 in the
    % inpuuted image.
    output_image(input_image==1)=255;
    output_image(:,:,2) = output_image(:,:,1);
    output_image(:,:,3) = output_image(:,:,1);
   
    % Outputs the image as a uint8.
    output_image = im2uint8(output_image);

end

