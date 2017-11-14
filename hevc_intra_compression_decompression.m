function [ reconstructed_vid ] = hevc_x265_video_compression_decompression( image_y, mov, compression_QP, fps, frames )

height = size( image_y, 1 );
width = size( image_y, 2 );

compressed_file = 'temp';

temp_number = 2; %randi(1000,1);
temp_input_filename = sprintf( 'input%d.yuv', temp_number );
saveVideo(temp_input_filename, mov, image_y, frames);

temp_reconstructed_filename = sprintf( 'output%d.yuv', temp_number );
[dontcare1, dontcare2] = system( sprintf('x265.exe --profile main-intra --input %s --input-res %dx%d --fps %d --frames %d --output %s --crf %d --no-info', temp_input_filename, width, height, fps, frames, compressed_file, compression_QP ) );
[dontcare1, dontcare2] = system( sprintf('ffmpeg.exe -i %s %s', compressed_file, temp_reconstructed_filename ) );

%maybe delete input.yuv
system( sprintf( 'del %s', temp_input_filename ) );

reconstructed_vid = loadVideo(temp_reconstructed_filename,width,height,frames);

system( sprintf( 'del %s', temp_reconstructed_filename ) );
system( sprintf( 'del %s', compressed_file ) );
end

