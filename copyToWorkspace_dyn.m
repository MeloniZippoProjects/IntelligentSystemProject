trainTable = load('features_dataset/dati_buoni/trainingSlicedSet_V.mat');


trainInput = [trainTable.table.power_integral];
trainInput = trainInput(31:60,:);
trainOutput = [trainTable.table.out_dynamicCase];
trainOutput = trainOutput(31:60,:);