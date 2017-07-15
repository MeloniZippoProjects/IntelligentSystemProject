source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'};% 'dati_cattivi'};
target_folder = 'timeseries_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

root = pwd;

sampleNumber = 8;

for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   load('data.mat')
   
   for orientation = orientations
        table = struct();
        table.power = zeros(60, sampleNumber);
        table.phase = zeros(60, sampleNumber);
        table.out_isStatic = zeros(60,1);
        table.out_dynamicCase = zeros(60,3);
        %Static case
        if orientation == 'H'
            idxMod = 0;
        else
            idxMod = 30;
        end
        for idx = 1:30
            power = data.static.power{idx+idxMod};
            phase = data.static.phase{idx+idxMod};
            
            times = data.static.timestamps{idx+idxMod};
            times = times - times(1);
            times = times*sampleNumber/max(times);
            
            powerTs = timeseries(power, times);
            resampledPowerTs = resample(powerTs,1:sampleNumber);
            
            phaseTs = timeseries(phase, times);
            resampledPhaseTs = resample(phaseTs,1:sampleNumber);
            
            table.power(idx, :) = resampledPowerTs.Data.'; 
            table.phase(idx, :) = resampledPhaseTs.Data.';
            table.out_isStatic(idx) = 1;
            table.out_dynamicCase(idx, :) = [-1 -1 -1];
        end
            
        

        %Dynamic case
		baseIdx = 31;        
        for dynamicCase = dynamicCases
			idxRange = baseIdx : baseIdx + 9;
            for idx = idxRange
                power = data.dynamic.(orientation).(dynamicCase).power{idx-baseIdx+1};
                phase = data.dynamic.(orientation).(dynamicCase).phase{idx-baseIdx+1};
                
                times = data.dynamic.(orientation).(dynamicCase).timestamps{idx-baseIdx+1};
                times = times - times(1);
                times = times*sampleNumber/max(times);

                powerTs = timeseries(power, times);
                resampledPowerTs = resample(powerTs,1:sampleNumber);

                phaseTs = timeseries(phase, times);
                resampledPhaseTs = resample(phaseTs,1:sampleNumber);

                table.power(idx, :) = resampledPowerTs.Data.'; 
                table.phase(idx, :) = resampledPhaseTs.Data.';
                table.out_isStatic(idx) = 0;
                
                out_val = [-1,-1,-1];
                if dynamicCase == 'I'
                    out_val = [1,0,0];
                elseif dynamicCase == 'U'
                    out_val = [0,1,0];
                elseif dynamicCase == 'P'
                    out_val = [0,0,1];
                end
                
                table.out_dynamicCase(idx, :) = out_val;
                
            end
    	    baseIdx = baseIdx + 10;
        end
   
       dest_folder = fullfile(root, target_folder, subfolder);
       mkdir(dest_folder{1});

       save(fullfile(dest_folder{1}, ['trainingSet_', orientation, '.mat']), 'table');
   end
   
   cd(root);
end