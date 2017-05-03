Horizontalpasses = zeros(512,512);
for i=1:1:512
    for j=1:1:512
        if mod(i,2)<1
            Horizontalpasses(i,j)=1;
        end 
    end
end
% figure;
% imshow(Horizontalpasses,[0 1]);

Verticalpasses = zeros(512,512);
for i=1:1:512
    for j=1:1:512
        if mod(j,2)<1
            Verticalpasses(i,j)=1;
        end 
    end
end
% figure;
% imshow(Verticalpasses,[0 1]);


% figure;
% imshow(mask,[0 1]);

%Uncomment Here Your Desired Pattern
% pattern = Horizontalpasses;
pattern = Verticalpasses;
% pattern = mask;


 load('barb_1.mat');
 figure;
 imshow(x,[0 255]);
 
  figure;
 imshow(pattern,[0 1]);

 corrupted = x .* (ones(size(x))-pattern);
 figure;
 imshow(corrupted,[0 255]);
result = inpainting(uint8(corrupted),pattern,1);
 figure;
 imshow(result,[0 255]);

 fprintf('The Mse is: %d \n',immse(uint8(x),uint8(result)));
  fprintf('The PSNR is: %d \n',psnr(uint8(x),uint8(result)));