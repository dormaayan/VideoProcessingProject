fid1 = fopen('IntrestingResults\averageFruc_ducks_99.raw');
im1 = uint8(zeros(1280,720));
im1(:) = fread(fid1,1280*720,'uint8');
figure;
imshow(im1,[0 255]);
