function [out_struct] = movSmoother(in_struct)
    n = size(in_struct, 2);
    out_struct = cell(1,n);
    for sample_idx = 1:n
        out_struct{sample_idx} = movmean(in_struct{sample_idx}, 15);
    end
end