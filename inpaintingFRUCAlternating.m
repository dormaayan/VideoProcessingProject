function [ new,psnrs ] = inpaintingFRUCAlternating( original , graph, comparison )

%parameters for the algorithm.
shifts = 3;
itr = 3;
starting_qb = 30;

avareged = averageFRUC(original);
new = avareged;

[height,width,original_frame_rate] = size(original);

frames_mask = 2:2:original_frame_rate*2;

if graph,
    psnrs(1) = errorsVideos(comparison, new, frames_mask);
    line = initialize_psnr_graph(psnrs);
end

Hpermutation = [1 3 2];
Vpermutation = [3 2 1];
mask = initialize_mask(height, width, original_frame_rate);

for i=1:1:starting_qb*itr,
    
    new = video_inpainting_iteration(new, avareged, mask, shifts, starting_qb - floor(i/itr),Hpermutation);
    new = video_inpainting_iteration(new, avareged, mask, shifts, starting_qb - floor(i/itr),Vpermutation);
    
    if graph,
        psnrs(i+1) = errorsVideos(comparison, new, frames_mask);
        line = update_psnr_graph(psnrs,line);
    end
end

end





