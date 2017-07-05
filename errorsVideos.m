
function [ mse,psnrErr ] = errorsVideos( origin, restored, mask)
mse = immse(uint8(origin(:,:,mask)),uint8(restored(:,:,mask)));
psnrErr = psnr(uint8(origin(:,:,mask)),uint8(restored(:,:,mask)));
end

