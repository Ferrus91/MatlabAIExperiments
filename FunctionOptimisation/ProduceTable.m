function [sAlgoFitness, simulatedAnnealingFitness, geneticAlgorithmFitness, evolutionaryStrategyFitness, particleSwarmOptimisationFitness, differentialEvolutionFitness, memeticFitness] = ProduceTable(dimensions)
    salgoFitness = []
    simulatedAnnealingFitness = [];
    geneticAlgorithmFitness=[]
    evolutionaryStrategyFitness=[]
    particleSwarmOptimisationFitness = []
    differentialEvolutionFitness = []
    memeticFitness = []
    for i=1:30
    [vector, fitness] = SAlgorithm(dimensions, [-5.12, 5.12], @DeJong, @ToroidalBoundSaturate, 10000)
        [salgoFitness, fitness]
    end
        for i=1:30
            [vector, fitness] = SAlgorithm(dimensions, [-5.12, 5.12], @Rastrigin, @ToroidalBoundSaturate, 10000)
    [salgoFitness, fitness]
    end
        for i=1:30
[vector, fitness] = SAlgorithm(dimensions, [-500, 500], @Schwefel, @ToroidalBoundSaturate, 10000)
       [salgoFitness,fitness]
        end
        for i=1:30
[vector, fitness] = SAlgorithm(dimensions, [0, pi], @Michalewicz, @ToroidalBoundSaturate, 10000)
       [salgoFitness, fitness]
        end
    for i=1:30
	[vector, fitness] = SimulatedAnnealing(dimensions, [-5.12, 5.12], @DeJong, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10000)
        [simulatedAnnealingFitness, fitness]
    end
        for i=1:30
	[vector, fitness] = SimulatedAnnealing(dimensions, [-500, 500], @Rastrigin, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10000)
        [simulatedAnnealingFitness, fitness]
    end
        for i=1:30
	[vector, fitness] = SimulatedAnnealing(dimensions, [-500, 500], @Schwefel, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10000)
               [simulatedAnnealingFitness, fitness]

        end
        for i=1:30
  [vector, fitness] = SimulatedAnnealing(dimensions, [0, pi], @Michalewicz, @ToroidalBoundSaturate, 10000, 0.9, 1000, 0.999, 10000)
       [simulatedAnnealingFitness, fitness]
        end
          for i=1:30
        [geneticAlgorithmVector, fitness]  = GeneticAlgorithm(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 10, 0.05, 0.1, 0.01, 100)
        [geneticAlgorithmFitness, fitness]
    end
        for i=1:30
   [geneticAlgorithmFitness, fitness]  = GeneticAlgorithm(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 50, 0.05, 0.1, 0.1, 100)
          [geneticAlgorithmFitness, fitness]
        end
        for i=1:30
   [geneticAlgorithmVector, fitness]  = GeneticAlgorithm(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 100, 0.2, 0.2, 0.1, 100)
               [geneticAlgorithmFitness, fitness]

        end
        for i=1:30
  [geneticAlgorithmVector, fitness]  = GeneticAlgorithm(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 100, 0.05, 0.05, 0.01, 100)
       [geneticAlgorithmFitness, fitness]
        end
       for i=1:30
[evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 100, 100, 1, 1, 1, 5, 100)
        [evolutionaryStrategyFitness, fitness]
    end
        for i=1:30
[evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 100, 100, 1, 1, 1, 5, 100)
                 [evolutionaryStrategyFitness, fitness]
        end
        for i=1:30
   [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 100, 100, 1, 1, 1, 5, 100)
               [evolutionaryStrategyFitness, fitness]

        end
        for i=1:30
  [evolutionaryStrategyVector, fitness]  = EvolutionaryStrategy(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 100, 100, 1, 1, 1, 5, 100)
       [evolutionaryStrategyFitness, fitness]
        end
          for i=1:30
		 [particleSwarmOptimisation, fitness]  = ComprehensiveLearningParticleSwarmOptimisation(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 100, 2.5, 0.3, 0.7, 0.05, 100)
        [particleSwarmOptimisationFitness, fitness]
    end
        for i=1:30
	[particleSwarmOptimisation, fitness]  = ComprehensiveLearningParticleSwarmOptimisation(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 100, 2.5, 0.3, 0.7, 0.05, 100)
        [particleSwarmOptimisationFitness, fitness]
        end
                        for i=1:30
[particleSwarmOptimisation, fitness]  = ComprehensiveLearningParticleSwarmOptimisation(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 100, 250, 0.3, 0.7, 0.05, 100)
       [particleSwarmOptimisationFitness, fitness]
                        end
                for i=1:30
  [particleSwarmOptimisation, fitness]  = ComprehensiveLearningParticleSwarmOptimisation(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 100, 3.14, 0.3, 0.7, 0.05, 100)
       [particleSwarmOptimisationFitness, fitness]
                end
             for i=1:30
[adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolution(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 100, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 100)
        [differentialEvolutionFitness, fitness]
    end
        for i=1:30
[adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolutiond(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 100, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 100)
        [differentialEvolutionFitness, fitness]
        end
                        for i=1:30
[adaptiveDifferentialEvolutionVector, fitness]  = AdaptiveDifferentialEvolution(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 100, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 100)
       [differentialEvolutionFitness, fitness]
                        end
                for i=1:30
[adaptiveDifferentialEvolutionVector3, fitness]  = AdaptiveDifferentialEvolution(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 100, 0.1, 0.9, 0.1, 0.1, @BinaryCrossOverFunction, 100)
       [differentialEvolutionFitness, fitness]
                end
                          for i=1:30
                              [memeticAlgorithmVector, fitness]  = MemeticAlgorithm(dimensions, [-5.12 5.12], @DeJong, @ToroidalBoundSaturate, 5, 1, 1, 0.01, 0.8, 5, 25);
                                memeticAlgorithmVector
                              [memeticFitness, fitness]

    end
        for i=1:30
[memeticAlgorithmVector, fitness]  = MemeticAlgorithm(dimensions, [-5.12 5.12], @Rastrigin, @ToroidalBoundSaturate, 5, 1, 1, 0.01, 0.8, 5, 25);
            memeticAlgorithmVector     
[memeticFitness, fitness]
        end
                        for i=1:30
[memeticAlgorithmVector, fitness]  = MemeticAlgorithm(dimensions, [-500 500], @Schwefel, @ToroidalBoundSaturate, 5, 1, 1, 0.01, 0.8, 5, 25);
       [memeticFitness, fitness]
                        end
                for i=1:30
[memeticAlgorithmVector, fitness]  = MemeticAlgorithm(dimensions, [0 pi], @Michalewicz, @ToroidalBoundSaturate, 10, 1, 1, 0.01, 0.8, 5, 25);
       [memeticFitness, fitness]
                end
                
                end