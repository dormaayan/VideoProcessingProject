
function [ mse,psnrErr ] = errorsVideos( origin, restored, mask)
totalMse = 0.0;
totalPsnr = 0.0;
for i=1:1:max(size(mask))
    if mask(i)==1
        totalMse = totalMse + immse(uint8(origin(:,:,i)),uint8(restored(:,:,i)));
        temp = psnr(uint8(origin(:,:,i)),uint8(restored(:,:,i)),255);
        if temp ~= Inf
            totalPsnr = totalPsnr + temp;
        end
    end
end
mse = double(totalMse)/double(sum(mask));
psnrErr = double(totalPsnr)/double(sum(mask));
end

