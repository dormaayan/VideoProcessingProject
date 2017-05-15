function [ new ] = convert3Dto2DHorizontal( original )
        [height,width,original_frame_rate] = size(original);
        new = zeros(height,original_frame_rate);
        for i=1:1:height,
            for j=1:1:original_frame_rate,
                new(i,j) = original(i,1,j);
            end
        end
end

