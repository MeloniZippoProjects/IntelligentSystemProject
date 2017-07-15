warning('off','all');

maxSamples = 12;
maxNeurons = 10;

maxPerform = inf;
currBest = [0 0];
currBestWeights = 0;

for sampleIdx = 5 : maxSamples
   samplingFactor = sampleIdx;
   trainingSetSlicedBuilder;
   
   for neurons = 1 : maxNeurons
        %copyToWorkspace_dyn;
        copyToWorkspace_SvD;


        net = patternnet(neurons); 
        trainNet = train(net,trainInput.', trainOutput.');
        
        y = trainNet(trainInput.');
        
        p = perform(trainNet, trainOutput', y);     
        weights = sampleIdx * neurons;
        
        if p < maxPerform || (p == maxPerform && weights < currBestWeights)

            maxPerform = p;
            currBest = [sampleIdx, neurons];
            currBestWeights = weights;
        end           
   end
    
    
end