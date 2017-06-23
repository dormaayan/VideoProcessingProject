function [ new ] = inpaintingFrucVideoWithAverageStart( original, fps)
    [height,width,original_frame_rate] = size(original);
    frames = 2*original_frame_rate;
    corrupted = averageFRUC(original);
    mask = zeros(height,width,frames);
    %Copy the original frames to the new video
    for i=2:2:frames
        mask(:,:,i) = 1;
    end
    prev = corrupted;
    ycbcr_image = ones( height, width, 3, 'uint8' );
    mov_struct = struct( 'cdata', ycbcr_image, 'colormap', [] );
    for i=1:1:frames,
       mov(i) = mov_struct; 
    end
    for i=0:1:49,
       res = hevc_x265_video_compression_decompression(uint8(prev), mov,51 - floor(i), 'inpaintedMovie',fps,frames);
       prev = (uint8(res) .* uint8(mask)) + (uint8(corrupted).*uint8(1-mask));
    end
    new = prev;
end