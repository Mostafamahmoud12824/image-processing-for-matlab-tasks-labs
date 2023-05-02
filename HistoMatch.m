function newimage = HistoMatch(oldimage, col1round, col2round)
   oldimage = GrayScaleLum(oldimage);
    % create the hist table to work on it
    hist = zeros(256, 4, 1);

    for i=1:256 %full the first col from 0 to 255
        hist(i, 1) = i-1;
    end
    
    newimage = oldimage;
    hist(:, 2) = col1round;
    hist(:, 3) = col2round;
    
    
    %compare between the round of two images
    for i=1:256
        pixel = hist(i, 2); %select the round value of first image each iteration
       % pointer = i; % initially point to the same row of the pixel
        dif = 10000; %compute the diffrence between the pixels to find the closest row
        
        % select the row index of closest value near to pixel1 value
        for j=1: 256
            x = abs(pixel - hist(j, 3));
            if x < dif 
                dif = x;
                pointer = j;
            end
        end
        
        %add the color to the matching colomn
        hist(pointer, 4) = hist(pointer, 1);
        
    end
    
     %Replace the color of each pixel by the corresponding new color
     [rows, cols] = size(newimage);
     
        for i=1:256
            for row=1:rows
                for col=1:cols
                    if newimage(row, col) == hist(i, 1)
                        newimage(row, col) = hist(i, 4);
                    end
                end
            end
        end

end