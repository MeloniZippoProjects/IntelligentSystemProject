source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'; 'dati_cattivi'};
target_folder = 'features_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

root = pwd;

for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   load('data.mat')
   
   for orientation = orientations
        table = struct();
        table.power_std = zeros(60,1);
        table.power_mean = zeros(60,1);
        table.power_median = zeros(60,1);
        table.phase_std = zeros(60,1);
        table.phase_mean = zeros(60,1);
        table.phase_median = zeros(60,1);
        table.out_isStatic = zeros(60,1);
               
        %Static case
        if orientation == 'H'
            idx = 1:30;
        else
            idx = 31:60;
        end
            
        powerFeatures = extractFeatures(data.static.power(idx));
        phaseFeatures = extractFeatures(data.static.phase(idx));
        
        idx = 1:30;
        table.power_std(idx) = powerFeatures.std;
        table.power_mean(idx) = powerFeatures.mean;
        table.power_median(idx) = powerFeatures.median;
        table.phase_std(idx) = phaseFeatures.std;
        table.phase_mean(idx) = phaseFeatures.mean;
        table.phase_median(idx) = phaseFeatures.median;
        table.out_isStatic(idx) = 1;

        %Dynamic case
		baseIdx = 31;        
        for dynamicCase = dynamicCases
	        powerFeatures = extractFeatures(data.dynamic.(orientation).(dynamicCase).power);
    	    phaseFeatures = extractFeatures(data.dynamic.(orientation).(dynamicCase).phase);

			idx = baseIdx : baseIdx + 9; 
	        table.power_std(idx) = powerFeatures.std;
	        table.power_mean(idx) = powerFeatures.mean;
	        table.power_median(idx) = powerFeatures.median;
	        table.phase_std(idx) = phaseFeatures.std;
	        table.phase_mean(idx) = phaseFeatures.mean;
	        table.phase_median(idx) = phaseFeatures.median;
	        table.out_isStatic(idx) = 0;
    	    
    	    baseIdx = baseIdx + 10;
        end
   
       dest_folder = fullfile(root, target_folder, subfolder);
       mkdir(dest_folder{1});

       save(fullfile(dest_folder{1}, ['trainingSet_', orientation, '.mat']), 'table');
   end
   
   cd(root);
end