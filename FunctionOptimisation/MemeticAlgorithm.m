function [memeticAlgorithmVector, fitness, movingFitness] =  MemeticAlgorithm(dimensions, interval, optimisationFunction, saturationFunction, populationSize, mutationRate, crossoverRate, deviationShift, explorationCoefficient, localSearchIntensity, compBudget)
population = [];
movingFitness = [];
populationDeviations = [];
fitnessVector = [];
standardDeviationInterval = [0 1];
for i=1:populationSize
    individualVector = RandomVector(dimensions, interval);
    deviationVector = RandomVector(dimensions, standardDeviationInterval);
    population = [population; individualVector];
    populationDeviations = [populationDeviations; deviationVector];
end
for k=1:compBudget
    movingFitness = [movingFitness max(fitnessVector)]
    postMatingPopulationSize = populationSize;
    fitnessVector = [];
    rouletteProbability = [];
    sumFitness = 0;
    fitnessVector = [];
    for i=1:populationSize
        individualVector = population(i,:);
        fitness = optimisationFunction(individualVector);
        fitnessVector = [fitnessVector fitness];
    end
    totalFitness = sum(fitnessVector);
    for i=1:populationSize
        sumFitness = sumFitness + fitnessVector(i)/totalFitness;
        rouletteProbability = [rouletteProbability sumFitness];
    end
    mutatedPopulation = [];
    mutatedPopulationDeviations = [];
    for i=1:populationSize
        individualVector = population(i,:);
        deviationVector = populationDeviations(i,:);
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
        mutatedPopulation = [mutatedPopulation; mutatedIndVector];
        mutatedPopulationDeviations = [mutatedPopulationDeviations; mutatedDevVector];
    end
    matingPool = [];
    matingPoolDeviation= [];
    for i=1:populationSize
        random = rand();
        selectRandomParentIndex = min(find(rouletteProbability > random));
        individualVector = mutatedPopulation(i,:);
        deviationVector = mutatedPopulationDeviations(i,:);
        matingPool = [matingPool; individualVector];
        matingPoolDeviation = [matingPoolDeviation; deviationVector];
    end
    for i=1:2:populationSize
        individualVector1 = mutatedPopulation(i,:);
        deviationVector1 = mutatedPopulationDeviations(i,:);
        if i == populationSize
                    individualVector2 = mutatedPopulation(i,:);
            deviationVector2 = mutatedPopulationDeviations(i,:);
        else
                    individualVector2 = mutatedPopulation(i+1,:);
            deviationVector2 = mutatedPopulationDeviations(i+1,:);
        end
        newIndividual1 = [];
        newIndividual2 = [];
        newDeviation1 = [];
        newDeviation2 = [];
        for m=1:dimensions
            if rand < crossoverRate
                newIndividual1 = [newIndividual1 individualVector2(m)];
                newIndividual2 = [newIndividual2 individualVector1(m)];
                newDeviation1 = [newDeviation1 deviationVector2(m)];
                newDeviation2 =  [newDeviation2 deviationVector1(m)];
            else
                newIndividual1 = [newIndividual1 individualVector1(m)];
                newIndividual2 = [newIndividual2 individualVector2(m)];
                newDeviation1 = [newDeviation1 deviationVector1(m)];
                newDeviation2 =  [newDeviation2 deviationVector2(m)];
            end
        end
        population = [population; newIndividual1; newIndividual2];
        populationDeviations = [populationDeviations; newDeviation1; newDeviation2];
        postMatingPopulationSize = postMatingPopulationSize + 2;
    end
    lamarckianPopulation= [];
    for i=1:postMatingPopulationSize
        individual = population(i,:);
        deviation = populationDeviations(i,:);
        searchHoningFactor = exp(-0.25/explorationCoefficient*(k+1)/(compBudget+1));
        if randn < explorationCoefficient
            [newIndividual, newFitness] = SimulatedAnnealingLocalSearch(dimensions, interval, optimisationFunction, saturationFunction, searchHoningFactor*1000, 0.99, 1000, 0.01, individual, localSearchIntensity);
        else
            [newIndividual, newFitness] =  SAlgorithmSearch(dimensions, interval, optimisationFunction, saturationFunction, individual, searchHoningFactor, localSearchIntensity);
        end
        lamarckianPopulation = [lamarckianPopulation; newIndividual deviation newFitness];
    end
    sortRow = dimensions*2 + 1;
    darwinianPopulation = sortrows(lamarckianPopulation, sortRow);
    population = darwinianPopulation(1:populationSize, 1:dimensions);
    populationDeviation = darwinianPopulation(1:populationSize, dimensions+1:dimensions*2);
end

memeticAlgorithmVector = population(1,:);
fitness = optimisationFunction(memeticAlgorithmVector);
end