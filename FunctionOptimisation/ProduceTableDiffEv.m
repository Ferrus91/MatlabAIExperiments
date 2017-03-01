function [differentialEvolutionFitness] = ProduceTableDiffEv(dimensions)
differentialEvolutionFitness = [];
for i=1:30
i
    [adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolution(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 10, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 10)
    differentialEvolutionFitness = [differentialEvolutionFitness, fitness]
end
for i=1:30
i
    [adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolution(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 10, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 10)
   differentialEvolutionFitness = [differentialEvolutionFitness, fitness]
end
for i=1:30
i
    [adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolution(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 10, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 10)
 differentialEvolutionFitness =   [differentialEvolutionFitness, fitness]
end
for i=1:30
i
    [adaptiveDifferentialEvolutionVector3, fitness]  = AdaptiveDifferentialEvolution(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 10, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 10)
  differentialEvolutionFitness =  [differentialEvolutionFitness, fitness]
end

end