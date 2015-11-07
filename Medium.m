function [ output_image ] = Medium( input_image, filter_size )

    [m,n]=size(input_image);
    output_image = ones(m,n);
    padding = floor(filter_size/2);
    input_image=padarray(input_image,[padding,padding],'symmetric');
    window = zeros(1,filter_size*filter_size);
    
    for x=padding+1:m+padding
       for y=padding+1:n+padding
           i=1;
           for fx=1:filter_size
              for fy=1:filter_size
                 window(i)=input_image(x+fx-padding-1, y+fy-padding-1);
                 i=i+1;
              end
           end
           output_image(x-padding,y-padding) = median(window);
       end
    end
    output_image = uint8(output_image);
end