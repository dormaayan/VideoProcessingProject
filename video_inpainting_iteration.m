function [ next ] = video_inpainting_iteration( prev, corrupted, mask, shifts, qb, permutation)

prev = permute(prev, permutation);
corrupted = permute(corrupted, permutation);
mask = permute(mask, permutation);

[h,w,fr] = size(prev);
sum = double(zeros(size(prev)));
count = zeros(size(prev));
Nb = shifts * shifts;

for j=0:1:Nb-1,
    shifted = shiftVideo(prev,shifts,j);
    [imh,imw,~] = size(shifted);
    for i=1:fr,
        mov(i).cdata = uint8(zeros(imh,imw,3));
        mov(i).colormap = [];
    end
    res = hevc_intra_compression_decompression(shifted,mov,qb, fr);
    sum = sum + shiftBackVideo(res,shifts,j,h,w,fr);
    count = count + shiftBackVideo(shiftVideo(ones(h,w,fr),shifts,j),shifts,j,h,w,fr);
end

next = ((sum./count) .* mask) + (corrupted.*(1-mask));
next = permute(next, permutation);

end

