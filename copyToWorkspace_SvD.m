trainTable = load('features_dataset/dati_buoni/trainingSet_SvD_H.mat');
trainInput = [trainTable.table.phase_std];
trainOutput = [trainTable.table.out_isStatic];