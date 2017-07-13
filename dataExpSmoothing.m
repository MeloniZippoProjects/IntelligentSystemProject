source_folder = 'restructured_dataset';
subfolders = {'dati_buoni'; 'dati_cattivi'};
target_folder = 'exp_smoothed_dataset';

root = pwd;

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   
   load('data.mat');
   
   out_data = struct();
   
   %Static case
   out_data.static.power = expSmoother( data.static.power );
   out_data.static.phase = expSmoother( data.static.phase );
   out_data.static.timestamps = data.static.timestamps;
   
   %dynamic case
   for orientation = orientations
        for dynamicCase = dynamicCases
            out_data.dynamic.(orientation).(dynamicCase).power = expSmoother( data.dynamic.(orientation).(dynamicCase).power );
            out_data.dynamic.(orientation).(dynamicCase).phase = expSmoother( data.dynamic.(orientation).(dynamicCase).phase );
            out_data.dynamic.(orientation).(dynamicCase).timestamps = data.dynamic.(orientation).(dynamicCase).timestamps;
        end
   end
   
   dest_folder = fullfile(root, target_folder, subfolder);
   mkdir(dest_folder{1});
   
   clear data;
   data = out_data;
   save(fullfile(dest_folder{1},'data.mat'), 'data');
   cd(root);
end