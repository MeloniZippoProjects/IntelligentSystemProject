function [ ] = plotSignal( input_struct, label )

    %plot power
    power_cells = input_struct.power;
    time_cells = input_struct.timestamps;
    
    for idx = 1 : size(power_cells,2)
        power = power_cells{idx};
        time = time_cells{idx};
        name = ['Power ', label];
        figure('Name', name);
        plot(time, power, 'DisplayName', name);
    end
    
    phase_cells = input_struct.phase;
    
    for idx = 1 : size(phase_cells,2)
        power = phase_cells{idx};
        time = time_cells{idx};
        name = ['Phase ', label];
        figure('Name', name);
        plot(time, power, 'DisplayName', name);
    end
    
end

