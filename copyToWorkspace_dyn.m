trainTable = load('features_dataset/dati_buoni/trainingSlicedSet_H.mat');


trainInput = [trainTable.table.power_integral];
trainInput = trainInput(31:60,:);
trainOutput = [trainTable.table.out_dynamicCase];
trainOutput = trainOutput(31:60,:);



trainData = zeros(24,4);
trainData(1:8,1:3) = trainInput(1:8,:);
trainData(1:8,4) = -1;

trainData(9:16,1:3) = trainInput(11:18,:);
trainData(9:16,4) = 0;

trainData(17:24,1:3) = trainInput(21:28,:);
trainData(17:24,4) = 1;

testData = zeros(6,4);
testData(1:2,1:3) = trainInput(9:10,:);
testData(1:2,4) = -1;

testData(3:4,1:3) = trainInput(19:20,:);
testData(3:4,4) = 0;

testData(5:6,1:3) = trainInput(29:30,:);
testData(5:6,4) = 1;