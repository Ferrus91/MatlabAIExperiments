function  simulatedAnnealingFitness = ProduceTableSimAn(dimensions)
simulatedAnnealingFitness = []
for i=1:30
    i
[vector, fitness] = SimulatedAnnealing(dimensions, [-5.12, 5.12], @DeJong, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10)
simulatedAnnealingFitness= [simulatedAnnealingFitness, fitness]
end
for i=1:30
    i
    [vector, fitness] = SimulatedAnnealing(dimensions, [-500, 500], @Rastrigin, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10)
  simulatedAnnealingFitness =  [simulatedAnnealingFitness, fitness]
end
for i=1:30
    i
    [vector, fitness] = SimulatedAnnealing(dimensions, [-500, 500], @Schwefel, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10)
 simulatedAnnealingFitness =   [simulatedAnnealingFitness, fitness]
    
end
for i=1:30
    i
    [vector, fitness] = SimulatedAnnealing(dimensions, [0, pi], @Michalewicz, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10)
  simulatedAnnealingFitness =  [simulatedAnnealingFitness, fitness]
end
end