function [net, trainResult] = createNN(trainingFile, trainingResults, numRows, inputEpochs, passes, learningRate, goal, topology, activationCells, trainingDefiniton, learningFunction, errorType)
    localTrainingFile = transpose(trainingFile(1:numRows,:));
    localTrainingResult = transpose(trainingResults(1:numRows,:));
    minMaxVal = minmax(localTrainingFile) ;
    net = newff(minMaxVal,topology, activationCells, trainingDefiniton, learningFunction, errorType);
    net.trainParam.epochs = inputEpochs;
    net.trainParam.passes=passes; 
    net.trainParam.lr=learningRate; 
    net.trainParam.goal=goal;
    net = train(net, localTrainingFile, localTrainingResult);
    output = sim(net, localTrainingFile) ;
    trainResult = mean((output-localTrainingResult).^2);
    clear localTrainingFile localTrainingResult output;
end