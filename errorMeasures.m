fprintf('\n ~~~~~~~Analyzing Tv Video~~~~~~~ \n');
[original,imp] = loadVideo('Videos/tv.yuv',176,144,300);
mask = zeros([1,300]);
for i=1:2:300
    mask(i)=1;
end
filtered = original(:,:,2:2:300);
new_vid = averageFRUC(filtered);
 %new_vid = duplicateFRUC(filtered, 2);
[mse,psnr]=errorsVideos(original,new_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',psnr);

fprintf('\n ~~~~~~~Analyzing Container Video~~~~~~~ \n');
[original,imp] = loadVideo('Videos/container.yuv',176,144,300);
figure;
imshow(original(:,:,255),[0 255]);
mask = zeros([1,300]);
for i=1:2:300
    mask(i)=1;
end
filtered = original(:,:,2:2:300);
new_vid = averageFRUC(filtered);
figure;
imshow(new_vid(:,:,255),[0 255]);
 %new_vid = duplicateFRUC(filtered, 2);
[mse,psnr]=errorsVideos(original,new_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',psnr);





