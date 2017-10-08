function [ new_line ] = update_psnr_graph(psnrs, old_line)
%updates the psnrs graph with the result of a new iteration
delete(old_line);
new_line = plot(0:length(psnrs)-1,psnrs);
drawnow();

end

