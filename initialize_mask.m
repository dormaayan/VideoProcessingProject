function [ mask ] = initialize_mask( height,width,fr )
%creates the mask used by the inpainting FRUC functions.
mask = zeros(height,width,2*fr);
mask(:,:,2:2:fr) = 1;
end

