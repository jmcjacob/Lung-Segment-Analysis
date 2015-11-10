function [ output_image ] = CirDilate( input_image, structure )

    input_image=uint8(input_image);
    se = structure.getnhood();
    [sem, sen] = size(se);
    [m,n] = size(input_image);
    padding = floor(sem/2);
    input_image = padarray(input_image,[padding,padding],'symmetric');
    
    for i=padding+1:m-padding
        for j=padding+1:n-padding
            for k=1:sem
                for g=1:sen
                    if input_image(i,j) == 1
                        if input_image(i+k-padding-1, j+g-padding-1)==0 && se(k,g)==1
                            input_image(i+k-padding-1, j+g-padding-1) = 2;
                        end
                    end
                end
            end
        end
    end

    for i=1:m
        for j=1:n
            if input_image(i,j)==2
                input_image(i,j)=1;
            end
        end
    end
    
    output_image = logical(input_image);
    [m,n] = size(output_image);
    output_image = output_image(padding+1:m-padding, padding+1:n-padding);
    
end

