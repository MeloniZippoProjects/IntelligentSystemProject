function [ output_struct ] = extractSlicedFeature( input_cell, samplingFactor )

    output_struct = struct();
    
    cellSize = size(input_cell, 2);
    
    std_vec = zeros(cellSize, samplingFactor);
    mean_vec = zeros(cellSize, samplingFactor);
    median_vec = zeros(cellSize, samplingFactor);
    
    
    for cellIdx = 1 : cellSize
        
        currVector = input_cell{cellIdx};
        
        currSize = size(currVector);
        
        sampleSize = ceil(currSize/samplingFactor);        
        
        
        std_vec(cellIdx) = std(currVector);
        mean_vec(cellIdx) = mean(currVector);
        median_vec(cellIdx) = median(currVector);
        
    end
    
    output_struct.std = std_vec;
    output_struct.mean = mean_vec;
    output_struct.median = median_vec;

end
