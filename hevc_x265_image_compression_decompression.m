function [ reconstructed_image ] = hevc_x265_image_compression_decompression( image_y, compression_QP, compressed_file )

height = size( image_y, 1 );
width = size( image_y, 2 );
ycbcr_image = 128 * ones( height, width, 3, 'uint8' );
ycbcr_image( :, :, 1 ) = image_y;
rgb_image = ycbcr2rgb( ycbcr_image );

mov_struct = struct( 'cdata', rgb_image, 'colormap', [] );

temp_number = 2; %randi(1000,1);

temp_input_filename = sprintf( 'Y:\\input%d.yuv', temp_number );
saveFileYuv( mov_struct, temp_input_filename, 'w' );

temp_reconstructed_filename = sprintf( 'Y:\\output%d.bmp', temp_number );

encoderDirectory = 'Y:'; %'F:\Research\trunk_root\code\my_packages\hevc_image_compression';
[dontcare1, dontcare2] = system( sprintf('%s\\x265.exe --profile msp --input %s --input-res %dx%d --fps 30 --frames 1 --output %s --crf %d --no-info --rd 6', encoderDirectory, temp_input_filename, width, height, compressed_file, compression_QP ) );
[dontcare1, dontcare2] = system( sprintf('%s\\ffmpeg.exe -i %s %s', encoderDirectory, compressed_file, temp_reconstructed_filename ) );

%maybe delete input.yuv
system( sprintf( 'del %s', temp_input_filename ) );

reconstructed_image_ycbcr = rgb2ycbcr( imread( temp_reconstructed_filename ) );
reconstructed_image = reconstructed_image_ycbcr( :, :, 1 );

system( sprintf( 'del %s', temp_reconstructed_filename ) );
end

