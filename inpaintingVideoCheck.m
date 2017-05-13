fprintf('\n ~~~~~~~Analyzing Tv Video~~~~~~~ \n');
[original,imp] = loadVideo('Videos/tv.yuv',176,144,300);
mask = zeros([1,300]);
for i=1:2:300
    mask(i)=1;
end
filtered = original(:,:,2:2:300);
% new_vid = averageFRUC(filtered);
new_inpainting_vid = inpaintingFRUC(filtered);

[mse,psnr]=errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',psnr);
