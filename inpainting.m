function [ restored ] = inpainting( corrupted, mask)
%     prev = corrupted;
%     for i=1:1:20,
%         imwrite(prev,''InpaintingCycles/''
%     end
% 
%     end
     imwrite(corrupted,'InpaintingCycles/pic.jp2','jp2','CompressionRatio',300);
end

