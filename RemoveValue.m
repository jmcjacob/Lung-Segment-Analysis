function [ input_image ] = RemoveValue( input_image, value )

    [m,n] = size(input_image);
    
    for i=1:m
        for j=1:n
            if input_image(i,j) > value
                input_image(i,j) = 1;
            end
        end
    end

end

