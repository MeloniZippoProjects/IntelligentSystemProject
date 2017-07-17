trainTable = load('features_dataset/dati_buoni/trainingSet_SvD_H.mat');
normalizedStd = normalize(trainTable.table.phase_std);

compoundData = zeros(60, 2);
compoundData(:, 1) = normalizedStd.values;
compoundData(1:30, 2) = trainTable.table.out_isStatic(1:30);
compoundData(31:60, 2) = trainTable.table.out_isStatic(31:60);

permData = compoundData(randperm(60), :);

trainData = permData(1:50, :);
testData = permData(51:55, :);
checkData = permData(56:60, :);

trainInput = normalizedStd.values;
trainOutput = [trainTable.table.out_isStatic];