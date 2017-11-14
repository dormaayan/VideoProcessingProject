function [ shifted ] = shiftVideo(video,shifts,j)
row = floor(j/shifts);
column = mod(j,shifts);
shifted = video((column+1):end,(row+1):end,:);
end