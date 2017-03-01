function [simulatedAnnealingVector, fitness] =  SimulatedAnnealingLocalSearch(dimensions, interval, optimisationFunction, saturationFunction, maxTemperature, coolingRate, perturbationCoefficient, perturbationDecrease, startVector, compBudget)
bestVector = startVector;
bestResult = optimisationFunction(bestVector);
allTimeBestVector = bestVector;
allTimeBestResult = bestResult;
temperature = maxTemperature;

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