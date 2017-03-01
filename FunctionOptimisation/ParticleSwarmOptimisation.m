function [particleSwarmOptimisation, fitness, movingFitness] =  ParticleSwarmOptimisation(dimensions, interval, optimisationFunction, saturationFunction, numberOfParticles, maxVelocity, localOptimumCoefficient, globalOptimumCoefficient, inertiaMax, inertiaMin, compBudget)
globalBestVector = [];
globalBestFitness = [];
movingFitness = [];
localBestPositions = [];
localBestFitnesses = [];
particles = [];
particleVelocities = [];
velocityInterval = [-maxVelocity/3, maxVelocity/3];
inertia = inertiaMax;

for i=1:numberOfParticles
    particleVector = RandomVector(dimensions, interval);
    velocityVector = RandomVector(dimensions, velocityInterval);
    particles = [particles; particleVector];
    localBestPositions = [localBestPositions; particleVector];
    particleVelocities = [particleVelocities; velocityVector];
    fitness = optimisationFunction(particleVector);
    localBestFitnesses = [localBestFitnesses fitness];
    if(isempty(globalBestVector) || fitness < globalBestFitness)
        globalBestFitness = fitness;
        globalBestVector = particleVector;
    end
end

newGlobalBestVector = globalBestVector;
newBestFitness = globalBestFitness;
newLocalBestPositions = localBestPositions;
newLocalBestFitnesses = localBestFitnesses;
newParticles = particles;
newParticleVelocities = particleVelocities;


for i=1:compBudget
    newGlobalBestVector = [];
    newBestFitness = [];
    newLocalBestPositions = [];
    newLocalBestFitnesses = [];
    newParticles = [];
    newParticleVelocities = [];
    
    for i=1:numberOfParticles
        newParticle = [];
        newParticleVelocity = [];
        for j=1:dimensions
            particleVelocityComponent = particleVelocities(i, j);
            particlePositionComponent = particles(i, j);
            newParticleVelocityComponent = inertia*particleVelocityComponent ...
                + localOptimumCoefficient*rand*(localBestPositions(i,j) - particlePositionComponent)  ...
                + globalOptimumCoefficient*rand*(globalBestVector(j) - particlePositionComponent);
            if newParticleVelocityComponent > maxVelocity
                newParticleVelocityComponent = maxVelocity;
            end
            particlePositionComponent = particlePositionComponent + newParticleVelocityComponent;
            newParticle = [newParticle particlePositionComponent];
            newParticleVelocity = [newParticleVelocity newParticleVelocityComponent];
        end
        newParticle = saturationFunction(interval, newParticle);
        fitness = optimisationFunction(newParticle);
        if fitness < localBestFitnesses(i)
            newLocalBestFitnesses = [newLocalBestFitnesses fitness];
            newLocalBestPositions = [newLocalBestPositions; newParticle];
        else
            newLocalBestFitnesses = [newLocalBestFitnesses localBestFitnesses(i)];
            newLocalBestPositions = [newLocalBestPositions; localBestPositions(i,:)];
        end
        if fitness < globalBestFitness
            globalBestFitness = fitness;
            globalBestPosition = newParticle;
        end
        newParticles = [newParticles; newParticle];
        newParticleVelocities = [newParticleVelocities; newParticleVelocity];
    end
    particles = newParticles;
    particleVelocities = newParticleVelocities;
    localBestFitnesses = newLocalBestFitnesses;
    localBestPositions = newLocalBestPositions;
    inertia = inertiaMax - ((inertiaMax - inertiaMin)*i)/i;
end
particleSwarmOptimisation = globalBestPosition;
fitness = globalBestFitness;
    movingFitness = [movingFitness fitness]
end
