function [ new ] = inpaintingFRUCHorizontal( original )
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
    for i=1:1:width,
        img = permute(new(:,i,:),[1 3 2]);
        inpainted = inpaintingWithShifts(img,mask,3);
        
        if i == 100
        figure;
        imshow(img,[0 255]);
        figure;
        imshow(inpainted,[0 255]);
        end
        new(:,i,:) = inpainted;
    end


end

