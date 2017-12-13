function [ new, psnrs] = inpaintingFRUCOneWay( original, graph, comparison, permutation, shifts, itr, starting_qb, ending_qb )

avareged = averageFRUC(original);
new = avareged;

[height,width,original_frame_rate] = size(original);

frames_mask = 2:2:original_frame_rate*2;

psnrs(1) = errorsVideos(comparison, new, frames_mask);
if graph,
    line = initialize_psnr_graph(psnrs);
end

mask = initialize_mask(height, width, original_frame_rate);

for i=1:1:(starting_qb-ending_qb)*itr,
    
    new = video_inpainting_iteration(new, avareged, mask, shifts, starting_qb - floor(i/itr),permutation);
    psnrs(i+1) = errorsVideos(comparison, new, frames_mask);
    
    if graph,    
        line = update_psnr_graph(psnrs,line);
    end
end
end