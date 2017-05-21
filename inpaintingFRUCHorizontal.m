function [ new ] = inpaintingFRUCHorizontal( original )
    [height,width,original_frame_rate] = size(original);
    new = zeros(height,width,2*original_frame_rate);
    %Copy the original frames to the new video
    for i=0:1:original_frame_rate-1
        new(:,:,2*i+1) = original(:,:,i+1);
    end
    
    mask = zeros(height,2*original_frame_rate);
    for i=1:1:height
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            mask(i,j)=1;
        end 
    end
    end
    for i=1:1:width,
        img = permute(new(:,i,:),[1 3 2]);
        inpainted = inpainting(img,mask,1);
        new(:,i,:) = inpainted;
    end


end

