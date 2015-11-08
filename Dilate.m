function [ output_image ] = Dilate( input_image,cycles)

    [m,n] = size(input_image);
    input_image = uint8(input_image);
    
    for q=1:cycles
        for i=1:m
            for j=1:n
                if input_image(i,j) == 1
                    if i>1&&input_image(i-1,j)==0
                        input_image(i-1,j)=2;
                    end
                    if j>1&&input_image(i,j-1)==0
                        input_image(i,j-1)=2;
                    end
                    if i<m&&input_image(i+1,j)==0
                        input_image(i+1,j) = 2;
                    end
                    if j<n&&input_image(i,j+1)==0
                        input_image(i,j+1)=2;
                    end
                    %if i>1&&j>1&&input_image(i-1,j-1)==0
                    %    input_image(i-1,j-1)=2;
                    %end
                    %if i<m&&j>1&&input_image(i+1,j-1)==0
                    %    input_image(i+1,j-1)=2;
                    %end
                    %if i>1&&j<n&&input_image(i-1,j+1)==0
                    %    input_image(i-1,j+1)=2;
                    %end
                    %if i<m&&j<n&&input_image(i+1,j+1)==0
                    %    input_image(i+1,j+1)=2;
                    %end
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
    end
    output_image = logical(input_image);
    
end

