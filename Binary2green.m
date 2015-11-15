function [ output_image ] = Binary2green( input_image )

    [m,n] = size(input_image);
    output_image = zeros(m,n,3);
    output_image(input_image==1)=255;
    output_image(:,:,2) = output_image(:,:,1);
    output_image(:,:,1) = output_image(:,:,3);
    output_image = im2uint8(output_image);

end

