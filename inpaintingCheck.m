load('lena_1.mat');
% load('barb_1.mat');
[h,w] = size(x);
Horizontalpasses = zeros(h,w);
for i=1:1:h
    for j=1:1:w
        if mod(i,2)<1
            Horizontalpasses(i,j)=1;
        end 
    end
end
% figure;
% imshow(Horizontalpasses,[0 1]);

Verticalpasses = zeros(h,w);
for i=1:1:h
    for j=1:1:w
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
pattern = Horizontalpasses;
%  pattern = Verticalpasses;
% pattern = mask;

 figure;
 imshow(x,[0 255]);
 
%   figure;
%  imshow(pattern,[0 1]);

 corrupted = x .* (1-pattern);
  figure;
  imshow(corrupted,[0 255]);
% result1 = inpainting(uint8(corrupted),pattern);
%  figure;
%   imshow(result1,[0 255]);
result2 = inpaintingWithShifts(corrupted,pattern, true, x);
 figure;
 imshow(result2,[0 255]);
%  result3 = inpaintingLinesAveraging(corrupted,pattern);
%  figure;
%  imshow(result3,[0 255]);
 
%  fprintf('No Shift \n');
%   fprintf('The PSNR is: %d \n',psnr_mask(x,result1,pattern));
   
 fprintf('With Shift \n');
 fprintf('The PSNR is: %.2f \n',psnr_mask(x,result2,pattern));

%  fprintf('With averaging of lines \n');
%  fprintf('The PSNR is: %.2f \n',psnr_mask(x,result3,pattern));