function [ new ] = inpaintingFRUCVertical( original )
    [height,width,original_frame_rate] = size(original);
    new = averageFRUC(original);
    
    mask = zeros(width,2*original_frame_rate);
    for i=1:1:width
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            mask(i,j)=1;
        end 
    end
    end
    for i=1:1:height,
        disp(i);
        img = permute(new(i,:,:),[2 3 1]);
        inpainted = inpainting(img,mask,1);
        new(i,:,:) = inpainted;
    end


end

