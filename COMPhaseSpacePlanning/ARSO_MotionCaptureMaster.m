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
fileName = 'trial011';
unknownID = 8;
[unknownID,data,startFrames,numFrames,framerate,markerLabels,marker_mar_dim_frame,comXYZ] ... 
    = loadPhaseSpaceMoCapData(fileName,unknownID);

close all

% for iter = 1:3
%     close all
%     
%     cd('/Users/MT/Documents/GitHub/MotionCapture_MATLABCode/COMPhaseSpacePlanning');
%     %     cd('C:\Users\jonma\Dropbox\ResearchProjects\COMPhaseSpacePlanning\sub01\c3d')
%     
%     switch iter
%         
%         case 1
%             condTitle = 'Free Walking';
%             fid = 'trial011.mat';
%             
%         case 2
%             condTitle = 'Full Vision';
%             fid = 'trial042.mat';
%             
%         case 3
%             condTitle = 'Limited Vision';
%             fid = 'trial015.mat';
%     end
%     
%     load(fid)
% end

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

for fr = startFrames:10:numFrames   %fr = startFrames:10:numFrames
    %Clear current frame
    clf

    %Plot all markers in x,y, and z
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    %Hold on for next set of plotting instructions
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
    plot3(totalCOMXYZ(1,fr),...
        totalCOMXYZ(2,fr),...
        totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
    
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

