function trainResult = validateNN(net, validationEntries, validationResults, numRows)
    localValidationFile = transpose(validationEntries(1:numRows,:));
    localValidationResult = transpose(validationResults(1:numRows,:));
    minMaxVal = minmax(localValidationFile) ;
    output = net(localValidationFile);
    trainResult = mean((output-localValidationResult).^2);
    clear localValidationFile localValidationResult output;
end