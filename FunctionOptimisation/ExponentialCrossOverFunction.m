function returnVector = ExponentialCrossOverFunction(originalVector, mutatedVector, crossOverFactor)
    returnVector = originalVector;
    dimensions = size(originalVector);
    j = randi(dimensions);
    p = 0;
    maxMutations = dimensions - 1;
    while rand < crossOverFactor & p < maxMutations
        returnVector(mod(j + p, dimensions) + 1) = mutatedVector(mod(j + p) + 1);
        p = p + 1;
    end
end