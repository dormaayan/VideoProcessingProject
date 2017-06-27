fprintf('\n ~~~~~~~Analyzing Tv Video~~~~~~~ \n');
frames = 300;
[original,imp] = loadVideo('Videos/tv.yuv',176,144,frames);
original = uint8(original);
mask = zeros([1,frames]);
for i=2:2:frames
    mask(i)=1;
end
filtered = original(:,:,1:2:frames);
  %new_inpainting_vid = duplicateFRUC(filtered,2);
  %new_inpainting_vid = averageFRUC(filtered);
 %new_inpainting_vid = inpaintingFRUCHorizontal(filtered);
 %new_inpainting_vid = inpaintingFRUCVertical(filtered);
 new_inpainting_vid = inpaintingFRUCAlternating(filtered);
%new_inpainting_vid = inpaintingFrucVideoWithAverageStart( original, 50);
figure;
imshow(new_inpainting_vid(:,:,164),[0 255]);
[mse,res_psnr]=errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',res_psnr);

% fprintf('\n ~~~~~~~Analyzing Ducks Take Off Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/ducks.yuv',1280,720,500);
% mask = zeros([1,500]);
% for i=1:2:500
%     mask(i)=1;
% end
%  filtered = original(:,:,2:2:500);
%   new_vid = averageFRUC(filtered);
%   new_inpainting_vid = inpaintingFRUCHorizontal(filtered);
%   new_inpainting_vid = inpaintingFRUCVertical(filtered);
%   new_inpainting_vid = inpaintingFRUCAlternating(filtered);
%   new_inpainting_vid = inpaintingFrucVideo( original, 60);
%  figure;
%  imshow(new_inpainting_vid(:,:,164),[0 254]);
%  [mse,psnr]=errorsVideos(original,new_inpainting_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);
