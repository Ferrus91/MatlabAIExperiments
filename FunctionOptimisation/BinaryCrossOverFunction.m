function returnVector = BinaryCrossOverFunction(originalVector, mutatedVector, crossOverFactor)
    returnVector = originalVector;
    for i=1:size(originalVector)
        if rand < crossOverFactor
           returnVector(i) = mutatedVector(i);
        else 
        end
end