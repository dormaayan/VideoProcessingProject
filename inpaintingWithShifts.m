function [ restored ] = inpaintingWithShifts( corrupted, mask, graph,original)
%parameters for the algorithm.
shifts = 3;
itr = 3;
starting_qb = 37;

mask = double(mask);
corrupted = double(corrupted);
%prev = double(128*mask + corrupted .* (1-mask));
prev = inpaintingLinesAveraging(corrupted,mask);

if graph,
    psnrs(1) = psnr_mask(original,prev,mask);
    line = initialize_psnr_graph(psnrs);
end

for i=0:1:starting_qb*itr,
    prev = inpainting_iteration( prev, corrupted, mask, shifts, starting_qb-floor(i/itr));
    
    if graph,
        psnrs(length(psnrs)+1) = psnr_mask(original,prev,mask);
        line = update_psnr_graph(psnrs,line);
    end
    
end

restored = prev;
end

