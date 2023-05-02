function [newimage]= avrg_sobel(oldimage)
     oldimage = GrayScaleLum(oldimage);
     [old_rows, old_cols] = size(oldimage);
     newimage = zeros(old_rows,old_cols);
     oldimage =double(oldimage);
     newimage = double(newimage);

    % Sobel Operator Mask
     MVertical= [-1 0 1; -2 0 2; -1 0 1];
     MHorizontal = [-1 -2 -1; 0 0 0; 1 2 1];

% Edge Detection Process.
for i = 1:old_rows - 2
	for j = 1:old_cols - 2

		% Gradient approximations
		Gx = sum(sum(MVertical.*oldimage(i:i+2, j:j+2)));
		Gy = sum(sum(MHorizontal.*oldimage(i:i+2, j:j+2)));
				
		% Calculate magnitude of vector
		newimage(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
		
	end
end

% Displaying Filtered Image
newimage = uint8(newimage);
newimage=Contrast(newimage,0,255);

end