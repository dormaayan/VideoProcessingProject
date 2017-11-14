function [ next ] = video_inpainting_iteration( prev, corrupted, mask, shifts, qb)

[h,w,fr] = size(prev);
sum = double(zeros(size(prev)));
count = zeros(size(prev));
Nb = shifts * shifts;
for j=0:1:Nb-1,
    res = hevc_intra_compression_decompression(shiftVideo(prev,shifts,j),qb);
    sum = sum + shiftBackVideo(res,shifts,j,h,w,fr);
    count = count + shiftBackVideo(shiftVideo(ones(h,w),shifts,j),shifts,j,h,w,fr);
end
next = ((sum./count) .* mask) + (corrupted.*(1-mask));

end

