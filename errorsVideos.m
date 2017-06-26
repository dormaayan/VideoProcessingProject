
function [ mse,psnrErr ] = errorsVideos( origin, restored, mask)
totalMse=0;
totalPsnr = 0;
for i=1:1:max(size(mask))
    if mask(i)==1
    totalMse = totalMse + mask(i) * immse(uint8(origin(:,:,i)),uint8(restored(:,:,i)));
    totalPsnr = totalPsnr + mask(i) * psnr(uint8(origin(:,:,i)),uint8(restored(:,:,i)),255);
    end
end
mse = double(totalMse)/double(sum(mask));
psnrErr = double(totalPsnr)/double(sum(mask));
end

