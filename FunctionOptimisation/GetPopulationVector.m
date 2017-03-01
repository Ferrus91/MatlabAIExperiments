function [popVect, deviationVect] = GetPopulationVector(population, index, vectorSize) 
        startPopVector = 1 + (index-1)*vectorSize;
        endPopVector = 1 + (index-1)*vectorSize + vectorSize/2 -1;
        startDeviationVector = 1 + (index-1)*vectorSize + vectorSize/2;
        endDeviationVector = 1 + index*vectorSize -1;
        popVect = population(startPopVector:endPopVector);
        deviationVect = population(startDeviationVector:endDeviationVector);
end