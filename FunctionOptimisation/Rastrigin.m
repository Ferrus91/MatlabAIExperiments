function rastrigin = Rastrigin(array)
   rastrigin = 0;
      arrayLength = length(array);
      rastrigin = rastrigin + 10*arrayLength;
    for k = 1:arrayLength
        rastrigin = rastrigin + array(k)^2 - 10*cos(2*pi*array(k));
    end
end