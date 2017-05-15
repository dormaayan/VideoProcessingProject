function [ new ] = convert2Dto3DHorizontal( original )
        [height,width] = size(original);
        new = zeros(height,1,width);
        for i=1:1:height,
            for j=1:1:width,
            new(i,1,j) = original(i,j);
            end
        end
end

