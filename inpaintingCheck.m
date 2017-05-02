Horizontalpasses = zeros(512,512);
for i=1:1:512
    for j=1:1:512
        if mod(i,20)<5
            Horizontalpasses(i,j)=1;
        end 
    end
end
figure;
imshow(Horizontalpasses,[0 1]);

Verticalpasses = zeros(512,512);
for i=1:1:512
    for j=1:1:512
        if mod(j,20)<5
            Verticalpasses(i,j)=1;
        end 
    end
end
figure;
imshow(Verticalpasses,[0 1]);

 pic = load('lena_1.mat');
 figure;
 imshow(x,[0 255]);
% figure;
% imshow(mask,[0 1]);
 corrupted = x .* (ones(size(x))-Verticalpasses);
 figure;
 imshow(corrupted,[0 255]);
result = inpainting(uint8(corrupted),Verticalpasses);
 figure;
 imshow(result,[0 255]);

 fprintf('The Mse is: %d \n',immse(uint8(x),uint8(result)));
  fprintf('The PSNR is: %d \n',psnr(uint8(x),uint8(result)));