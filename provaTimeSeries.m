idxA = 1;
idxB = 2;

sampleNumber = 20

% i : max(i) = x : 1000 => z = 1000*i / max(i) 

times1 = data.static.timestamps{idxA};
times2 = data.static.timestamps{idxB};
times1 = times1 - times1(1);
times2 = times2 - times2(1);

times1 = times1*sampleNumber/max(times1);
times2 = times2*sampleNumber/max(times2);

power1 = data.static.power{idxA};
power2 = data.static.power{idxB};

ts1 = timeseries(power1, times1, 'Name', 'TS1');
ts2 = timeseries(power2, times2, 'Name', 'TS2');

resTs1 = resample(ts1, 1:sampleNumber);
resTs2 = resample(ts2, 1:sampleNumber);

figure('Name','ts1');
plot(ts1);

figure('Name','ts2');
plot(ts2);


figure('Name','resTs1');
plot(resTs1);


figure('Name','resTs2');
plot(resTs2);