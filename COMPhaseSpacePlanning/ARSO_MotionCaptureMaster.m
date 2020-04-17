%ARSO_MotionCaptureMaster
clc
clear all
close all

cd('/Users/MT/Documents/GitHub/MotionCapture_MATLABCode/COMPhaseSpacePlanning');

addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

%% Initial conditions
mmHeight = 1;
kgMass   = 1;

%% loadPhaseSpaceMoCapData function loads Phase Space Planning data
% fileName = 'trial011';
% fileName = 'trial042';
% unknownID = 8;
% [data,startFrames,numFrames,framerate,markerLabels,marker_mar_dim_frame,comXYZ] ... 
%     = loadPhaseSpaceMoCapData(fileName);

for iter = 1:3
    %% Identify location where files are stored
    cd('/Users/MT/Documents/GitHub/MotionCapture_MATLABCode/COMPhaseSpacePlanning');
    %     cd('C:\Users\jonma\Dropbox\ResearchProjects\COMPhaseSpacePlanning\sub01\c3d')
    
    switch iter
        
        case 1
            condTitle = 'Free Walking';
            fid = 'trial011';
            
        case 2
            condTitle = 'Full Vision';
            fid = 'trial042';
            
        case 3
            condTitle = 'Limited Vision';
            fid = 'trial015';
    end
    
    %% Load data from specific fid
    [data,startFrames,numFrames,framerate,markerLabels,marker_mar_dim_frame,comXYZ] ... 
    = loadPhaseSpaceMoCapData(fid);
    
    close all
    
    %% Filter data using butterworth
    order   = 4;
    cutoff  = 7;
    
    [data_mar_dim_frame] = butterLowZero(order,cutoff,framerate,marker_mar_dim_frame); %left(1:numel(markerLabels),:,:) right(1:numel(markerLabels),1:3,:) Butterworth filter each marker's data and load it into the trial
    
    %% Identify all heel-toe step locations
    [allSteps,step_hs_to_ft_XYZ,peaks,calcData] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);

    %% Store trials data in struct
    if fid == 'trial011' %condTitle == 'Free Walking'
        processedData.FreeWalkingData.filteredData =            data_mar_dim_frame;
        processedData.FreeWalkingData.rawData =                 marker_mar_dim_frame;
        processedData.FreeWalkingData.allSteps =                allSteps;
        processedData.FreeWalkingData.step_hs_to_ft_XYZ =       step_hs_to_ft_XYZ;
        processedData.FreeWalkingData.peaks =                   peaks;
        
        %right ankle velocity, acceleration, and jerk
        processedData.FreeWalkingData.calcData.rAnkVel2D =      calcData.rAnkVel2D;
        processedData.FreeWalkingData.calcData.rAnkAcc2D =      calcData.rAnkAcc2D;
        processedData.FreeWalkingData.calcData.rAnkJerk2D =     calcData.rAnkJerk2D;
        
        %left ankle velocity, acceleration, and jerk
        processedData.FreeWalkingData.calcData.lAnkVel2D =      calcData.lAnkVel2D;
        processedData.FreeWalkingData.calcData.lAnkAcc2D =      calcData.lAnkAcc2D;
        processedData.FreeWalkingData.calcData.lAnkJerk2D =     calcData.lAnkJerk2D;
    end

    if fid == 'trial042' %condTitle == 'Full Vision'
        processedData.FullVisionData.filteredData =             data_mar_dim_frame;
        processedData.FullVisionData.rawData =                  marker_mar_dim_frame;
        processedData.FullVisionData.allSteps =                 allSteps;
        processedData.FullVisionData.step_hs_to_ft_XYZ =        step_hs_to_ft_XYZ;
        processedData.FullVisionData.peaks =                    peaks;
        
        %right ankle velocity, acceleration, and jerk
        processedData.FullVisionData.calcData.rAnkVel2D =       calcData.rAnkVel2D;
        processedData.FullVisionData.calcData.rAnkAcc2D =       calcData.rAnkAcc2D;
        processedData.FullVisionData.calcData.rAnkJerk2D =      calcData.rAnkJerk2D;
        
        %left ankle velocity, acceleration, and jerk
        processedData.FullVisionData.calcData.lAnkVel2D =       calcData.lAnkVel2D;
        processedData.FullVisionData.calcData.lAnkAcc2D =       calcData.lAnkAcc2D;
        processedData.FullVisionData.calcData.lAnkJerk2D =      calcData.lAnkJerk2D;
    end
    
    if fid == 'trial015' %condTitle == 'Limited Vision'
        processedData.LimitedVisionData.filteredData =          data_mar_dim_frame;
        processedData.LimitedVisionData.rawData =               marker_mar_dim_frame;
        processedData.LimitedVisionData.allSteps =              allSteps;
        processedData.LimitedVisionData.step_hs_to_ft_XYZ =     step_hs_to_ft_XYZ;
        processedData.LimitedVisionData.peaks =                 peaks;
        
        %right ankle velocity, acceleration, and jerk
        processedData.LimitedVisionData.calcData.rAnkVel2D =    calcData.rAnkVel2D;
        processedData.LimitedVisionData.calcData.rAnkAcc2D =    calcData.rAnkAcc2D;
        processedData.LimitedVisionData.calcData.rAnkJerk2D =   calcData.rAnkJerk2D;
        
        %left ankle velocity, acceleration, and jerk
        processedData.LimitedVisionData.calcData.lAnkVel2D =    calcData.lAnkVel2D;
        processedData.LimitedVisionData.calcData.lAnkAcc2D =    calcData.lAnkAcc2D;
        processedData.LimitedVisionData.calcData.lAnkJerk2D =   calcData.lAnkJerk2D;
    end
    
    
end
% close all

%% butterworth filter application
% order   = 4;
% cutoff  = 7;
% clc
% close all
% [data_mar_dim_frame(1:numel(markerLabels),:,:)] = butterLowZero(order,cutoff,framerate,marker_mar_dim_frame(1:numel(markerLabels),1:3,:)); %Butterworth filter each marker's data and load it into the trial

% for m = 1:numel(markerLabels)
%     if sum(sum(marker_mar_dim_frame(m,1:3,:))) == 0
%         data_mar_dim_frame(m,:,:) = nan(size(marker_mar_dim_frame(m,1:3,:)));
%     else
%         marker_mar_dim_frame(m,1:3,:)(marker_mar_dim_frame(m,1:3,:))==0) == nan;
%         data_mar_dim_frame(m,:,:) = butterLowZero(order,cutoff,framerate,(marker_mar_dim_frame(m,1:3,:))); %Butterworth filter each marker's data and load it into the trial
%     end
% end

% [allSteps,step_hs_to_ft_XYZ,peaks] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
% [allSteps, step_fr_ft_XYZ]= ZeniStepFinder_ccpVid(data_mar_dim_frame, markerLabels);

%% Insert function that detects the subjects movement


%% bodySegLength function
% Function outputs length for individual body segs
[bodySegLength] = calcBodySegLength(mmHeight);

%% calcBodySegMass function
% Function outputs mass for individual body segs
[bodySegMass,segPropWeight] = calcBodySegMass(kgMass);

%% calcSegCOM function
% Function outputs totalCOM considering marker location 
[segCenter] = calcPhaseSpaceSegCOM(marker_mar_dim_frame,markerLabels); %,markerID)

%% calcSegWeightCOM function
% Function outputs totalCOM depending on seg weight
[totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);

%% Plot data
figure(6801)

for fr = 1:10:numFrames
    %Clear current frame
    clf

    %Plot all markers in x,y, and z
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    hold on
    
%     %% Uncover the unknown marker location
%     plot3(unknownID(1,fr),...
%         unknownID(2,fr),...
%         unknownID(3,fr),'p','DisplayName','LSHO');

    %% Total Body COM in 3D
    %plot of total anatomical COM
    plot3(comXYZ(1,fr),...
        comXYZ(2,fr),...
        comXYZ(3,fr),'p','DisplayName','COMXYZ');
    
    %% Total Body COM in 3D
    %plot of total anatomical COM
%     plot3(totalCOMXYZ(1,fr),...
%         totalCOMXYZ(2,fr),...
%         totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
    
    %% Plotting parameters
    axis equal
    grid on
    legend
    
    %optimal x y z graph limits 
    xlim([-1e3 5e3])
    ylim([-1e3 1e3]) %full lab
%    ylim([1e3 3e3]) %smaller space
    zlim([0 3e3])
    
    %unsure of what this section XYZs
    az = -84.362;
    el =  20.417;
    view(az,el)
    
    
   drawnow
end

