source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'}; %'dati_cattivi'};
target_folder = 'features_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

%samplingFactor = 8;

root = pwd;

for subfolder_idx = 1 : size(subfolders, 1)
    subfolder = subfolders(subfolder_idx);

    curr_source_folder = fullfile(root, source_folder, subfolder);
    cd(curr_source_folder{1});
    load('data.mat')

   
    for orientation = orientations
        table = struct();
        table.power = zeros(60, samplingFactor);
        table.phase = zeros(60, samplingFactor);
        table.out_isStatic = zeros(60,1);
        table.out_dynamicCase = zeros(60,3);
        %Static case
        if orientation == 'H'
            idx = 1:30;
        else
            idx = 31:60;
        end
        
        powerFeatures = extractSlicedFeatures(data.static.power(idx), data.static.timestamps(idx), samplingFactor);
        phaseFeatures = extractSlicedFeatures(data.static.phase(idx), data.static.timestamps(idx), samplingFactor);
        
        idx = 1:30;
        table.power_std(idx,:) = powerFeatures.std;
        table.power_mean(idx,:) = powerFeatures.mean;
        table.power_median(idx,:) = powerFeatures.median;
        table.power_incRatio(idx,:) = powerFeatures.incRatio;
        table.power_midPoints(idx,:) = powerFeatures.midPoints;
        table.power_integral(idx,:) = powerFeatures.integral;

        table.phase_std(idx,:) = phaseFeatures.std;
        table.phase_mean(idx,:) = phaseFeatures.mean;
        table.phase_median(idx,:) = phaseFeatures.median;
        table.phase_incRatio(idx,:) = phaseFeatures.incRatio;
        table.phase_midPoints(idx,:) = phaseFeatures.midPoints;
        table.phase_integral(idx,:) = phaseFeatures.integral;
        
        table.out_isStatic(idx) = 1;
        table.out_dynamicCase(idx,:) = [ones(30,1)*-1, ones(30,1)*-1, ones(30,1)*-1];
            
        %Dynamic case
        baseIdx = 31;       
        for dynamicCase = dynamicCases
                powerFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).power, data.dynamic.(orientation).(dynamicCase).timestamps, samplingFactor);
                phaseFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).phase, data.dynamic.(orientation).(dynamicCase).timestamps, samplingFactor);

                idx = baseIdx : baseIdx + 9;
                table.power_integral(idx,:) = powerFeatures.integral;
                table.power_std(idx,:) = powerFeatures.std;
                table.power_mean(idx,:) = powerFeatures.mean;
                table.power_median(idx,:) = powerFeatures.median;
                table.power_incRatio(idx,:) = powerFeatures.incRatio;
                table.power_midPoints(idx,:) = powerFeatures.midPoints;
                table.power_timeAvg(idx,:) = powerFeatures.timeAvg;
                
                table.phase_integral(idx,:) = phaseFeatures.integral;
                table.phase_std(idx,:) = phaseFeatures.std;
                table.phase_mean(idx,:) = phaseFeatures.mean;
                table.phase_median(idx,:) = phaseFeatures.median;
                table.phase_incRatio(idx,:) = phaseFeatures.incRatio;
                table.phase_midPoints(idx,:) = phaseFeatures.midPoints;
                table.phase_timeAvg(idx,:) = phaseFeatures.timeAvg;

                out_dynamic = [-1,-1,-1];
                if dynamicCase == 'I'
                    out_dynamic = [1,0,0];
                elseif dynamicCase == 'U'
                    out_dynamic = [0,1,0];
                elseif dynamicCase == 'P'
                    out_dynamic = [0,0,1];
                end

                table.out_isStatic(idx) = 0;
                table.out_dynamicCase(idx,:) = [ones(10,1)*out_dynamic(1), ones(10,1)*out_dynamic(2), ones(10,1)*out_dynamic(3)];

                baseIdx = baseIdx + 10;
        end
       dest_folder = fullfile(root, target_folder, subfolder);
       mkdir(dest_folder{1});

       save(fullfile(dest_folder{1}, ['trainingSlicedSet_', orientation, '.mat']), 'table');
    end
end
   
cd(root);