function [ reShifted ] = shiftBackVideo(shifted,shifts,j,h,w,fr)

reShifted = zeros(h,w,fr);
row = floor(j/shifts)*2;
column = mod(j,shifts)*2;
reShifted((column+1):end,(row+1):end,:) = shifted;

end
