function [ new , mses, psnrs] = inpaintingFRUCHorizontal( original, comparison, frames_mask )
    [height,width,original_frame_rate] = size(original);
    new = averageFRUC(original);
    
    mask = zeros(height,2*original_frame_rate);
    for i=1:1:height
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            mask(i,j)=1;
        end 
    end
    end
    beta = 0.3;
    myu = 3;
    itr = 50;
    [mses(1),psnrs(1)] = errorsVideos(comparison, new, frames_mask);
    figure;
    hold on;
    line = plot(0,mses);
    for i=1:1:itr,
%        disp(i);
       for j=1:1:width,
        img = permute(new(:,j,:),[1 3 2]);
        res = compressDecompress(uint8(img),i,max((2*myu)/beta,1));
        new(:,j,:) = (uint8(res) .* uint8(mask)) + (uint8(img) .* uint8(1-mask));
       end
       [mses(i+1),psnrs(i+1)] = errorsVideos(comparison, new, frames_mask);
       delete(line);
       line = plot(0:1:length(mses)-1,mses);
       drawnow();
       beta = 1.1*beta;
    end 
    figure;
    plot(0:1:length(psnrs)-1,psnrs);
end

