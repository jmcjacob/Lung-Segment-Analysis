function [ output_image ] = SelectValue( input_image, input )
%SELECTVALUE Selects values based on there frequency.
%Returns a matrix of the most frequent values.

    % Gets the size of the image and then find the most frequent values
    % then finds the most frquent values - the inputed value.
    [n,m]=size(input_image);
    values = unique(input_image);
    frequency = [values,histc(input_image(:),values)];
    frequency = sortrows(frequency,2);
    value = frequency(length(frequency)-input,1);
    
    % Searches for the value and then sets the results to a binary image.
    for i=1:n
        for j=1:m
            if input_image(i,j)==value
                input_image(i,j)=1;
            else
                input_image(i,j)=0;
            end
        end
    end
    
    % Outputs the imgage as a logical matrix.
    output_image=logical(input_image);

end

