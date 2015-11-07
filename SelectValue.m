function [ output_image ] = SelectValue( input_image )

    [n,m]=size(input_image);
    values = unique(input_image);
    frequency = [values,histc(input_image(:),values)];
    frequency = sortrows(frequency,2);
    value1 = frequency(length(frequency)-2,1);
    value2 = frequency(length(frequency)-3,1);
    
    for i=1:n
        for j=1:m
            if input_image(i,j)==value1 || input_image(i,j)==value2
                input_image(i,j)=1;
            else
                input_image(i,j)=0;
            end
        end
    end
    output_image=logical(input_image);

end

