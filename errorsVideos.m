function [ psnrErr ] = errorsVideos( origin, restored, mask)
[h,w,~] = size(origin);
psnrErr = psnr_mask(origin(:,:,mask),restored(:,:,mask),ones(h,w));
end

