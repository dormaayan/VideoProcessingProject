function [ reconstructed_vid ] = hevc_intra_compression_decompression( image_y, mov, compression_QP, frames )

height = size( image_y, 1 );
width = size( image_y, 2 );

compressed_file = 'temp';

temp_number = 2; %randi(1000,1);
temp_input_filename = sprintf( 'input%d.yuv', temp_number );
saveVideo(temp_input_filename, mov, image_y, frames);

temp_reconstructed_filename = sprintf( 'output%d.yuv', temp_number );
[~, ~] = system( sprintf('x265.exe --profile main-intra --input %s --input-res %dx%d --fps %d --frames %d --output %s --crf %d --no-info', temp_input_filename, width, height, frames, frames, compressed_file, compression_QP ) );
[~, ~] = system( sprintf('ffmpeg.exe -i %s %s', compressed_file, temp_reconstructed_filename ) );

reconstructed_vid = loadVideo(temp_reconstructed_filename,width,height,frames);

system( sprintf( 'del %s %s %s', temp_input_filename, temp_reconstructed_filename, compressed_file ) );

end

