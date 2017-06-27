function [ new , mses, psnrs] = inpaintingFrucVideoWithAverageStart( original, fps, comparison, frames_mask)
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
    itr = 2;
    [mses(1),psnrs(1)] = errorsVideos(comparison, prev, frames_mask);
    figure;
    hold on;
    line = plot(mses);
    loc = 2;
    for i=47*itr:1:49*itr,
       disp(i);
       res = hevc_x265_video_compression_decompression(uint8(prev), mov,51 - floor(i/itr), 'inpaintedMovie',fps,frames);
       prev = (uint8(res) .* uint8(mask)) + (uint8(corrupted).*uint8(1-mask));
       [mses(loc),psnrs(loc)] = errorsVideos(comparison, prev, frames_mask);
       loc = loc + 1;
       delete(line);
       line = plot(mses);
       drawnow();
    end
    new = prev;
    figure;
    plot(psnrs);
end