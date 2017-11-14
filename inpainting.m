function [ restored ] = inpainting( corrupted, mask)
    mask = double(mask);
    corrupted = double(corrupted);
    prev = double(128*mask + corrupted .* (1-mask));
    figure;
    imshow(prev,[0,255]);
    itr = 1;
    
    for i=0:1:51*itr,
       
       res = hevc_bpg_image_compression_decompression(prev,51-floor(i/itr));
       prev = (res .* mask) + (corrupted .* (1-mask));
      
    end
    restored = prev;
end

