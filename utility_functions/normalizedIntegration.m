function [ normalizedIntegrationVector ] = normalizedIntegration( dataVector, timeStamps, timeSlices )
    integrationVector = zeros(timeSlices,1);
    
    n = size(dataVector, 1);
    sliceSize = floor(n/timeSlices);
    
    timeDistances = zeros(n, 1);
    timeDistances(1:n-1) = timeStamps(2:n) - timeStamps(1:n-1);
    timeDistances(n) = timeDistances(n-1);
    
    normalizedDataVector = (dataVector-mean(dataVector))/std(dataVector);
    
    for timeSlice = 1:timeSlices
        startIdx = (timeSlice - 1)*sliceSize + 1;
        endIdx = timeSlice*sliceSize;
        integrationVector(timeSlice) = sum( normalizedDataVector(startIdx:endIdx).*timeDistances(startIdx:endIdx) );
    end
    
    integralMean = mean(integrationVector);
    integralStd = std(integrationVector);
    
    normalizedIntegrationVector = (integrationVector - integralMean) / integralStd;
    
%     figure();
%     hold on
%     plot(timeStamps, (dataVector-mean(dataVector))/std(dataVector));
%     plot(timeStamps, zeros(n));
end

