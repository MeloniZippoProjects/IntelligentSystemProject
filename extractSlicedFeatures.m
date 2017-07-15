function [ output_struct ] = extractSlicedFeatures( input_cell, timestamps, samplingFactor )

    output_struct = struct();
    
    cellSize = size(input_cell, 2);
    
    integral_vec = zeros(cellSize, samplingFactor);
    std_vec = zeros(cellSize, samplingFactor);
    mean_vec = zeros(cellSize, samplingFactor);
    median_vec = zeros(cellSize, samplingFactor);
    incRatio_vec = zeros(cellSize, samplingFactor);
    midPoints_vec = zeros(cellSize, samplingFactor);
    timeAverage_vec = zeros(cellSize, samplingFactor);
        
    for cellIdx = 1 : cellSize
        
        currVector = input_cell{cellIdx};
        currTimes = timestamps{cellIdx};
        
        integral_vec(cellIdx, :) = normalizedIntegration(currVector, currTimes, samplingFactor);
        currSize = size(currVector,1);
                
        
        sampleSize = floor(currSize/samplingFactor);      
        
        for sampleIdx = 1 : samplingFactor
        
            idxA = (sampleIdx -  1)*sampleSize +1;
            idxB = (sampleIdx)*sampleSize;
            
            std_vec(cellIdx, sampleIdx) = std(currVector(idxA:idxB));
            mean_vec(cellIdx, sampleIdx) = mean(currVector(idxA:idxB));
            median_vec(cellIdx, sampleIdx) = median(currVector(idxA:idxB));
            
            timeElapsed = currTimes(idxB) - currTimes(idxA);
            incRatio_vec(cellIdx, sampleIdx) = (currVector(idxB) - currVector(idxA))/timeElapsed;
            
            midPoints_vec(cellIdx, sampleIdx) = (currTimes(idxA) + currTimes(idxB))/2;
            
            %timeIntervals(cellIdx, sampleIdx) = currTimes(2:currSize) - currTimes(1:currSize-1);
            timeIntervals = currTimes(idxA+1:idxB) - currTimes(idxA:idxB-1);
            timeAverage_vec(cellIdx, sampleIdx) = sum( currVector(idxA:idxB-1).*timeIntervals(1:sampleSize-1) ) / ( currTimes(sampleSize) - currTimes(1) );
        
            
        end
    end
    
    output_struct.integral = integral_vec;
    output_struct.std = std_vec;
    output_struct.mean = mean_vec;
    output_struct.median = median_vec;
    output_struct.incRatio = incRatio_vec;
    output_struct.midPoints = midPoints_vec;
    output_struct.timeAvg = timeAverage_vec;

end
