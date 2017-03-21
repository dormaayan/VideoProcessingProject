function [ video, input_yuv_mov ] = loadVideo( input_yuv, width, height, number_of_frames )
%load a grayscale video from an yuv file
    input_yuv_mov = loadFileYuv( input_yuv, width, height, 1:number_of_frames );
    video = zeros(height,width,number_of_frames);

    for frame_index = 1:number_of_frames
        ycbcr_frame = rgb2ycbcr( input_yuv_mov(frame_index).cdata );
        video( :, :, frame_index) = ycbcr_frame( :, :, 1 );
    end

end

