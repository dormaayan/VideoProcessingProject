function [ restored ] = inpainting( corrupted, mask)
%     beta = 0.001;
    mask = double(mask);
    corrupted = double(corrupted);
    prev = double(128*mask + corrupted .* (1-mask));
    figure;
    imshow(prev,[0,255]);
%     for i=1:1:60,
%        res = compressDecompress(prev,i,max((2*myu)/beta,1));
    itr = 1;
    
    for i=0:1:51*itr,
       
       res = hevc_bpg_image_compression_decompression(prev,51-floor(i/itr));
       prev = (res .* mask) + (corrupted .* (1-mask));
%        beta = 1.1*beta;
      
    end
    restored = prev;
end

