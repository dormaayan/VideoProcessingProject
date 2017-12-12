function [ ] = run_all_versions( path, name, o_hight, o_width, frames, hight, width, shifts, itr, starting_qb)

[original,~] = loadVideo(sprintf('%s\%s',path,name),o_hight,o_width,frames);
original = original(1:hight,1:width,:);

mask = 2:2:frames;
filtered = original(:,:,1:2:frames);

format = 'Version %s psnr: %.2fDb';
versions = ['averaging','horizontal','vertical','alternating'];
res_psnr = zeros(size(versions));

averaging = averageFRUC(filtered);
res_psnr(1) = errorsVideos(original,averaging,mask);
clear averaging;

[horizontal,hor_psnrs] = inpaintingFRUCOneWay(filtered, true, original, [1 3 2], shifts, itr, starting_qb);
res_psnr(2) = errorsVideos(original,horizontal,mask);
clear horizontal;

[vertical,ver_psnrs] = inpaintingFRUCOneWay(filtered, true, original, [3 2 1], shifts, itr, starting_qb);
res_psnr(3) = errorsVideos(original,vertical,mask);
clear vertical;

[alternating,alt_psnrs] = inpaintingFRUCAlternating(filtered, true, original, shifts, itr, starting_qb);
res_psnr(4) = errorsVideos(original,alternating,mask);
clear alternating;

filename = sprintf('psnrs\%s_%d_%d_%d.mat',name,hight,width,frames);
save(filename,'hor_psnrs','ver_psnrs','alt_psnrs');

filename = sprintf('results\%s_%d_%d_%d.txt',name,hight,width,frames);
file = fopen(filename);
fprintf(file,format,versions,res_psnr);


end

