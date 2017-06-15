function [ new ] = inpaintingFRUCAlternating( original )
    myu = 1;
    [height,width,original_frame_rate] = size(original);
    corrupted = zeros(height,width,2*original_frame_rate);
    %Copy the original frames to the new video
    for i=0:1:original_frame_rate-1
        corrupted(:,:,2*i+1) = original(:,:,i+1);
    end
    
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
    
    
    beta = 0.001;
    new = corrupted;
    for i=1:1:50,
        for j=1:1:height,
            img = permute(new(j,:,:),[2 3 1]);
            res = compressDecompress(img,i,max((2*myu)/beta,1));
            new(j,:,:) = (uint8(res) .* uint8(maskW)) + permute(uint8(corrupted(j,:,:)),[2 3 1]);
%              if i==2 && j==100,
%                 figure;
%                 imshow(img,[0 255]);
%                  figure;
%                 imshow(permute(new(j,:,:),[2 3 1]),[0 255]);
%             end
        end
        
       for j=1:1:width,
            img = permute(new(:,j,:),[1 3 2]);
            res = compressDecompress(img,i,max((2*myu)/beta,1));
            new(:,j,:) = (uint8(res) .* uint8(maskH)) + permute(uint8(corrupted(:,j,:)),[1 3 2]);
            if i==40 && j==100,
                figure;
                imshow(img,[0 255]);
                 figure;
                imshow(permute(new(:,j,:),[1 3 2]),[0 255]);
            end
       end
       
       beta = 1.1*beta;
    end
end


