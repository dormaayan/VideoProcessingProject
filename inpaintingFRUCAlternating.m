function [ new, mses, psnrs ] = inpaintingFRUCAlternating( original , comparison, frames_mask )
    [height,width,original_frame_rate] = size(original);
    corrupted = averageFRUC(original);
    
    maskW = zeros(width,2*original_frame_rate);
    for i=1:1:width
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            maskW(i,j)=1;
        end 
    end
    end
    
    maskH = zeros(height,2*original_frame_rate);
    for i=1:1:height
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            maskH(i,j)=1;
        end 
    end
    end
    
    myu = 3;
    beta = 0.3;
    itr = 30;
    new = corrupted;
    [mses(1),psnrs(1)] = errorsVideos(comparison, new, frames_mask);
    figure;
    hold on;
<<<<<<< HEAD
    line = plot(mses);
    for i=1:1:50,
=======
    line = plot(0,mses);
    for i=1:1:itr,
>>>>>>> d1f79986ffcdc52c4224b3931ef4cef28bf1cd38
        disp(i);
        for j=1:1:height,
            img = permute(new(j,:,:),[2 3 1]);
            res = compressDecompress(uint8(img),i,max((2*myu)/beta,1));
            new(j,:,:) = (uint8(res) .* uint8(maskW)) + (permute(uint8(corrupted(j,:,:)),[2 3 1]) .* uint8(1-maskW));
        end
        
       for j=1:1:width,
            img = permute(new(:,j,:),[1 3 2]);
            res = compressDecompress(uint8(img),i,max((2*myu)/beta,1));
            new(:,j,:) = (uint8(res) .* uint8(maskH)) + (permute(uint8(corrupted(:,j,:)),[1 3 2]) .* uint8(1-maskH));
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


