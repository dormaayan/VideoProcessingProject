function [ ] = run_all_versions( path, name, o_hight, o_width, frames, hight, width, shifts, itr, starting_qb)

[original,~] = loadVideo(sprintf('%s\\%s',path,name),o_hight,o_width,frames);
original = original(1:width,1:hight,:);

mask = 2:2:frames;
filtered = original(:,:,1:2:frames);

averaging = averageFRUC(filtered);
res = ['averaging',errorsVideos(original,averaging,mask)];
clear averaging;

[~,hor_psnrs] = inpaintingFRUCOneWay(filtered, false, original, [1 3 2], shifts, itr, starting_qb);

[~,ver_psnrs] = inpaintingFRUCOneWay(filtered, false, original, [3 2 1], shifts, itr, starting_qb);

[~,alt_psnrs] = inpaintingFRUCAlternating(filtered, false, original, shifts, itr, starting_qb);

filename = sprintf('psnrs\\%s_%d_%d_%d_%d_%d_%d.mat',name,hight,width,frames, shifts, itr, starting_qb);
save(filename,'hor_psnrs','ver_psnrs','alt_psnrs');


end

