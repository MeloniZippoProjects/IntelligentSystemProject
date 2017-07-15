clear;
load('.\restructured_dataset\dati_buoni\data.mat');

signalIdx = 1;

powerSignal = data.dynamic.H.I.power{signalIdx};
timeStamps = data.dynamic.H.I.timestamps{signalIdx};

fig = figure('Name', 'Original power signal');
plot(powerSignal);

normalizedPowerSignal = (powerSignal-mean(powerSignal))/std(powerSignal);

%fig = figure('Name', 'Normalized power signal');
%plot(normalizedPowerSignal);

timeSlices = 12;
n = size(powerSignal, 1);
sliceSize = floor(n/timeSlices);

integrationVector = zeros(timeSlices,1);

timeDistances = zeros(n, 1);
timeDistances(1:n-1) = timeStamps(2:n) - timeStamps(1:n-1);
timeDistances(n) = timeDistances(n-1);

%Normalized signal

for timeSlice = 1:timeSlices
    startIdx = (timeSlice - 1)*sliceSize + 1;
    endIdx = timeSlice*sliceSize;
    integrationVector(timeSlice) = sum( normalizedPowerSignal(startIdx:endIdx).*timeDistances(startIdx:endIdx) );
end

%fig = figure('Name', 'Sliced integral');
%plot(integrationVector);

normalizedIntegrationVector = (integrationVector - mean(integrationVector)) / std(integrationVector);
fig = figure('Name', 'Normalized sliced integral of normalized signal');
plot(normalizedIntegrationVector);

%Non-normalized signal

for timeSlice = 1:timeSlices
    startIdx = (timeSlice - 1)*sliceSize + 1;
    endIdx = timeSlice*sliceSize;
    integrationVector(timeSlice) = sum( powerSignal(startIdx:endIdx).*timeDistances(startIdx:endIdx) );
end

%fig = figure('Name', 'Sliced integral');
%plot(integrationVector);

normalizedIntegrationVector = (integrationVector - mean(integrationVector)) / std(integrationVector);
fig = figure('Name', 'Normalized sliced integral of original signal');
plot(normalizedIntegrationVector);
