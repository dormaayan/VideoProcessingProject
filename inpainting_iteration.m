function [ next ] = inpainting_iteration(prev, corrupted, mask, shifts, qb)
% a single iteration of the inpainting proccess, with shifts
[h,w] = size(prev);
sum = double(zeros(size(prev)));
count = zeros(size(prev));
Nb = shifts * shifts;
for j=0:1:Nb-1,
    res = hevc_bpg_image_compression_decompression(shift(prev,shifts,j),qb);
    sum = sum + shiftBack(res,shifts,j,h,w);
    count = count + shiftBack(shift(ones(h,w),shifts,j),shifts,j,h,w);
end
next = ((sum./count) .* mask) + (corrupted.*(1-mask));

end

