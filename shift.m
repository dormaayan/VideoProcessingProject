function [ shifted ] = shift(img,shifts,j)
row = floor(j/shifts);
column = mod(j,shifts);
shifted = img((column+1):end,(row+1):end);
end

