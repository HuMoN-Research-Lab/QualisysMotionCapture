%% MATLAB Motion Capture Data Acquisition MASTER
%closes all open graphs
close all

%clears all variables
clearvars

%Locates github path and connects subfolders to code
cd '/Users/MT/Documents/Github/MotionCapture_MATLABCode'
addpath(genpath(cd))

%% Load acquired motion capture data
% Expects a .mat file in order for code to work
fileName = '2020-02-04_JSM_Walking0001';
% fileName = '2020-02-04_JSM_Slackline0006';

%Load file name and output various required variables
[numForcePlates,numFrames,framerate,markerLabels,numMarkers,marker_mar_dim_frame] ... 
    = loadMoCapData(fileName);

%% findUser function
%function locates relevant information based on user name
%bodyMass should be in kg and height in metric units (mm)
userProfile = readtable('userProfile.xlsx','readrownames',true);
[mmHeight,kgMass] = findUser(userProfile,'Jon Matthis');

%% bodySegLength function
% Function outputs length for individual body segs
[bodySegLength] = calcBodySegLength(mmHeight);

%% calcBodySegMass function
% Function outputs mass for individual body segs
[bodySegMass,segPropWeight] = calcBodySegMass(kgMass);

%% calcSegCOM function
% Function outputs totalCOM considering marker location 
[segCenter] = calcSegCOM(marker_mar_dim_frame,markerLabels);

%% COM of seg
[totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);

%% evalSegFrames function
% Function outputs marker frames evaluation
clc
[segEval] = evalSegFrames(segCenter,totalCOMXYZ);

%% calcMarVel function
% Function outputs relative velocity of each body seg
% Currently not optimized yet for plotting purposes
%[segCenterVel] = calcMarVel(segCenter);

%% Motion capture data plot
%Miscellaneous numbering of figures important for future reference
f = figure(45000);
%facilitates output of figures across multiple mediums
f.Units = 'normalized';
f.Position = [-0.0042 0.4306 0.9401 0.4741];

%Create video with frames
stepA = VideoWriter('TotalCOM_MotionCapture.mp4');
open(stepA);

%for frames 1:numFrames at interval of 10
for fr = 1:10:numFrames
    %Clear current frame
    clf

    %Plot all markers in x,y, and z
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    %Hold on for next set of plotting instructions
    hold on
    
    %% Total Body COM in 3D
    %plot of total anatomical COM
    plot3(totalCOMXYZ(1,fr),...
        totalCOMXYZ(2,fr),...
        totalCOMXYZ(3,fr),'p','DisplayName','TotalXYZ');
     
    %% COM for the all body segments in 3D
    %Head and Neck Markers
%     plot3(segCenter.headCenter_mar_dim_frame(1,fr),...
%         segCenter.headCenter_mar_dim_frame(2,fr),...
%         segCenter.headCenter_mar_dim_frame(3,fr),'p','DisplayName','HeadXYZ');
% %      
%     %Shoulder Markers
%     plot3(segCenter.LShoulderCenter_mar_dim_frame(1,fr),...
%         segCenter.LShoulderCenter_mar_dim_frame(2,fr),...
%         segCenter.LShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','LShoulderXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
%     plot3(segCenter.RShoulderCenter_mar_dim_frame(1,fr),...
%         segCenter.RShoulderCenter_mar_dim_frame(2,fr),...
%         segCenter.RShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','RShoulderXYZ');
%     
    %Chest Markers
%     plot3(segCenter.chestCenter_mar_dim_frame(1,fr),...
%         segCenter.chestCenter_mar_dim_frame(2,fr),...
%         segCenter.chestCenter_mar_dim_frame(3,fr),'p','DisplayName','ChestXYZ');
%     
    %Arm Markers
%     plot3(segCenter.LUpperArmCenter_mar_dim_frame(1,fr),...
%         segCenter.LUpperArmCenter_mar_dim_frame(2,fr),...
%         segCenter.LUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','LUpperArmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenter.RUpperArmCenter_mar_dim_frame(1,fr),...
%         segCenter.RUpperArmCenter_mar_dim_frame(2,fr),...
%         segCenter.RUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','RUpperArmXYZ');
%      
    %Forearm Markers
%     plot3(segCenter.LForearmCenter_mar_dim_frame(1,fr),...
%         segCenter.LForearmCenter_mar_dim_frame(2,fr),...
%         segCenter.LForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','LForearmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenter.RForearmCenter_mar_dim_frame(1,fr),...
%         segCenter.RForearmCenter_mar_dim_frame(2,fr),...
%         segCenter.RForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','RForearmXYZ');
% 
    %Hand Markers
%     plot3(segCenter.LHandCenter_mar_dim_frame(1,fr),...
%         segCenter.LHandCenter_mar_dim_frame(2,fr),...
%         segCenter.LHandCenter_mar_dim_frame(3,fr),'p','DisplayName','LHandXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenter.RHandCenter_mar_dim_frame(1,fr),...
%         segCenter.RHandCenter_mar_dim_frame(2,fr),...
%         segCenter.RHandCenter_mar_dim_frame(3,fr),'p','DisplayName','RHandXYZ');
%     
%     %Hip Markers
%     plot3(segCenter.hipCenter_mar_dim_frame(1,fr),...
%         segCenter.hipCenter_mar_dim_frame(2,fr),...
%         segCenter.hipCenter_mar_dim_frame(3,fr),'p','DisplayName','HipXYZ');
%     
%     %Thigh Markers
%     plot3(segCenter.LThighCenter_mar_dim_frame(1,fr),...
%         segCenter.LThighCenter_mar_dim_frame(2,fr),...
%         segCenter.LThighCenter_mar_dim_frame(3,fr),'p','DisplayName','LThighXYZ');
%     plot3(segCenter.RThighCenter_mar_dim_frame(1,fr),...
%         segCenter.RThighCenter_mar_dim_frame(2,fr),...
%         segCenter.RThighCenter_mar_dim_frame(3,fr),'p','DisplayName','RThighXYZ');
%     
%     %Leg Markers
%     plot3(segCenter.LLegCenter_mar_dim_frame(1,fr),...
%         segCenter.LLegCenter_mar_dim_frame(2,fr),...
%         segCenter.LLegCenter_mar_dim_frame(3,fr),'p','DisplayName','LLegXYZ');
%     plot3(segCenter.RLegCenter_mar_dim_frame(1,fr),...
%         segCenter.RLegCenter_mar_dim_frame(2,fr),...
%         segCenter.RLegCenter_mar_dim_frame(3,fr),'p','DisplayName','RLegXYZ');
%      
%     %Foot Markers
%     plot3(segCenter.LFootCenter_mar_dim_frame(1,fr),...
%         segCenter.LFootCenter_mar_dim_frame(2,fr),...
%         segCenter.LFootCenter_mar_dim_frame(3,fr),'p','DisplayName','LFootXYZ');
%     plot3(segCenter.RFootCenter_mar_dim_frame(1,fr),...
%         segCenter.RFootCenter_mar_dim_frame(2,fr),...
%         segCenter.RFootCenter_mar_dim_frame(3,fr),'p','DisplayName','RFootXYZ');      
    
    %WORK IN PROGRESS
    %[outputArg1,outputArg2] = plotMoCapTracer(segCenter)
    %% Plotting parameters
    axis equal
    grid on
    legend
    
    %optimal x y z graph limits 
    xlim([0 2e3])
    ylim([-5e3 10e3]) %full lab
%    ylim([1e3 3e3]) %smaller space
    zlim([0 3e3])
    
    %unsure of what this section XYZs
    az = -84.362;
    el =  20.417;
    view(az,el)
    
    %Draw plot after each frame iteration
    drawnow
    
    %Middle of video acquisition code
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end

%End of video acquisition code
close(stepA)


