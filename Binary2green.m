function [ output_image ] = Binary2Green( input_image )
%Binary2Green Takes a logical image and replaces white with green.
%   Creates a new rgb image and replaces all instances of 1 with 255 in the
%   second plane.
    
    % Gets the size of the image and creates a new rgb image of zeros.
    [m,n] = size(input_image);
    output_image = zeros(m,n,3);
    
    % Sets all the instances of 1 in the logical image to 255 in the second
    % plane.
    output_image(input_image==1)=255;
    output_image(:,:,2) = output_image(:,:,1);
    output_image(:,:,1) = output_image(:,:,3);
    
    % Sets the image to uint8.
    output_image = im2uint8(output_image);

end

