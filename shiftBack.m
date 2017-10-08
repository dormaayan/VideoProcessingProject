function [ reShifted ] = shiftBack(shifted,shifts,j,h,w)

reShifted = zeros(h,w);
row = floor(j/shifts);
column = mod(j,shifts);
reShifted((column+1):end,(row+1):end) = shifted;

end

