function [ reconstructed_image ] = hevc_bpg_image_compression_decompression( image_y, compression_QP, compressed_file )


temp_number = 2; %randi(1000,1);

%temp_input_filename = sprintf( 'Y:\\bpg\\input%d.png', temp_number );
temp_input_filename = sprintf( 'C:\\Users\\Niv\\Documents\\GitHub\\VideoProcessingProject', temp_number );
imwrite( uint8(image_y), temp_input_filename );

%temp_reconstructed_filename = sprintf( 'Y:\\bpg\\output%d.png', temp_number );
temp_reconstructed_filename = sprintf( 'C:\\Users\\Niv\\Documents\\GitHub\\VideoProcessingProject', temp_number );

%encoderDirectory = 'Y:\\bpg'; 
encoderDirectory = 'C:\\Users\\Niv\\Documents\\GitHub\\VideoProcessingProject\\mybpg'; 
[dontcare1, dontcare2] = system( sprintf('%s\\bpgenc.exe -q %d -o %s  %s', encoderDirectory, compression_QP, compressed_file, temp_input_filename ) );
[dontcare1, dontcare2] = system( sprintf('%s\\bpgdec.exe -o %s  %s', encoderDirectory, temp_reconstructed_filename, compressed_file ) );

system( sprintf( 'del %s', temp_input_filename ) );

reconstructed_image = imread( temp_reconstructed_filename );
reconstructed_image = double(reconstructed_image(:,:,1));
system( sprintf( 'del %s', temp_reconstructed_filename ) );

end

