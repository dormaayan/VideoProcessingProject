function [ new ] = inpaintingFrucVideo( original, fps)
    [height,width,original_frame_rate] = size(original);
    frames = 2*original_frame_rate;
    corrupted = zeros(height,width,frames);
    mask = zeros(height,width,frames);
    %Copy the original frames to the new video
    for i=1:1:original_frame_rate
        corrupted(:,:,2*i-1) = original(:,:,i);
    end
    for i=2:2:frames
        mask(:,:,i) = 1;
    end
    prev = corrupted;
    ycbcr_image = ones( height, width, 3, 'uint8' );
    mov_struct = struct( 'cdata', ycbcr_image, 'colormap', [] );
    for i=1:1:frames,
       mov(i) = mov_struct; 
    end
    for i=0:1:49*3,
       disp(i);
       res = hevc_x265_video_compression_decompression(uint8(prev), mov,51 - floor(i/3), 'inpaintedMovie',fps,frames);
       prev = (uint8(res) .* uint8(mask)) + uint8(corrupted);
    end
    new = prev;
end