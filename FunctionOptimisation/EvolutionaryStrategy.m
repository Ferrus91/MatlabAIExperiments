function [evolutionaryStrategyVector, fitness] =  EvolutionaryStrategy(dimensions, interval, optimisationFunction, saturationFunction, populationSize, numberOfChildren, mutationRate, initialDeviation, deviationShift, reevaluateDeviationTime, compBudget)
population = [];
populationDeviation = [];
reevalutionCounter=[];
successfulMutationCounter=[];
for i=1:populationSize
    individualVector = RandomVector(dimensions, interval);
    deviationValue = rand*initialDeviation;
    population = [population individualVector];
    populationDeviation = [populationDeviation deviationValue];
    reevalutionCounter=[reevalutionCounter 0];
    successfulMutationCounter=[successfulMutationCounter 0];
end
for i=1:compBudget
    mutatedPopulation = [];
    mutatedDevVector = [];
    newReevalutionCounter = [];
    newSuccessfulMutationCounter = [];
    for i=1:populationSize
        mutated = false;
        [individualVector, deviation, reevalutionCount, successfulMutationCount] = GetPopulationVectorES(population, populationDeviation, i, dimensions, reevalutionCounter, successfulMutationCounter);
        mutatedVector = [];
        if reevalutionCount >= reevaluateDeviationTime
            percentSuccess = successfulMutationCount/reevalutionCount;
            if percentSuccess > 0.2
                deviation = deviation/deviationShift;
            elseif percentSuccess < 0.2
                deviation = deviation*deviationShift;
            end
            reevalutionCount = 0;
            successfulMutationCount = 0;
        end
        for i=1:dimensions
            value = individualVector(i);
            if rand < mutationRate
                value = value + deviation*randn();
                mutated = true;
            end
            mutatedVector = [mutatedVector value];
        end
        mutatedVector = saturationFunction(interval, mutatedVector);
        if(mutated == true)
            reevalutionCount = reevalutionCount + 1;
            if(optimisationFunction(mutatedVector) < optimisationFunction(individualVector))
                successfulMutationCount = successfulMutationCount + 1;
            end
        end
        mutatedPopulation = [mutatedPopulation mutatedVector];
        mutatedDevVector = [mutatedDevVector deviation];
        newReevalutionCounter = [newReevalutionCounter reevalutionCount];
        newSuccessfulMutationCounter = [newSuccessfulMutationCounter successfulMutationCount];
    end
    children = [];
    childrenDeviation = [];
    childrenReevaluationCounter = [];
    childrenSuccessfulMutationCounter = [];
    for i=1:numberOfChildren
        selectRandomParentIndex1 = randi(populationSize);
        selectRandomParentIndex2 = randi(populationSize);
        [individualVector1, deviation1, reevalutionCount1, successfulMutationCount1] = GetPopulationVectorES(population, populationDeviation, selectRandomParentIndex1, dimensions, newReevalutionCounter, newSuccessfulMutationCounter);
        [individualVector2, deviation2, reevalutionCount2, successfulMutationCount2] = GetPopulationVectorES(population, populationDeviation, selectRandomParentIndex2, dimensions, newReevalutionCounter, newSuccessfulMutationCounter);
        child = (individualVector1 + individualVector2)/2;
        childDeviation = (deviation1 + deviation2)/2;
        children = [children child];
        childrenDeviation = [childrenDeviation childDeviation];
        childrenReevaluationCounter = [childrenReevaluationCounter 0];
        childrenSuccessfulMutationCounter = [childrenSuccessfulMutationCounter 0];
    end
    sortingMatrix = [];
    for i=1:populationSize
        [individualVector, deviation, reevalutionCount, successfulMutationCount] = GetPopulationVectorES(population, populationDeviation, i, dimensions, newReevalutionCounter, newSuccessfulMutationCounter);
        sortingMatrix = [sortingMatrix; individualVector, optimisationFunction(individualVector) deviation reevalutionCount successfulMutationCount];
    end
    for i=1:numberOfChildren
        [individualVector, deviation, reevalutionCount, successfulMutationCount] = GetPopulationVectorES(children, childrenDeviation, i, dimensions, childrenReevaluationCounter, childrenSuccessfulMutationCounter);
        sortingMatrix = [sortingMatrix; individualVector, optimisationFunction(individualVector) deviation reevalutionCount successfulMutationCount];
    end
    sortedIndex = [(dimensions + 1)];
    sortedMatrix = sortrows(sortingMatrix, sortedIndex);
    population = [];
    populationDeviation = [];
    reevalutionCounter = [];
    successfulMutationCounter = [];
    for i=1:populationSize
        population = [population sortedMatrix(i, 1:dimensions)];
        populationDeviation = [populationDeviation sortedMatrix(i, dimensions+2)];
        reevalutionCounter = [reevalutionCounter sortedMatrix(i, dimensions+3)];
        successfulMutationCounter = [successfulMutationCounter sortedMatrix(i, dimensions+4)];
    end
end
bestFitness = [];
bestVector = [];
for i=1:populationSize
    [individualVector, deviation, reevalutionCount, successfulMutationCount] = GetPopulationVectorES(population, populationDeviation, i, dimensions, reevalutionCounter, successfulMutationCounter);
    indFitness = optimisationFunction(individualVector);
    if(isempty(bestFitness) || indFitness < bestFitness)
        bestFitness = indFitness;
        bestVector = individualVector;
    end
end
evolutionaryStrategyVector = bestVector;
fitness = bestFitness;
end