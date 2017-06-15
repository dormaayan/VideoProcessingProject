function [ reShifted ] = shiftBack(shifted,Nb,j,h,w)

reShifted = zeros(h,w);
row = uint16(j/sqrt(Nb));
column = uint16(mod(j,sqrt(Nb)));
reShifted((column+1):1:uint16(h+column-sqrt(Nb)),(row+1):1:uint16(w+row-sqrt(Nb))) = shifted;

end

