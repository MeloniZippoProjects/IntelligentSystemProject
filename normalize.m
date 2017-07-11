function [ normalized ] = normalize( to_normalize )
    input_std = std(to_normalize);
    input_mean = mean(to_normalize);

    normalized.values = ( to_normalize - input_mean)/input_std;
    normalized.std = input_std;
    normalized.mean = input_mean;
end

