trainTable = load('features_dataset/dati_buoni/trainingSet_SvD_H.mat');
trainInput = [trainTable.table.phase_std];
trainOutput = [trainTable.table.out_isStatic];

netOutput = evalfis(trainInput, fuzzynet);

fuzzyNetTesting = cell(60, 2);
for idx = 1:30
    fuzzyNetTesting(idx,1)={'static'};
    fuzzyNetTesting(idx,2)={netOutput(idx)};
end
for idx = 31:60
    fuzzyNetTesting(idx,1)={'dynamic'};
    fuzzyNetTesting(idx,2)={netOutput(idx)};
end

save('fuzzyResults_H.mat', 'fuzzyNetTesting');

