function [michalewicz, interval] = Michalewicz(array)
   michalewicz = 0;
      arrayLength = length(array);
    for k = 1:arrayLength
        michalewicz = michalewicz + sin(array(k))*(sin(k*array(k)/pi)^20);
    end
    michalewicz = -michalewicz;
    interval = [0, pi];
end