
function [ mse,psnrErr ] = errorsVideos( origin, restored, mask)
totalMse=0;
totalPsnr = 0;
for i=1:1:max(size(mask))
    totalMse = totalMse + mask(i) * immse(origin(:,:,i),restored(:,:,i));
    if mask(i)==1
        totalPsnr = totalPsnr + mask(i) * psnr(origin(:,:,i),restored(:,:,i),255);
    end
end
mse = double(totalMse)/double(sum(mask));
psnrErr = double(totalPsnr)/double(sum(mask));
end

