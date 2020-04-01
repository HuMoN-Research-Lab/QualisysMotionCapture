function [c3dData_fr_mrk_dim framerate c3dMarkerNames] = loadc3dData(c3dPath, trialNumber)

cd(c3dPath)

if (trialNumber < 10)
    c3dFileName = sprintf('Trial00%d.c3d',trialNumber);
    
elseif ((trialNumber >= 10) && (trialNumber < 100))
    c3dFileName = sprintf('Trial0%d.c3d',trialNumber);
    
elseif trialNumber >= 100
    c3dFileName = sprintf('Trial%d.c3d',trialNumber);
end

%% Load .c3d data
t = mcread(c3dFileName);

if (t.nMarkers > 45)
    disp('Error')
    t.nMarkers
    disp(trialID)
end

xInd = 1:3:(t.nMarkers*3);
yInd = 2:3:(t.nMarkers*3);
zInd = 3:3:(t.nMarkers*3);

%Butterworth filter parameters
order = 4; %4th Order
cutoff = 7; %cutoff at 7Hz

framerate = t.freq;
c3dData_fr_mrk_dim(:,:,1) = butterLowZero(order, cutoff, t.freq, t.data(:, xInd));
c3dData_fr_mrk_dim(:,:,2) = butterLowZero(order, cutoff, t.freq, t.data(:, yInd));
c3dData_fr_mrk_dim(:,:,3) = butterLowZero(order, cutoff, t.freq, t.data(:, zInd));
c3dMarkerNames = t.markerName;





