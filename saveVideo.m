function [ ] = saveVideo( output_yuv, input_yuv_mov, video, number_of_frames )
%saves a grayscale video as an yuv

    for frame_index = 1:number_of_frames
        ycbcr_frame = rgb2ycbcr( input_yuv_mov(frame_index).cdata );
        ycbcr_frame( :, :, 1 ) = video( :, :, frame_index );
        ycbcr_frame( :, :, 2 ) = 128;
        ycbcr_frame( :, :, 3 ) = 128;
        input_yuv_mov(frame_index).cdata = ycbcr2rgb(ycbcr_frame);
    end

    saveFileYuv( input_yuv_mov, output_yuv, 'w' );

end

