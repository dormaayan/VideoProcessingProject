function [ restored ] = inpainting( corrupted, mask ,myu)
    beta = 0.001;
    prev = corrupted;
    for i=1:1:60,
       res = compressDecompress(prev,i,max((2*myu)/beta,1));
       prev = (uint8(res) .* uint8(mask)) + uint8(corrupted);
       beta = 1.1*beta;
    end
    restored = prev;
end

