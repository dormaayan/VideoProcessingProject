function [ new ] = convert3Dto2D( original )
        [height,width,original_frame_rate] = size(original);
        new = zeros(width,original_frame_rate);
        for i=1:1:width,
            for j=1:1:original_frame_rate,
                new(i,j) = original(1,i,j);
            end
        end
end

