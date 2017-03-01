function [simulatedAnnealingVector, fitness, movingFitness] =  SimulatedAnnealing(dimensions, interval, optimisationFunction, saturationFunction, maxTemperature, coolingRate, perturbationCoefficient, perturbationDecrease, compBudget)
bestVector = RandomVector(dimensions, interval);
bestResult = optimisationFunction(bestVector);
allTimeBestVector = bestVector;
allTimeBestResult = bestResult;
temperature = maxTemperature;
movingFitness = [];

for k=1:compBudget
    perturbationInterval = [-perturbationCoefficient perturbationCoefficient];
    RandomPerturbationVector = RandomVector(dimensions, perturbationInterval);
    newVector = bestVector +  RandomPerturbationVector;
    newVector=saturationFunction(interval,newVector);
    result = optimisationFunction(newVector);
    if(result < bestResult)
        bestVector = newVector;
        bestResult = result;
    else
        if(rand() < AcceptanceProbability(bestResult, result, temperature))
            bestVector = newVector;
            bestResult = result;
        end
    end
movingFitness = [movingFitness bestResult];

    if(bestResult < allTimeBestResult)
        allTimeBestVector = bestVector;
        allTimeBestResult = bestResult;
    end
    simulatedAnnealingVector = allTimeBestVector;
    fitness = allTimeBestResult;
    temperature=temperature*coolingRate;
   perturbationCoefficient=perturbationCoefficient*perturbationDecrease;
end
end

function acceptanceProbability=AcceptanceProbability(currentBest, perturbed, temperature)
acceptanceProbability = exp((currentBest-perturbed)/temperature);
end