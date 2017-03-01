function [sAlgoFitness] = ProduceTableSal(dimensions)
    sAlgoFitness = []
    for i=1:30
        i
    [vector, fitness] = SAlgorithm(dimensions, [-5.12, 5.12], @DeJong, @ToroidalBoundSaturate, 100)
      sAlgoFitness =  [sAlgoFitness, fitness]
    end
        for i=1:30
            i
            [vector, fitness] = SAlgorithm(dimensions, [-5.12, 5.12], @Rastrigin, @ToroidalBoundSaturate, 100)
    sAlgoFitness = [sAlgoFitness, fitness]
    end
        for i=1:30
            i
[vector, fitness] = SAlgorithm(dimensions, [-500, 500], @Schwefel, @ToroidalBoundSaturate, 100)
     sAlgoFitness =  [sAlgoFitness,fitness]
        end
        for i=1:30
            i
[vector, fitness] = SAlgorithm(dimensions, [0, pi], @Michalewicz, @ToroidalBoundSaturate, 100)
   sAlgoFitness =    [sAlgoFitness, fitness]
        end
end