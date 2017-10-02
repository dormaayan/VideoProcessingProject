function [ restored ] = inpaintingLinesAveraging( corrupted, mask)

mask = double(mask);
corrupted = double(corrupted);
restored = double(corrupted .* (1-mask));
[h,w] = size(corrupted);

for i=1:1:h,
    for j=1:1:w,
        if mask(i,j)==1,
            disp(i);
           restored(i,j)=(restored(i+1,j)+restored(i-1,j))/2; 
        end
    end
end