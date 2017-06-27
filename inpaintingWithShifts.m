function [ restored ] = inpaintingWithShifts( corrupted, mask ,myu)
    [h,w] = size(corrupted);
    beta = 0.001;
    prev = corrupted;
    Nb = 16;
    for i=1:1:60,
        sum = zeros(size(corrupted));
        count = zeros(size(corrupted));
       for j=0:1:Nb,
         res = compressDecompress(shift(prev,Nb,j),i,max((2*myu)/beta,1));
         sum = sum + shiftBack(res,Nb,j,h,w);
         count = count + shiftBack(shift(ones(h,w),Nb,j),Nb,j,h,w);
       end
       prev = (uint8(sum./count) .* uint8(mask)) + (uint8(corrupted).*uint8(1-mask));
       beta = 1.1*beta;
%     end
    restored = prev;
end

