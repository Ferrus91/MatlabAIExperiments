function [geneticAlgorithmVector, fitness, movingFitness] =  GeneticAlgorithm(dimensions, interval, optimisationFunction, saturationFunction, populationSize, mutationRate, crossoverRate, deviationShift, compBudget)
population = [];
movingFitness = [];
standardDeviationInterval = [0 1];
vectorSize = dimensions*2;
for i=1:populationSize
    individualVector = RandomVector(dimensions, interval);
    deviationVector = RandomVector(dimensions, standardDeviationInterval);
    population = [population [individualVector deviationVector]];
end

for i=1:compBudget
    mutatedPopulation = [];
    for i=1:populationSize
        [individualVector deviationVector] = GetPopulationVector(population, i, vectorSize);
        mutatedIndVector = [];
        mutatedDevVector = [];
        for i=1:dimensions
            value = individualVector(i);
            if rand < mutationRate
                value = value + deviationVector(i)*randn();
            end
            mutatedIndVector = [mutatedIndVector value];
        end
        mutatedIndVector = saturationFunction(interval, mutatedIndVector);
        for i=1:dimensions
            value = deviationVector(i);
            if rand < mutationRate
                value = value + deviationShift*randn();
            end
        mutatedDevVector  = [mutatedDevVector value]; 
        end
        mutatedPopulation = [mutatedPopulation mutatedIndVector mutatedDevVector];
    end
    matingPool = [];
    for i=1:populationSize
        selectRandomParentIndex1 = randi(populationSize);
        selectRandomParentIndex2 = randi(populationSize);
        [individualVector1 deviationVector1] = GetPopulationVector(mutatedPopulation, selectRandomParentIndex1, vectorSize);
        [individualVector2 deviationVector2] = GetPopulationVector(mutatedPopulation, selectRandomParentIndex2, vectorSize);
        if(optimisationFunction(individualVector1) < optimisationFunction(individualVector2))
            matingPool = [matingPool individualVector1 deviationVector1];
        else
            matingPool = [matingPool individualVector2 deviationVector2];
        end
    end
    newPopulation = [];
    for i=1:2:populationSize
        [individualVector1 deviationVector1] = GetPopulationVector(matingPool, i, vectorSize);
        [individualVector2 deviationVector2] = GetPopulationVector(matingPool, i+1, vectorSize);
        crossedVector1 = [];
        crossedVector2 = [];
        for j=1:dimensions
            if rand < crossoverRate
                crossedValue = min(individualVector1(j), individualVector2(j)) + rand*abs(individualVector2(j) - individualVector1(j));
                crossedVector1 = [crossedVector1 crossedValue];
                crossedVector2 = [crossedVector2 crossedValue];
            else
                crossedVector1 = [crossedVector1 individualVector1(j)];
                crossedVector2 = [crossedVector2 individualVector2(j)];
            end
        end
        for j=1:dimensions
            if rand < crossoverRate
                crossedValue = min(deviationVector1(j), deviationVector2(j)) + rand*abs(deviationVector2(j) - deviationVector1(j));
                crossedVector1 = [crossedVector1 crossedValue];
                crossedVector2 = [crossedVector2 crossedValue];
            else
                crossedVector1 = [crossedVector1 deviationVector1(j)];
                crossedVector2 = [crossedVector2 deviationVector2(j)];
            end
        end
        newPopulation = [newPopulation crossedVector1 crossedVector2];
    end
    if(populationSize/2 == 1)
      [individualVector1 deviationVector1] = GetPopulationVector(mutatedPopulation, populationSize, vectorSize);
      newPopulation = [newPopulation individualVector1 deviationVector1];    
    end
    population = newPopulation;
bestFitness = [];
bestVector = [];
for i=1:populationSize
    [individualVector deviationVector] = GetPopulationVector(population, i, vectorSize);
    indFitness = optimisationFunction(individualVector);
    if(isempty(bestFitness) || indFitness < bestFitness)
        bestFitness = indFitness;
        bestVector = individualVector;
    end
end
for i=1:populationSize
    [individualVector deviationVector] = GetPopulationVector(population, i, vectorSize);
    indFitness = optimisationFunction(individualVector);
    if(isempty(bestFitness) || indFitness < bestFitness)
        bestFitness = indFitness;
        bestVector = individualVector;
    end
end
movingFitness = [movingFitness bestFitness];
end
bestFitness = [];
bestVector = [];
for i=1:populationSize
    [individualVector deviationVector] = GetPopulationVector(population, i, vectorSize);
    indFitness = optimisationFunction(individualVector);
    if(isempty(bestFitness) || indFitness < bestFitness)
        bestFitness = indFitness;
        bestVector = individualVector;
    end
end
geneticAlgorithmVector = bestVector;
fitness = bestFitness;
end