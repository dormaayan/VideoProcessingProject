function [hor_psnr, ver_psnr, alt_psnr ] = run_all_versions( path, name, o_hight, o_width, frames, hight, width, shifts, itr, starting_qb, ending_qb)

[original,~] = loadVideo(sprintf('%s\\%s',path,name),o_hight,o_width,frames);
original = original(1:width,1:hight,:);

mask = 2:2:frames;
filtered = original(:,:,1:2:frames);

averaging = averageFRUC(filtered);
base_psnr = errorsVideos(original,averaging,mask);
clear averaging;

[~,hor_psnrs] = inpaintingFRUCOneWay(filtered, false, original, [1 3 2], shifts, itr, starting_qb, ending_qb);
hor_psnr = max(hor_psnrs);

[~,ver_psnrs] = inpaintingFRUCOneWay(filtered, false, original, [3 2 1], shifts, itr, starting_qb, ending_qb);
ver_psnr = max(ver_psnrs);

[~,alt_psnrs] = inpaintingFRUCAlternating(filtered, false, original, shifts, itr, starting_qb, ending_qb);
alt_psnr = max(alt_psnrs);

filename = sprintf('psnrs\\%s_%d_%d_%d_%d_%d_%d_%d.mat',name,hight,width,frames, shifts, itr, starting_qb,ending_qb);
save(filename,'hor_psnrs','ver_psnrs','alt_psnrs','base_psnr');


end

