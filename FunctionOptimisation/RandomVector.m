function randomVector =  RandomVector(dimension, interval)
randomVector = [];
sizeArray = length(interval);
if(sizeArray == 2)
    [lowerBound, upperBound, range]  =  GetInterval(interval);
    for i=1:dimension
        randomIntervalPoint = lowerBound + range*rand();
        randomVector=[randomVector, randomIntervalPoint];
    end
else
    error('Error. \nInput must be an interval row vector of two numbers. Actual size %s',sizeArray)
end
end