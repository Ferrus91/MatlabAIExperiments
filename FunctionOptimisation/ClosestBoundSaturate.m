function closestBoundSaturate =  ClosestBoundSaturate(interval, values) 
    closestBoundSaturate = [];
    for k = 1:length(values)
       [lowerBound, upperBound, range]  =  GetInterval(interval);
       value = values(k);
       if(value > upperBound) 
         value = upperBound;
       elseif (value < lowerBound)
         value = lowerBound;
       end
       closestBoundSaturate=[closestBoundSaturate, value];
    end
end
