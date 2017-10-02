function [ restored ] = inpaintingWithShifts( corrupted, mask)
    [h,w] = size(corrupted);
    mask = double(mask);
    corrupted = double(corrupted);
    prev = double(128*mask + corrupted .* (1-mask));
    shifts = 3;
    Nb = shifts*shifts;
    itr = 3;
    
    for i=0:1:51*itr,
       disp(i);
       sum = double(zeros(size(corrupted)));
       count = zeros(size(corrupted));
       for j=0:1:Nb,
         res = hevc_bpg_image_compression_decompression(shift(prev,Nb,j),51-(i/itr));
         sum = sum + shiftBack(res,Nb,j,h,w);
         count = count + shiftBack(shift(ones(h,w),Nb,j),Nb,j,h,w);
       end
       prev = ((sum./count) .* mask) + (corrupted.*(1-mask));
   
    end
    restored = prev;
end

