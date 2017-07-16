trainTable = load('features_dataset/dati_buoni/trainingSlicedSet_H.mat');

trainInput = [trainTable.table.power_integral];
trainInput = trainInput(31:60,:);
trainOutput = [trainTable.table.out_dynamicCase];
trainOutput = trainOutput(31:60,:);

[ netOutput, IRR, ORR, ARR ] = evalfis(trainInput, fuzzyDynNet);

fuzzyNetTesting = zeros(30, 2);
for idx = 1:30
    fuzzyNetTesting(idx,1)= trainOutput(idx,:)*[0;1;0.5];
    fuzzyNetTesting(idx,2)= netOutput(idx);
end

save('dynFuzzyResults_H.mat', 'fuzzyNetTesting');

