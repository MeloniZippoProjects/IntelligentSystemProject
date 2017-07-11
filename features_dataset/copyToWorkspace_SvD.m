trainTable = load('dati_buoni/trainingSet_SvD_V.mat');
testTable = load('dati_buoni/trainingSet_SvD_V.mat');

%powerStd = trainTable.table.power_std.std;
%powerMean = trainTable.table.power_std.mean;

%phaseStd = trainTable.table.phase_std.std;
%phaseMean = trainTable.table.phase_std.mean;


%trainInput = [trainTable.table.phase_std.values];
trainInput = [trainTable.table.power_std, trainTable.table.phase_std];

trainOutput = trainTable.table.out_isStatic;

%testInput = [(testTable.table.phase_std - phaseMean)/phaseStd];
testInput = [testTable.table.power_std, testTable.table.phase_std];

testOutput = testTable.table.out_isStatic;