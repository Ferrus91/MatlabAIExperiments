function [differentialEvolutionVector, fitness, movingFitness] =  DifferentialEvolution(dimensions, interval, optimisationFunction, saturationFunction, populationSize, mutationFactor, crossOverRate, crossOverFunction, compBudget)
movingFitness = [];
if populationSize < 4
    error('Differential evolution requires population size of at least 4');
end
populationMatrix = [];
for i=1:populationSize
    populationVector = RandomVector(dimensions, interval);
    populationMatrix = [populationMatrix; populationVector];
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
        mutatedVector = randomVector1 + mutationFactor*(randomVector2 - randomVector3);
        crossedVector = crossOverFunction(originalVector, mutatedVector, crossOverRate);
        crossedVector = saturationFunction(interval, crossedVector);
        if optimisationFunction(crossedVector) < optimisationFunction(originalVector)
            populationMatrix(j,:) = crossedVector;
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
differentialEvolutionVector=bestPosition;

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
