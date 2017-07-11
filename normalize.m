function [ normalized ] = normalize( to_normalize )
    input_std = std(to_normalize);
    input_mean = mean(to_normalize);

    normalized = ( to_normalize - input_mean)/input_std;
end

