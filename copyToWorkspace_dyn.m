trainTable = load('features_dataset/dati_buoni/trainingSlicedSet_V.mat');


trainInput = [trainTable.table.power_integral];
trainInput = trainInput(31:60,:);
trainOutput = [trainTable.table.out_dynamicCase];
%trainOutput = trainOutput(31:60,:);

trainTableData(:,1:3) = trainInput(randperm(30),:);
trainTableData(1:10,4) = 0;
trainTableData(11:21,4) = 1;
trainTableData(21:30,4) = 0.5;

trainRandInput(:,1:4) = trainTableData(randperm(30),:); 

trainData = zeros(18,4);
trainData(1:6,1:4) = trainRandInput(1:6,:);
trainData(7:12,1:4) = trainRandInput(11:16,:);
trainData(13:18,1:4) = trainRandInput(21:26,:);

testData = zeros(6,4);
testData(1:2,1:4) = trainRandInput(7:8,:);
testData(3:4,1:4) = trainRandInput(17:18,:);
testData(5:6,1:4) = trainRandInput(27:28,:);

checkData = zeros(6,4);
checkData(1:2,1:4) = trainRandInput(9:10,:);
checkData(3:4,1:4) = trainRandInput(9:10,:);
checkData(5:6,1:4) = trainRandInput(9:10,:);
