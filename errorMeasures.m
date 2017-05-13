% fprintf('\n ~~~~~~~Analyzing Tv Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/tv.yuv',176,144,300);
% mask = zeros([1,300]);
% for i=1:2:300
%     mask(i)=1;
% end
% filtered = original(:,:,2:2:300);
% new_vid = averageFRUC(filtered);
%  %new_vid = duplicateFRUC(filtered, 2);
% [mse,psnr]=errorsVideos(original,new_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);
% 
% fprintf('\n ~~~~~~~Analyzing Container Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/container.yuv',176,144,300);
% figure;
% imshow(original(:,:,255),[0 255]);
% mask = zeros([1,300]);
% for i=1:2:300
%     mask(i)=1;
% end
% filtered = original(:,:,2:2:300);
% new_vid = averageFRUC(filtered);
% figure;
% imshow(new_vid(:,:,255),[0 255]);
%  %new_vid = duplicateFRUC(filtered, 2);
% [mse,psnr]=errorsVideos(original,new_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);
% fprintf('\n ~~~~~~~Analyzing CoastGuard Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/coastguard.yuv',176,144,300);
% mask = zeros([1,300]);
% figure;
% imshow(original(:,:,41),[0 255]);
% for i=1:2:300
%     mask(i)=1;
% end
% filtered = original(:,:,2:2:300);
% %new_vid = averageFRUC(filtered);
% new_vid = duplicateFRUC(filtered, 2);
% figure;
% imshow(new_vid(:,:,41),[0 255]);
%  [mse,psnr]=errorsVideos(original,new_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);
% fprintf('\n ~~~~~~~Analyzing Crew Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/crew.yuv',176,144,150);
% mask = zeros([1,150]);
% figure;
% imshow(original(:,:,137),[0 255]);
% for i=1:2:150
%     mask(i)=1;
% end
% filtered = original(:,:,2:2:150);
% new_vid = averageFRUC(filtered);
% %new_vid = duplicateFRUC(filtered, 2);
% figure;
% imshow(new_vid(:,:,137),[0 255]);
%  [mse,psnr]=errorsVideos(original,new_vid,mask);
% fprintf('\n The Mse is: %d \n',mse);
% fprintf('\n The PSNR is: %d \n',psnr);

fprintf('\n ~~~~~~~Analyzing Ducks Take Off Video~~~~~~~ \n');
% [original,imp] = loadVideo('Videos/ducks.yuv',1280,720,500);
mask = zeros([1,500]);
for i=1:2:500
    mask(i)=1;
end
% filtered = original(:,:,2:2:500);
%  new_vid = averageFRUC(filtered);
%  new_vid = duplicateFRUC(filtered, 2);
% [mse,psnr]=errorsVideos(original,new_vid,mask);
fprintf('\n The Mse is: %d \n',mse);
fprintf('\n The PSNR is: %d \n',psnr);

figure;
imshow(new_vid(:,:,99),[0 255]);
figure;
imshow(original(:,:,99),[0 255]);

fid=fopen('IntrestingResults/averageFruc_ducks_99.raw','w+');
fwrite(fid,new_vid(:,:,99),'uint8');
fclose(fid);

fid=fopen('IntrestingResults/grayscale_ducks_99.raw','w+');
fwrite(fid,original(:,:,99),'uint8');
fclose(fid);
% figure;
% imshow(new_vid(:,:,85),[0 255]);
% figure;
% imshow(new_vid(:,:,111),[0 255]);

figure;
imshow(original(:,:,99)-new_vid(:,:,99), [-255 255]);




