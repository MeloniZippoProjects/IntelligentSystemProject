source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'}; % 'dati_cattivi'};
target_folder = 'features_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

samplingFactor = 8;

root = pwd;

for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   load('data.mat')
   
   for orientation = orientations
        table = struct();
        table.power_std = zeros(60,samplingFactor);
        table.power_mean = zeros(60,samplingFactor);
        table.power_median = zeros(60,samplingFactor);
        table.phase_std = zeros(60,samplingFactor);
        table.phase_mean = zeros(60,samplingFactor);
        table.phase_median = zeros(60,samplingFactor);
        table.out_isStatic = zeros(60,1);
               
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

        table.phase_std(idx,:) = phaseFeatures.std;
        table.phase_mean(idx,:) = phaseFeatures.mean;
        table.phase_median(idx,:) = phaseFeatures.median;
        table.phase_incRatio(idx,:) = phaseFeatures.incRatio;
        table.phase_midPoints(idx,:) = phaseFeatures.midPoints;
        
        table.out_isStatic(idx) = 1;

        %Dynamic case
		baseIdx = 31;        
        for dynamicCase = dynamicCases
	        powerFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).power, data.dynamic.(orientation).(dynamicCase).timestamps, samplingFactor);
            phaseFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).phase, data.dynamic.(orientation).(dynamicCase).timestamps, samplingFactor);

            idx = baseIdx : baseIdx + 9; 
            table.power_std(idx,:) = powerFeatures.std;
            table.power_mean(idx,:) = powerFeatures.mean;
            table.power_median(idx,:) = powerFeatures.median;
            table.power_incRatio(idx,:) = powerFeatures.incRatio;
            table.power_midPoints(idx,:) = powerFeatures.midPoints;

            table.phase_std(idx,:) = phaseFeatures.std;
            table.phase_mean(idx,:) = phaseFeatures.mean;
            table.phase_median(idx,:) = phaseFeatures.median;
            table.phase_incRatio(idx,:) = phaseFeatures.incRatio;
            table.phase_midPoints(idx,:) = phaseFeatures.midPoints;

            table.out_isStatic(idx) = 0;
        end
   
       dest_folder = fullfile(root, target_folder, subfolder);
       mkdir(dest_folder{1});

       save(fullfile(dest_folder{1}, ['trainingSlicedSet_SvD_', orientation, '.mat']), 'table');
   end
   
   cd(root);
end