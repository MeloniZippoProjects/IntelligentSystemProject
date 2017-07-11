trainTable = load('normalized_trainingSet_SvD_V.mat');
testTable = load('trainingSet_SvD_V.mat');


trainInput = [
    trainTable.table.power_std, trainTable.table.phase_std, ];
trainOutput = trainTable.table.out_isStatic;

testInput = [
    testTable.table.power_std, testTable.table.phase_std];
testOutput = testTable.table.out_isStatic;