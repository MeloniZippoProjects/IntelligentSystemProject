clear

trainTable = load('timeseries_dataset/dati_buoni/trainingSet_V.mat');
testTable = load('timeseries_dataset/dati_buoni/trainingSet_V.mat');

%powerStd = trainTable.table.power_std.std;
%powerMean = trainTable.table.power_std.mean;

%phaseStd = trainTable.table.phase_std.std;
%phaseMean = trainTable.table.phase_std.mean;




%correlazione phase_std&output = -0.9936, basta solo phase_std

trainInput = [trainTable.table.power, trainTable.table.phase];
%trainInput = [trainTable.table.power_std, trainTable.table.power_mean, trainTable.table.phase_std, trainTable.table.phase_mean];

trainOutput = trainTable.table.out_dynamicCase;



%testInput = [(testTable.table.phase_std - phaseMean)/phaseStd];
%testInput = [testTable.table.power_std, testTable.table.phase_std];

%testOutput = testTable.table.out_isStatic;