trainTable = load('dati_buoni/trainingSlicedSet_IvUvP_V.mat');
testTable = load('dati_cattivi/trainingSet_IvUvP_V.mat');


%trainInput = [trainTable.table.power_median, trainTable.table.power_std, trainTable.table.phase_median, trainTable.table.phase_std];
trainInput = [trainTable.table.power_incRatio, trainTable.table.power_mean, trainTable.table.phase_incRatio, trainTable.table.phase_mean];
trainOutput = trainTable.table.out;



testInput = [trainTable.table.power_mean, trainTable.table.phase_mean];
testOutput = testTable.table.out;