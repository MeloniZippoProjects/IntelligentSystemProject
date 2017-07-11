trainTable = load('trainingSet_IvUvP_V.mat');
testTable = load('trainingSet_IvUvP_V.mat');


trainInput = [
    trainTable.table.power_std, trainTable.table.phase_std, trainTable.table.power_mean, trainTable.table.phase_mean];
trainOutput = trainTable.table.out;

testInput = [
    testTable.table.power_std, testTable.table.phase_std, testTable.table.power_mean, testTable.table.phase_mean ];
testOutput = testTable.table.out;