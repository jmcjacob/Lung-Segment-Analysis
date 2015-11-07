function [ output_image ] = Erode( input_image, cycles )

    [m,n] = size(input_image);
    input_image = uint8(input_image);
        
    for c=1:cycles
        for i=1:m
            for j=1:n
                if input_image(i,j)==1
                    edges = [];
                    if i>1
                        edges=[edges input_image(i-1,j)];
                    end
                    if j>1
                        edges=[edges input_image(i,j-1)];
                    end
                    if i<m
                        edges=[edges input_image(i+1,j)];
                    end
                    if j<n
                        edges=[edges input_image(i,j+1)];
                    end
                    if i>1&&j>1
                        edges=[edges input_image(i-1,j-1)];
                    end
                    if i<m&&j>1
                        edges=[edges input_image(i+1,j-1)];
                    end
                    if i>1&&j<n
                        edges=[edges input_image(i-1,j+1)];
                    end
                    if i<m&&j<n
                        edges=[edges input_image(i+1,j+1)];
                    end
                    edge = 0;
                        for h=1:length(edges)
                            if edges(h) == 0
                                edge = 1;
                            end
                        end
                    if edge
                        input_image(i,j) = 2;
                        edge = 0;
                    end
                end
            end
        end
    
        for i=1:m
            for j=1:n
                if input_image(i,j)==2
                    input_image(i,j)=0;
                end
            end
        end
    end
    output_image = logical(input_image);
    
end

