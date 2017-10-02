fprintf('\n ~~~~~~~Analyzing Video~~~~~~~ \n');

%frames = 300;
%[original,imp] = loadVideo('Videos/tv.yuv',176,144,frames);

frames = 300;
[original,imp] = loadVideo('Videos/coastguard.yuv',176,144,frames);

%frames = 300; 
%[original,imp] = loadVideo('Videos/bowing.yuv',176,144,frames);


% frames = 500;
% [original,imp] = loadVideo('Videos/ducks.yuv',1280,720,frames);

%frames = 500;
%[original,imp] = loadVideo('Videos/park.yuv',1280,720,frames);

original = uint8(original);
mask = 2:2:frames;
filtered = original(:,:,1:2:frames);
%new_inpainting_vid = duplicateFRUC(filtered,2);
%Averaging
new_inpainting_vid = averageFRUC(filtered);
[mse,res_psnr]=errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n Base Results \n');
% figure;
% imshow(new_inpainting_vid(:,:,164),[0 255]);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',res_psnr);


%[new_inpainting_vid,mses,psnrs] = inpaintingFRUCHorizontal(filtered, original, mask);
%[new_inpainting_vid,mses,psnrs] = inpaintingFRUCVertical(filtered, original, mask);
[new_inpainting_vid,mses,psnrs] = inpaintingFRUCAlternating(filtered, original, mask);
% [new_inpainting_vid,mses,psnrs] = inpaintingFrucVideoWithAverageStart( filtered, 2, original, mask);
%figure;
%imshow(new_inpainting_vid(:,:,164),[0 255]);
[mse,res_psnr]=errorsVideos(original,new_inpainting_vid,mask);
fprintf('\n After Results \n');
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',res_psnr);

