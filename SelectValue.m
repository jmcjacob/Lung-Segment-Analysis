function [ output_image ] = SelectValue( input_image, value )
%SELECTVALUE Returns a bianry image of the largest frequency - value
%element.

    % Sets up the image and finds the frequencyes of the values in the
    % image.
    [n,m]=size(input_image);
    values = unique(input_image);
    frequency = [values,histc(input_image(:),values)];
    frequency = sortrows(frequency,2);
    value1 = frequency(length(frequency)-value,1);
    
    % Cycles through the image setting all instances of the value to 1.
    for i=1:n
        for j=1:m
            if input_image(i,j)==value1
                input_image(i,j)=1;
            else
                input_image(i,j)=0;
            end
        end
    end
    
    % Converts the output to logical.
    output_image=logical(input_image);

end

