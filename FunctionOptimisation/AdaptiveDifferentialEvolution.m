function [adaptiveDifferentialEvolutionVector, fitness, movingFitness] =  AdaptiveDifferentialEvolution(dimensions, interval, optimisationFunction, saturationFunction, populationSize, fLow, fHigh, fMutationPos, crMutationPos, crossOverFunction, compBudget)
if populationSize < 4
    error('Differential evolution requires population size of at least 4');
end
populationMatrix = [];
fMatrix = [];
crMatrix = rand(populationSize,1);
movingFitness=[];
for i=1:populationSize
    populationVector = RandomVector(dimensions, interval);
    populationMatrix = [populationMatrix; populationVector];
    fMatrix = [fMatrix fLow + rand*fHigh];
end

for i=1:compBudget
    fitnessVector = [];
    for j=1:populationSize
        fitnessVector(j) =  optimisationFunction(populationMatrix(j,:));
    end
    mutatedVectors = [];
    newPopulationMatrix = [];
    for j=1:populationSize
        mutatedVector = [];
        originalVector = populationMatrix(j,:);
        index1 = randi(populationSize);
        index2 = randi(populationSize);
        while index1 == index2
            index2 = randi(populationSize);
        end
        index3 = randi(populationSize);
        while index1 == index3 || index2 == index3
            index3 = randi(populationSize);
        end
        randomVector1 = populationMatrix(index1,:);
        randomVector2 = populationMatrix(index2,:);
        randomVector3 = populationMatrix(index3,:);
        mutatedVector = randomVector1 + fMatrix(j)*(randomVector2 - randomVector3);
        crossedVector = crossOverFunction(originalVector, mutatedVector,  crMatrix(j));
        crossedVector = saturationFunction(interval, crossedVector);
        newF = fMatrix(j);
        if(rand < fMutationPos)
            newF = fLow + rand*fHigh;
        end
        newCR = crMatrix(j);
        if(rand < crMutationPos)
            newCR = rand;
        end
        if optimisationFunction(crossedVector) < optimisationFunction(originalVector)
            populationMatrix(j,:) = crossedVector;
            fMatrix(j) = newF;
            crMatrix(j) = newCR;
        end
    end
bestFitness = [];
bestPosition = [];
for i=1:populationSize
    populationVector = populationMatrix(i,:);
    fitness = optimisationFunction(populationVector);
    if isempty(bestFitness) || fitness < bestFitness
        bestFitness = fitness;
        bestPosition = populationVector;
    end
end
movingFitness = [movingFitness bestFitness];

end
bestFitness = [];
bestPosition = [];
for i=1:populationSize
    populationVector = populationMatrix(i,:);
    fitness = optimisationFunction(populationVector);
    if isempty(bestFitness) || fitness < bestFitness
        bestFitness = fitness;
        bestPosition = populationVector;
    end
end
fitness=bestFitness;
adaptiveDifferentialEvolutionVector=bestPosition;
end
