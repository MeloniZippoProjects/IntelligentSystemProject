function [ errors ] = patternNetwork( xTrain, yTrain, xTest, yTest )

    net = patternnet(3);
    
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    
    net = train(net, xTrain.', yTrain.');
    
    outs = net(xTest');
    
    [ind,n] = vec2ind(outs);
    
    vec2 = full(ind2vec(ind,n));
    
    errors = 0;
    for idx = 1 : size(yTest')
        isErr = sum(yTest(idx,:)' ~= vec2(:,idx)) / 2;
        errors = errors + isErr;
    end
    
    
end

