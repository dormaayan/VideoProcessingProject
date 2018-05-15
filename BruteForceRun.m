name = 'ice.yuv';
hor_psnrs = [];
ver_psnrs = [];
alt_psnrs = [];
itrs = [];
shitfs_arr = [];
qbs = [];
for itr = 1:1:1
   for shifts = 1:1:2
       for starting_qb = 20:1:21
           fprintf('itr = %d, shitfs = %d, qb = %d\n',itr,shifts,starting_qb);
           [hor_psnr, ver_psnr, alt_psnr ] = run_all_versions('Videos',name, 704, 576, 480, 352, 288, shifts, itr, starting_qb, 0);
           hor_psnrs = [hor_psnrs;hor_psnr];
           ver_psnrs = [ver_psnrs;ver_psnr];
           alt_psnrs = [alt_psnrs;alt_psnr];
           itrs = [itrs;itr];
           shitfs_arr = [shitfs_arr;shifts];
           qbs = [qbs;starting_qb];
       end
   end
end

filename = sprintf('psnrs\\AllRuns-%s.mat',name);
save(filename,'hor_psnrs','ver_psnrs','alt_psnrs','itrs','shitfs_arr','qbs');
disp('congrates, we are done!');