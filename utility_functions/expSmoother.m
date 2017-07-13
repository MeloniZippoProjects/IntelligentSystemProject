function [out_struct] = expSmoother(in_struct)
    n = size(in_struct, 2);
    out_struct = cell(1,n);
    for sample_idx = 1:n
        out_struct{sample_idx} = expavg(in_struct{sample_idx}, 0.2);
    end
end