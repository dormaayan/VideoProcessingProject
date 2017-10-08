function [ new, psnrs] = inpaintingFRUCVertical( original, graph, comparison )
%parameters for the algorithm.
shifts = 3;
itr = 3;
starting_qb = 37;

avareged = averageFRUC(original);
new = avareged;

[height,width,original_frame_rate] = size(original);

mask = initialize_mask(width, original_frame_rate);
frames_mask = 2:2:original_frame_rate*2;

if graph,
    psnrs(1) = errorsVideos(comparison, new, frames_mask);
    line = initialize_psnr_graph(psnrs);
end

for i=1:1:starting_qb*itr,
    for j=1:1:height,
        img = permute(new(j,:,:),[2 3 1]);
        corrupted = permute(avareged(j,:,:),[2 3 1]);
        new(j,:,:) = inpainting_iteration(img, corrupted, mask, shifts, starting_qb - floor(i/itr));
    end
    if graph,
        psnrs(i+1) = errorsVideos(comparison, new, frames_mask);
        line = update_psnr_graph(psnrs,line);
    end
end
end




