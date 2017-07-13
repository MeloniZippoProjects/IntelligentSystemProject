%source_folder = 'restructured_dataset';
%source_folder = 'exp_smoothed_dataset';
source_folder = 'mov_smoothed_dataset';

subfolders = {'dati_buoni'; 'dati_cattivi'};
target_folder = 'features_dataset';

orientations = ['H', 'V'];
dynamicCases = ['I', 'U', 'P'];

plotGraphs = true;

root = pwd;

for subfolder_idx = 1 : size(subfolders, 1)
    subfolder = subfolders(subfolder_idx);
   
    curr_source_folder = fullfile(root, source_folder, subfolder);
    cd(curr_source_folder{1});
    load('data.mat')
    
    mkdir plots;
    cd plots;

    plotSignal(data.static, 'static_');
   
    for orientation = orientations
        %Dynamic case     
        for dynamicCase = dynamicCases
                plotSignal(data.dynamic.(orientation).(dynamicCase), ['dynamic_', orientation, '_', dynamicCase]);
        end
    end
end
cd(root);