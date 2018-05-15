function val = clipValue(val, valMin, valMax)
% check if value is valid

min = (val(:)>valMin);
max = (val(:)<valMax);
val(:) = min .* max .* val(:) + valMin * (1-min) + valMax * (1-max);