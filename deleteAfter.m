net = patternnet(1);

net = train(net, trainInput.', trainOutput.');

xTrain = trainInput.';