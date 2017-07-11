function [ output_struct ] = extractFeature( input_cell )

    output_struct = struct();
    
    cellSize = size(input_cell, 2);
    
    std_vec = zeros(1,cellSize);
    mean_vec = zeros(1,cellSize);
    median_vec = zeros(1,cellSize);
    
    
    for cellIdx = 1 : cellSize
        
        currVector = input_cell{cellIdx};
        
        std_vec(cellIdx) = std(currVector);
        mean_vec(cellIdx) = mean(currVector);
        median_vec(cellIdx) = median(currVector);
        
    end
    
    output_struct.std = std_vec;
    output_struct.mean = mean_vec;
    output_struct.median = median_vec;

end

