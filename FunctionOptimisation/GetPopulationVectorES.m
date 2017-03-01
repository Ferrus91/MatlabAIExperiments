function [popVect, deviation, reevaluateCount, successfulMutationCount] = GetPopulationVectorES(population, deviationVector, index, dimensions, reevaluateCounter, successfulMutationCounter) 
        startPopVector = 1 + (index-1)*dimensions;
        endPopVector = 1 + (index-1)*dimensions + dimensions -1;
        popVect = population(startPopVector:endPopVector);
        deviation = deviationVector(index);
        reevaluateCount = reevaluateCounter(index);
        successfulMutationCount = successfulMutationCounter(index);
end