function [ output_image ] = SelectValue( input_image, value )

    [n,m]=size(input_image);
    
    for i=1:n
        for j=1:m
            if input_image(i,j)==value
                input_image(i,j)=1;
            else
                input_image(i,j)=0;
            end
        end
    end
    
    output_image=logical(input_image);

end

