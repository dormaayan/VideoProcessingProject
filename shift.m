function [ shifted ] = shift(img,Nb,j)
[x,y] = size(img);
row = uint16(j/sqrt(Nb));
column = uint16(mod(j,sqrt(Nb)));
shifted = img((column+1):1:uint16(x+column-sqrt(Nb)),(row+1):1:uint16(y+row-sqrt(Nb)));
end

