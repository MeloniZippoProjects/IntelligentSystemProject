function [ ] = plotSignal( input_struct, label)
    power_cells = input_struct.power;
    phase_cells = input_struct.phase;
    time_cells = input_struct.timestamps;
    
    parfor idx = 1 : size(power_cells,2)
        power = power_cells{idx};
        time = time_cells{idx};
        name = ['Power ', label, ' ', num2str(idx)];
        fig = figure();
        plot(time, power, 'DisplayName', name);
        saveas(fig, [name, '.png']);
        close(fig);
    end
    
    parfor idx = 1 : size(phase_cells,2)
        phase = phase_cells{idx};
        time = time_cells{idx};
        name = ['Phase ', label, ' ', num2str(idx)];
        fig = figure();
        plot(time, phase, 'DisplayName', name);
        saveas(fig, [name, '.png']);
        close(fig)
    end
    
end

