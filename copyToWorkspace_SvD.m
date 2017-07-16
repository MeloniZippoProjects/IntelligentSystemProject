trainTable = load('features_dataset/dati_buoni/trainingSet_SvD_V.mat');
normalizedStd = normalize(trainTable.table.phase_std);
trainInput = normalizedStd.values;
trainOutput = [trainTable.table.out_isStatic];