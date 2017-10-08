function [ mask ] = initialize_mask( mask_height,original_frame_rate )
%creates the mask used by the inpainting FRUC functions.
mask = zeros(mask_height,2*original_frame_rate);
for i=1:1:mask_height
    for j=1:1:2*original_frame_rate
        if mod(j,2)<1
            mask(i,j)=1;
        end
    end
end
end

