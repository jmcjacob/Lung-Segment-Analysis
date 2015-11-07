function [ lables ] = CCLabaling( input_image )

    [row, column] = size(input_image);
    id = reshape(1:prod([row, column]),[row, column]);
    temp = ones([row, column]);
    
    vec = @(x) x(:);
    index1 = [vec(id(:,1:end-1)); vec(id(1:end-1,:))];
    index2 = [vec(id(:,2:end)); vec(id(2:end,:))];

    for i=1:length(index1)
        root1 = index1(i);
        root2 = index2(i);
        
        while root1~=id(root1)
            id(root1) = id(id(root1));
            root1 = id(root1);
        end
        while root2~=id(root2)
            id(root2) = id(id(root2));
            root2 = id(root2);
        end
        
        if root1 == root2
            continue
        end
        
        N1 = temp(root1);
        N2 = temp(root2);
        
        if input_image(root1)==input_image(root2)
            if N1<N2
                id(root1) = root2;
                temp(root2) = N1+N2;
            else
                id(root2) = root1;
                temp(root1) = N1+N2;
            end
        end
    end
    
    while 1
        id_temp = id;
        id = id(id);
        if id_temp == id
            break
        end
    end
    
    is_nan = isnan(input_image);
    id(is_nan) = NaN;
    [id,m,n] = unique(id);
    input_image = 1:length(id);
    lables = reshape(input_image(n),[row,column]);
    lables(is_nan) = 0;
    
end

