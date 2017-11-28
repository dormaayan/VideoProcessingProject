function [ shifted ] = shiftVideo(video,shifts,j)
row = floor(j/shifts)*2;
column = mod(j,shifts)*2;
shifted = video((column+1):end,(row+1):end,:);
end