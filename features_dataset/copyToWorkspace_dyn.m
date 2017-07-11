trainTable = load('trainingSet_IvUvP_V.mat');
testTable = load('trainingSet_IvUvP_V.mat');


%trainInput = [trainTable.table.power_std, trainTable.table.phase_std, trainTable.table.power_mean, trainTable.table.phase_mean];
trainInput = [trainTable.table.power_incRatio, trainTable.table.power_midPoints, trainTable.table.phase_incRatio, trainTable.table.phase_midPoints];
trainOutput = trainTable.table.out;

testInput = [trainTable.table.power_incRatio, trainTable.table.power_midPoints, trainTable.table.phase_incRatio, trainTable.table.phase_midPoints ];
testOutput = testTable.table.out;