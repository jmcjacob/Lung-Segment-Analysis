function [ output_image ] = Erode( input_image, structure )
%ERODE Erodes a binary image based on a sturturing element.
%   Takes a logical image and a structuring element to erode the image
%   acording to the structung element.

    % Sets the sizes of the images and padds the images.
    input_image=uint8(input_image);
    se = structure.getnhood();
    [sem, sen] = size(se);
    [m,n] = size(input_image);
    padding = floor(sem/2);
    output_image = false(m,n);
    input_image = padarray(input_image,[padding,padding],'symmetric');

    % Cycles through the image and strutureing element.
    for i=padding+1:m-padding
        for j=padding+1:n-padding
            full = 1;
            for k=1:sem
                for g=1:sen
                    % If the pixel surounding the position (i,j) is 0 and
                    % the acording postion in the sturctre is 1. Set the
                    % bool to false.
                    if input_image(i,j) == 1
                        if input_image(i+k-padding-1, j+g-padding-1)==0 && se(k,g)==1
                            full = 0;
                        end
                    end
                end
            end
            % If the bool is true then the pixel is not part of the image
            % border and is added to to the output_image.
            if full
                output_image(i-padding,j-padding)=input_image(i, j);
            end
        end
    end
    
end

