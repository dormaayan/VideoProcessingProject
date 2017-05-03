function [ restored ] = inpainting( corrupted, mask ,myu)
    beta = 0.001;
    prev = corrupted;
    for i=1:1:50,
       imwrite(prev,strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'),'jp2','CompressionRatio',max((2*myu)/beta,1));
       res = imread(strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'));
       prev = (uint8(res) .* uint8(zeros(size(res))+mask)) + uint8(corrupted);
       beta = 1.1*beta;
    end
    restored = prev;
end

