trainingSets = ( dir('**/*trainingSet*.mat') );
for trainingSetIdx = 1:size(trainingSets,1)
    setFolder = trainingSet(trainingSetIdx).folder;
    setName = trainingSet(trainingSetIdx).name;
    
    load(fullfile(setFolder, setName));
    
    table.power_std = normalize(table.power_std);
    table.power_mean = normalize(table.power_mean);
    table.power_median = normalize(table.power_median);
    table.phase_std = normalize(table.phase_std);
    table.phase_mean = normalize(table.phase_mean);
    table.phase_median = normalize(table.phase_median);
    
    save(fullfile(setFolder, ['normalized_', setName]), 'table');    
end