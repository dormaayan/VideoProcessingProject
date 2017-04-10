pic = load('lena_1.mat');
imshow(x,[0 255]);
figure;
imshow(mask,[0 1]);
 corrupted = x .* (ones(size(x))-mask);
 figure;
 imshow(corrupted,[0 255]);
result = inpainting(uint8(corrupted),mask);
 figure;
 imshow(result,[0 255]);

 fprintf('The Mse is: %d \n',immse(uint8(x),uint8(result)));
  fprintf('The PSNR is: %d \n',psnr(uint8(x),uint8(result)));