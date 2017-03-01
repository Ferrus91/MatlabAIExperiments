function [sAlgorithmVector, fitness] =  SAlgorithm(dimensions, interval, optimisationFunction, saturationFunction, compBudget)
[lowerBound, upperBound, range]  =  GetInterval(interval);
p = range*0.4;
dimensionedIntervals = [];

xe = RandomVector(dimensions, interval);

for k=1:compBudget
    xt =xe;
    xs= xe;
    for i=1:dimensions
        xs(i) = xe(i) - p;
        xs=saturationFunction(interval,xs);
        
        if optimisationFunction(xs) <= optimisationFunction(xt)
            xt = xs;
        else
            xs(i) = xe(i) + p/2;
            xs=saturationFunction(interval,xs);
            if optimisationFunction(xs) <= optimisationFunction(xt)
                xt = xs;
            end
        end
    end
    
    if optimisationFunction(xt) <= optimisationFunction(xe)
        xe =xt;
    else
        p=p/2;
    end
end
sAlgorithmVector=xe;
fitness = optimisationFunction(xe);
end
