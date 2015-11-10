function [ output_image ] = CirErode( input_image, structure )

    input_image=uint8(input_image);
    se = structure.getnhood();
    [sem, sen] = size(se);
    [m,n] = size(input_image);
    padding = floor(sem/2);
    output_image = false(m,n);
    input_image = padarray(input_image,[padding,padding],'symmetric');

    for i=padding+1:m-padding
        for j=padding+1:n-padding
            full = 1;
            for k=1:sem
                for g=1:sen
                    if input_image(i,j) == 1
                        if input_image(i+k-padding-1, j+g-padding-1)==0 && se(k,g)==1
                            full = 0;
                        end
                    end
                end
            end
            if full
                output_image(i-padding,j-padding)=input_image(i, j);
            end
        end
    end
    
end

