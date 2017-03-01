function [GreedyDescentVector, fitness] =  GreedyDescentSearch(dimensions, interval, optimisationFunction, saturationFunction, individualSearchRadius, intensity, startVector)
for i=1:compBudget
    for i=1:intensity
        neighbourBall = individualSearchRadius*rand(dimensions,1);
        neighbour = neighbour + startVector;
        neighbours = [neighbours; neighbour];
    end
    
bestFitness = [];
bestPosition = [];
for i=1:intensity
    if ismember(A,B,'rows') 
    populationVector = populationMatrix(i,:);
    fitness = optimisationFunction(populationVector);
    if isempty(bestFitness) || fitness < bestFitness
        bestFitness = fitness;
        bestPosition = populationVector;
    end
end

end
end