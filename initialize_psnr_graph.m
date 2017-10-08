function [line] = initialize_psnr_graph(psnrs)
%initializes an psnr graph, that can be dynamically updated througout
%the run of the inpainting algorithm
figure;
hold on;
line = plot(0,psnrs);

end

