function [ output_image ] = EdgeDetect( input_image )
%EDGEDETECT will identify the edges of a binary image using sobal.
%   Takes a binary image and will return a new binary image of the
%   identified edegs from the sobal horizontal and verticle filters.

    % Defines the filters, adds padding and sets up images.
    fvertical = [-1,0,1;-2,0,2;-1,0,1];
    fhorizontal = [1,2,1;0,0,0;-1,-2,-1];
    [m,n] = size(input_image);
    vertical = false(m,n);
    horizontal = false(m,n);
    input_image = padarray(input_image, [1,1], 0);
    
    % Loops through the image and applies the vertical filter to every
    % pixel.
    for i=2 : m
        for j=2 : n
            value = 0;
            for fi=1:3
                for fj=1:3
                    value = value + input_image(i+fi-1,j+fj-1)*fvertical(fi,fj);
                end
            end
            vertical(i-1,j-1) = value;
        end
    end
    
    % Loops through the image and applies the horizontal filter to every
    % pixel.
    for i=2 : m
        for j=2 : n
            value = 0;
            for fi=1:3
                for fj=1:3
                    value = value + input_image(i+fi-1,j+fj-1)*fhorizontal(fi,fj);
                end
            end
            horizontal(i-1,j-1) = value;
        end
    end
    
    % Adds the vertical and horizontal values together to return the
    % output.
    output_image = vertical + horizontal;

end

