function dejong = DeJong(array)
   dejong = 0;
      arrayLength = length(array);
    for k = 1:arrayLength
        dejong = dejong + array(k)^2;
    end
end
