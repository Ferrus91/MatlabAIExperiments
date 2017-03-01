function toroidalBoundSaturate =  ToroidalBoundSaturate(interval, values)
toroidalBoundSaturate = [];
for k = 1:length(values)
    [lowerBound, upperBound, range]  =  GetInterval(interval);
    if lowerBound >= upperBound
        error('Lower bound must be less than lower bound');
    end
    value = values(k);
    finished = false;
    while ~finished
        if(value > upperBound)
            distanceFromBound = value - upperBound;
            value = lowerBound + distanceFromBound;
        elseif (value < lowerBound)
            distanceFromBound = lowerBound - value;
            value = upperBound - distanceFromBound;
        else
            finished = true;
        end
    end
    toroidalBoundSaturate=[toroidalBoundSaturate, value];
end
end
