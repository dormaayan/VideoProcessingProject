function [ new ] = convert2Dto3D( original )
        [height,width] = size(original);
        new = zeros(1,height,width);
        for i=1:1:height,
            for j=1:1:width,
            new(1,i,j) = original(i,j);
            end
        end
end

