function [ restored ] = inpainting( corrupted, mask ,myu)
    beta = 0.001;
    prev = corrupted;
%     for i=1:1:60,
%        res = compressDecompress(prev,i,max((2*myu)/beta,1));
    itr = 1;
    for i=0:1:51*itr,
       res = hevc_bpg_image_compression_decompression(prev,51-(i/itr));
       prev = (uint8(res) .* uint8(mask)) + (uint8(corrupted) .* uint8(1-mask));
       beta = 1.1*beta;
    end
    restored = prev;
end

