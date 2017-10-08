function [ new,psnrs ] = inpaintingFRUCAlternating( original , graph, comparison )
    
    [height,width,original_frame_rate] = size(original);
    avareged = averageFRUC(original);
    new = avareged;
    itr = 50;

    frames_mask = 2:2:original_frame_rate*2;

    maskW = initialize_mask(width, original_frame_rate);
    
    maskH = initialize_mask(height, original_frame_rate);
    

if graph,
    psnrs(1) = errorsVideos(comparison, new, frames_mask);
    line = initialize_psnr_graph(psnrs);
end

    for i=1:1:itr,
        %disp(i);
        for j=1:1:height,
            img = permute(new(j,:,:),[2 3 1]);
            corrupted = permute(avareged(j,:,:),[2 3 1]);
            new(j,:,:) = inpainting_iteration(img, corrupted, maskW, shifts, starting_qb - floor(i/itr));
        end
        
       for j=1:1:width,
            img = permute(new(:,j,:),[1 3 2]);
            corrupted = permute(avareged(:,j,:),[1 3 2]);
            new(:,j,:) = inpainting_iteration(img, corrupted, maskH, shifts, starting_qb - floor(i/itr));
       end
     
       if graph,
        psnrs(i+1) = errorsVideos(comparison, new, frames_mask);
        line = update_psnr_graph(psnrs,line);
       end
    end
        
    end
    
    
   


