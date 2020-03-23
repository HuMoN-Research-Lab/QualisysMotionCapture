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

% %Expects a .xlsx file for code to work
userProfile = readtable('userProfile.xlsx','readrownames',true);
[mmHeight,kgMass] = findUser(userProfile,'Jon Matthis');

%% lbs2kg Function
%Function converts from lbs2kg
%kgMass = lbs2kg(lbsWeight);

%% bodySegLength function
% Function outputs length for individual body segs
[bodySegLength] = calcBodySegLength(mmHeight);

%% calcBodySegMass function
% Function outputs mass for individual body segs
[bodySegMass,segWeight] = calcBodySegMass(kgMass);

%% calcMarCenter function
% Function outputs XYZ position of each marker
%Review content again to make sure that segments are correctly chosen
[segCenter] = calcMarCenter(marker_mar_dim_frame,markerLabels);

%% OLD CODE segXYZPosition function 
% Function outputs XYZ position of x, y, z coordinates of body segs
%[segCenter] = calcSegCenter(marker_mar_dim_frame,markerXYZ); %, markerLabels);

%% calcSegCOM function
% Function outputs totalCOM considering marker location 
[bodySegWeight] = calcSegCOM(segCenter);

%% COM of seg
%CURRENTLY OUT OF ORDER
%[totalCOMXYZ,headCOM] = calcCOM(segCenter,bodySegMass,kgMass,segWeight); %markerLabels)

%% bodySegAngle function 
% WORK NEEDS TO BE DONE
%Function outputs respective angle between body seg in 2D
%[bodySegAngleStruct] = bodySegAngle(segCenters);
% [thetaL21,thetaR21,thetaL43,thetaR43,thetaLKnee,thetaRKnee]...
%     = bodySegAngle(LThighXYZ,RThighXYZ,LLegXYZ,RLegXYZ...
%     LFootXYZ,RFootXYZ);

%% Acquire force data for each force plate with butterworth filter
% %currently unoperational due to clipping of data

%%order and cutoff relate to butterworth filter 
% order = 4;
% cutoff = 10;
% for ff = 1:numForcePlates
%
%     %center of pressure data acquisition
%     cop_fp_dim_fr(ff,:,:)= butterLowZero(order,cutoff,framerate,data.Force(ff).COP);
%     
%     %moment values generated from force plates
%     moment_fp_dim_fr(ff,:,:)= butterLowZero(order,cutoff,framerate,data.Force(ff).Moment);
%     
%     %forces values generated from force plates
%     force_fp_dim_fr(ff,:,:)= butterLowZero(order,cutoff,framerate,data.Force(ff).force);
%     
%     %location of force plates in space
%     frLoc{ff} = data.Force(ff).ForcePlateLocation;
% end

%% Acquisition of trajectories data for each force plate 

% potential solution for filling in gaps in gathered force plate values
% 
% for mm = 1:numMarkers
% tic
%     marker_mar_dim_frame(mm,1:3, :) = fillmissing(marker_mar_dim_frameRAW(mm,1:3, :),'linear');
% toc
% end
% 
% %butterworth filter marker data
% 
% for mm = 1:numMarkers
% 
%     marker_mar_dim_frame(mm,1:3, :) = butterLowZero(order, cutoff, framerate, marker_mar_dim_frame(mm,1:3, :));
% end

%% Plotting force plate data
% 
% if numForcePlates > 0
%     figure(3626)
%     
%     for ff = 1:numForcePlates
%         subplot(2,3,ff)
%         plot(squeeze(cop_fp_dim_fr(ff,:,:)))
%     end
%     
%     figure(764)
%     
%     for ff = 1:numForcePlates
%         subplot(2,3,ff)
%         plot(squeeze(moment_fp_dim_fr(ff,:,:)))
%     end
% end

%% Marker tracking hip data
%hipIDs were acquired using the markerLabels

%Velocity of hips
%CODE CURRENTLY CAUSING AN ERROR
%hipsVel =  [0 0 0; diff(segCenters.hipsCenter_mar_dim_frame)];

%calculates acceleration of hips
%hipsAcc = [0 0 0; diff(hipsVel)];


%% Motion capture data plot
%Miscellaneous numbering of figures important for future reference
f = figure(40500);
%facilitates output of figures across multiple mediums
f.Units = 'normalized';
f.Position = [-0.0042 0.4306 0.9401 0.4741];

%Create video with frames
stepA = VideoWriter('SeMoCap.mp4');
open(stepA);

%for frames 1:numFrames at interval of 10
for fr = 1:10:numFrames
    %clears the current figures to avoid plotting data over each other
    clf
    
    %determines how many rows and columns a figure will have
%     numRows = 2;
%     numCols = 3;
%     
%     subplot(numRows, numCols, 1:3)
    
    %column 1(x), 2(y), 3(z)
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')

    hold on
    
    %% Total Body COM in 3D
    plot3(headCOM(1,fr),...
        headCOM(2,fr),...
        headCOM(3,fr),'p','DisplayName','HeadXYZ');
    
%     plot3(totalCOMXYZ(1,fr),...
%         totalCOMXYZ(2,fr),...
%         totalCOMXYZ(3,fr),'p','DisplayName','TotalXYZ');
%     
    %% COM for the all body segments in 3D
%     %Head and Neck Markers
%     plot3(segCenter.headCenter_mar_dim_frame(1,fr),...
%         segCenter.headCenter_mar_dim_frame(2,fr),...
%         segCenter.headCenter_mar_dim_frame(3,fr),'p','DisplayName','HeadXYZ');
%      
%     %Shoulder Markers
%     plot3(segCenter.LShoulderCenter_mar_dim_frame(1,fr),...
%         segCenter.LShoulderCenter_mar_dim_frame(2,fr),...
%         segCenter.LShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','LShoulderXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
%     plot3(segCenter.RShoulderCenter_mar_dim_frame(1,fr),...
%         segCenter.RShoulderCenter_mar_dim_frame(2,fr),...
%         segCenter.RShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','RShoulderXYZ');
%     
%     %Chest Markers
%     plot3(segCenter.chestCenter_mar_dim_frame(1,fr),...
%         segCenter.chestCenter_mar_dim_frame(2,fr),...
%         segCenter.chestCenter_mar_dim_frame(3,fr),'p','DisplayName','ChestXYZ');
%     
%     %Arm Markers
%     plot3(segCenter.LUpperArmCenter_mar_dim_frame(1,fr),...
%         segCenter.LUpperArmCenter_mar_dim_frame(2,fr),...
%         segCenter.LUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','LUpperArmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenter.RUpperArmCenter_mar_dim_frame(1,fr),...
%         segCenter.RUpperArmCenter_mar_dim_frame(2,fr),...
%         segCenter.RUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','RUpperArmXYZ');
%      
%     %Forearm Markers
%     plot3(segCenter.LForearmCenter_mar_dim_frame(1,fr),...
%         segCenter.LForearmCenter_mar_dim_frame(2,fr),...
%         segCenter.LForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','LForearmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenter.RForearmCenter_mar_dim_frame(1,fr),...
%         segCenter.RForearmCenter_mar_dim_frame(2,fr),...
%         segCenter.RForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','RForearmXYZ');
% 
%     %Hand Markers
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
         
%     %Total Body Markers
%     plot3(comXYZ.totalCOMXYZ(1,fr), comXYZ.totalCOMXYZ(2,fr), comXYZ.totalCOMXYZ(3,fr),'ro','DisplayName','TotalXYZ')%'kp','MarkerFaceColor','ro', 'MarkerSize',12)
%     
%     velScale = 10;
%     %quiver - for components x,y,z of the hip, the velocity vector arrows
%     %in 3d are are plotted
%     h_hipsVel = quiver3(segXYZ.hipsXYZ(fr,1), segXYZ.hipsXYZ(fr,2), segXYZ.hipsXYZ(fr,3), hipsVel(fr,1)*velScale, hipsVel(fr,2)*velScale, hipsVel(fr,3)*velScale);
%     h_hipsVel.LineWidth = 3;
%     h_hipsVel.Color = 'r';
%     h_hipsVel.MaxHeadSize = 2;
    
    hold on
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
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% traces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Plots hips position 
%     subplot(numRows, numCols, 4)
%     plot(segXYZ.hipsXYZ)
%     hold on
%     
%     %Traces each x,y,z components with corresponding labels
%     %calls out the x,y,z position of hipsXYZ vector with fr
%     %structure plot(x,y,ID)
%     plot(fr, segXYZ.hipsXYZ(fr,1), 'ko')
%     plot(fr, segXYZ.hipsXYZ(fr,2), 'ro')
%     plot(fr, segXYZ.hipsXYZ(fr,3), 'bo')
%     
%     %Equivalent to previous code except written concisely
%     %plot([fr fr fr], hipsXYZ(fr,:), 'ko')    
%     
%     %Plots hips velocity
%     subplot(numRows, numCols, 5)
%     plot(hipsVel)
%     hold on
%     
%     %Traces each x,y,z components with corresponding labels
%     plot(fr,hipsVel(fr,1), 'ko')
%     plot(fr,hipsVel(fr,2), 'ro')
%     plot(fr,hipsVel(fr,3), 'bo')
%     
%     %Plots hips acceleration
%     subplot(numRows, numCols, 6)
%     plot(hipsAcc)
%     hold on
%     
%     %Traces each x,y,z components with corresponding labels
%     plot(fr,hipsAcc(fr,1), 'ko')
%     plot(fr,hipsAcc(fr,2), 'ro')
%     plot(fr,hipsAcc(fr,3), 'bo')
    %after each frames iteration the code will immediately draw the plot
    drawnow
    
%     %End of video acquisition code
%     frame = getframe(gcf);
%     writeVideo(stepA,frame);
    
end

close(stepA)


