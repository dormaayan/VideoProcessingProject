fprintf('\n ~~~~~~~Analyzing Tv Video~~~~~~~ \n');
[original,imp] = loadVideo('Videos/tv.yuv',176,144,300);
mask = zeros([1,300]);
for i=1:2:300
    mask(i)=1;
end
filtered = original(:,:,2:2:300);
% new_vid = averageFRUC(filtered);
% new_inpainting_vid = inpaintingFRUCHorizontal(filtered);
new_inpainting_vid = inpaintingFRUCVertical(filtered);
figure;
imshow(new_inpainting_vid(:,:,164),[0 254]);
[mse,psnr]=errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',psnr);

% fprintf('\n ~~~~~~~Analyzing Ducks Take Off Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/ducks.yuv',1280,720,500);
% mask = zeros([1,500]);
% for i=1:2:500
%     mask(i)=1;
% end
%  filtered = original(:,:,2:2:500);
% new_inpainting_vid = inpaintingFRUCHorizontal(filtered);
%  [mse,psnr]=errorsVideos(original,new_inpainting_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);