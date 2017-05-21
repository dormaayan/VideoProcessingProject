function [ res ] = compressDecompress(prev,i,ratio)
    imwrite(prev,strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'),'jp2','CompressionRatio',ratio);
    res = imread(strcat(strcat('InpaintingCycles/pic',int2str(i)),'.jp2'));
end

