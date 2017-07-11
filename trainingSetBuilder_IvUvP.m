source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'; 'dati_cattivi'};
target_folder = 'features_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

samplingFactor = 12;

root = pwd;

for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   load('data.mat')
   
   
    for orientation = orientations
        table = struct();
        table.power_std = zeros(30,samplingFactor);
        table.power_mean = zeros(30,samplingFactor);
        table.power_median = zeros(30,samplingFactor);
        table.phase_std = zeros(30,samplingFactor);
        table.phase_mean = zeros(30,samplingFactor);
        table.phase_median = zeros(30,samplingFactor);
        table.out = zeros(30,3);
            
        
            

        %Dynamic case
        baseIdx = 1;        
        for dynamicCase = dynamicCases
                powerFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).power);
                phaseFeatures = extractSlicedFeatures(data.dynamic.(orientation).(dynamicCase).phase);

                idx = baseIdx : baseIdx + 9; 
                table.power_std(idx) = powerFeatures.std;
                table.power_mean(idx) = powerFeatures.mean;
                table.power_median(idx) = powerFeatures.median;
                table.phase_std(idx) = phaseFeatures.std;
                table.phase_mean(idx) = phaseFeatures.mean;
                table.phase_median(idx) = phaseFeatures.median;

                val = [-1,-1,-1];
                if dynamicCase == 'I'
                    val = [1,0,0];
                elseif dynamicCase == 'U'
                    val = [0,1,0];
                elseif dynamicCase == 'P'
                    val = [0,0,1];
                end


                table.out(idx,:) = ones(10,3).* val;

                baseIdx = baseIdx + 10;
        end
    end
       dest_folder = fullfile(root, target_folder, subfolder);
       mkdir(dest_folder{1});

       save(fullfile(dest_folder{1}, ['trainingSet_IvUvP_', orientation, '.mat']), 'table');
end
   
cd(root);