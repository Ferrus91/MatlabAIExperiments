function schwefel = Schwefel(array)
   schwefel = 0;
      arrayLength = length(array);
    for k = 1:arrayLength
        schwefel = schwefel + -array(k)*sin(sqrt((abs(array(k)))));
    end
end