function [ restored ] = inpainting( corrupted, mask)
    prev = corrupted;
    for i=1:1:40,
       imwrite(prev,strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'),'jp2','CompressionRatio',1000-15*i);
       res = imread(strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'));
       prev = (uint8(res) .* uint8(zeros(size(res))+mask)) + uint8(corrupted);
    end
    restored = prev;
end

