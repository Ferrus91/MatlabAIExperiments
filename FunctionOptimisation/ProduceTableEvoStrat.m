function [evolutionaryStrategyFitness] = ProduceTableEvoStrat(dimensions)
evolutionaryStrategyFitness= [];
for i=1:30
i
    [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 10, 100, 1, 1, 1, 5, 10)
 evolutionaryStrategyFitness =   [evolutionaryStrategyFitness, fitness]
end
for i=1:30
i
    [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 10, 100, 1, 1, 1, 5, 10)
   evolutionaryStrategyFitness = [evolutionaryStrategyFitness, fitness]
end
for i=1:30
i
    [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 10, 100, 1, 1, 1, 5, 10)
 evolutionaryStrategyFitness =   [evolutionaryStrategyFitness, fitness]
    
end
for i=1:30
i
    [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 10, 100, 1, 1, 1, 5, 10)
    evolutionaryStrategyFitness = [evolutionaryStrategyFitness, fitness]
end
end