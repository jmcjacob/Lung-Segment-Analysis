function [ input_image ] = RemoveValue( input_image, value )
%REMOVEVALUE removes all values present within an image over an inputted
%value.

    % Gets the size of the image.
    [m,n] = size(input_image);
    
    %Cycles through the image and sets all elemetes over the given value to
    %the value 1.
    for i=1:m
        for j=1:n
            if input_image(i,j) >= value
                input_image(i,j) = 1;
            end
        end
    end

end

