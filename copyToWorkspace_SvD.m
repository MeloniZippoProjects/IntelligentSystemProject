trainTable = load('features_dataset/dati_buoni/trainingSet_SvD_H.mat');
normalizedStd = normalize(trainTable.table.phase_std);

trainData = zeros(50, 2);
trainData(1:25, 1) = normalizedStd.values(1:25);
trainData(26:50, 1) = normalizedStd.values(36:60);
trainData(1:25, 2) = trainTable.table.out_isStatic(1:25);
trainData(26:50, 2) = trainTable.table.out_isStatic(36:60);

testingData = zeros(10, 2);
testingData(:, 1) = normalizedStd.values(26:35);
testingData(:, 2) = trainTable.table.out_isStatic(26:35);

%trainInput = normalizedStd.values;
%trainOutput = [trainTable.table.out_isStatic];