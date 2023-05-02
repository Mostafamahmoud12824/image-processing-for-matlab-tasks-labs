mage = imread('coins.png');
figure, imshow(mage), title ('Original Image')
imageno = imnoise(mage,'salt & pepper',0.02);
figure, imshow(imageno), title ('Noised Image')