function [out_vec] = expavg(in_vec, a)
    n = size(in_vec, 1);
    out_vec = zeros(n, 1);
    
    out_vec(1) = in_vec(1);
    for idx = 2 : n 
        out_vec(idx) = a*in_vec(idx) + (1 - a)*out_vec(idx-1);
    end
end