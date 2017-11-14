fprintf('\n ~~~~~~~Analyzing Video~~~~~~~ \n');
% 
% frames = 30;
% [original,imp] = loadVideo('Videos/tv.yuv',176,144,frames);

frames = 30;
[original,imp] = loadVideo('Videos/coastguard.yuv',176,144,frames);

%frames = 300; 
%[original,imp] = loadVideo('Videos/bowing.yuv',176,144,frames);


% frames = 500;
% [original,imp] = loadVideo('Videos/ducks.yuv',1280,720,frames);

%frames = 500;
%[original,imp] = loadVideo('Videos/park.yuv',1280,720,frames);

mask = 2:2:frames;
filtered = original(:,:,1:2:frames);
% new_inpainting_vid = duplicateFRUC(filtered,2);
new_inpainting_vid = averageFRUC(filtered);
res_psnr = errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n Base Results \n');
fprintf('\n The PSNR is: %.2f \n',res_psnr);


% [new_inpainting_vid,psnrs] = inpaintingFRUCHorizontal(filtered, true, original);
 %[new_inpainting_vid,psnrs] = inpaintingFRUCVertical(filtered, true, original);
% [new_inpainting_vid,psnrs] = inpaintingFRUCAlternating(filtered, true, original);
% [new_inpainting_vid,mses,psnrs] = inpaintingFrucVideoWithAverageStart( filtered, 2, original, mask);
%figure;
%imshow(new_inpainting_vid(:,:,164),[0 255]);
% res_psnr = errorsVideos(original,new_inpainting_vid,mask);
% fprintf('\n After Results \n');
% fprintf('\n The PSNR is: %.2f \n',res_psnr);