%% MATLAB Motion Capture Data Acquisition MASTER
%closes all open graphs
close all

%clears all variables
clearvars

%Locates github path and connects subfolders to code
cd '/Users/MT/Documents/Github/MotionCapture_MATLABCode'
addpath(genpath(cd))

%% Load acquired motion capture data
fileName = '2020-02-04_JSM_Walking0001';
%fileName = '2020-02-04_JSM_Slackline0006';

%load file type of fileName and store into data variable
data  = load([fileName '.mat']);


%strrep replaces substring of fileName with consistent naming convention
data = data.(['qtm_' strrep(fileName, '-', '_')]);

%store force plate, frame number, and frame rate values into vars
numForcePlates = length(data.Force);
numFrames = data.Frames;
framerate = data.FrameRate;

%stores labeled trajectory data, marker labels, marker numbers into vars
marker_mar_dim_frameRAW = data.Trajectories.Labeled.Data;
markerLabels = data.Trajectories.Labeled.Labels;
numMarkers = data.Trajectories.Labeled.Count;
marker_mar_dim_frame = marker_mar_dim_frameRAW; 

%% Initial conditions for test subject
%bodyMass should be in kg and height in metric units (mm)
%input test subjects height
mmHeight = 1778; %(mm)

lbsWeight = 160; %(lbs weight)

%Initial condition functions draft
kgMass = lbs2kg(lbsWeight);

%Modify
% ftHeight = cm2ft(cmHeight);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%FUNCTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bodySegLength function
% Function outputs length for individual body segs
[bodySegLength] = calcBodySegLength(mmHeight);

%% bodySegMass function Calculation
% Function outputs mass for individual body segs
[bodySegMass] = calcBodySegMass(kgMass);

%% segXYZPosition function 
% Function outputs XYZ position of x, y, z coordinates of body segs
[markerXYZ] = getMarker(marker_mar_dim_frame,markerLabels);
[segCenter] = calcSegCenter(marker_mar_dim_frame,markerXYZ); %, markerLabels);

%% COM of seg
[totalCOMXYZ] = calcCOM(segCenter,bodySegMass); %markerLabels)

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

if numForcePlates > 0
    figure(3626)
    
    for ff = 1:numForcePlates
        subplot(2,3,ff)
        plot(squeeze(cop_fp_dim_fr(ff,:,:)))
    end
    
    figure(764)
    
    for ff = 1:numForcePlates
        subplot(2,3,ff)
        plot(squeeze(moment_fp_dim_fr(ff,:,:)))
    end
end

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

%for frames 1:numFrames at interval of 10
for fr = 1:10:numFrames
    %clears the current figures to avoid plotting data over each other
    clf
    
    %determines how many rows and columns a figure will have
    numRows = 2;
    numCols = 3;
    
    subplot(numRows, numCols, 1:3)
    
    %column 1(x), 2(y), 3(z)
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    %facilitates plotting hipIDs on top of points
    hold on
    
%     %plots column 1(x), 2(y), 3(z) for the hipIDs
%     plot3(marker_mar_dim_frame(hipIDs, 1, fr),...
%         marker_mar_dim_frame(hipIDs, 2, fr),...
%         marker_mar_dim_frame(hipIDs, 3, fr),'ro','MarkerFaceColor','r','MarkerSize',3)
    
%     plot3(marker_mar_dim_frame(thighIDs, 1, fr),...
%         marker_mar_dim_frame(thighIDs, 2, fr),...
%         marker_mar_dim_frame(thighIDs, 3, fr),'mo','MarkerFaceColor','m','MarkerSize',3)
%     
    %% COM for the all body components in 3D
%     %Head Markers
%     plot3(segCenters.headXYZ(fr,1), segCenters.headXYZ(fr,2), segCenters.headXYZ(fr,3),'p','DisplayName','HeadXYZ')%'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Shoulder Markers
%     plot3(segCenters.LShoulderXYZ(fr,1), segCenters.LShoulderXYZ(fr,2), segCenters.LShoulderXYZ(fr,3),'p','DisplayName','LShoulder')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
%     plot3(segCenters.RShoulderXYZ(fr,1), segCenters.RShoulderXYZ(fr,2), segCenters.RShoulderXYZ(fr,3),'p','DisplayName','RShoulder')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Arm Markers
%     plot3(segCenters.LUpperArmXYZ(fr,1), segCenters.LUpperArmXYZ(fr,2), segCenters.LUpperArmXYZ(fr,3),'p','DisplayName','LUpperArm') %,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
%     plot3(segCenters.RUpperArmXYZ(fr,1), segCenters.RUpperArmXYZ(fr,2), segCenters.RUpperArmXYZ(fr,3),'p','DisplayName','RUpperArm')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Forearm Markers
%     plot3(segCenters.LForearmXYZ(fr,1), segCenters.LForearmXYZ(fr,2), segCenters.LForearmXYZ(fr,3),'p','DisplayName','LForearm')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenters.RForearmXYZ(fr,1), segCenters.RForearmXYZ(fr,2), segCenters.RForearmXYZ(fr,3),'p','DisplayName','RForearm')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
% 
%     %Hand Markers
%     plot3(segCenters.LHandXYZ(fr,1), segCenters.LHandXYZ(fr,2), segCenters.LHandXYZ(fr,3),'p','DisplayName','LHand')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenters.RHandXYZ(fr,1), segCenters.RHandXYZ(fr,2), segCenters.RHandXYZ(fr,3),'p','DisplayName','RHand')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Hip Markers
%     plot3(segCenters.hipsXYZ(fr,1), segCenters.hipsXYZ(fr,2), segCenters.hipsXYZ(fr,3),'p','DisplayName','Hips')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Thigh Markers
%     plot3(segCenters.LThighXYZ(fr,1), segCenters.LThighXYZ(fr,2), segCenters.LThighXYZ(fr,3),'p','DisplayName','LThigh')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenters.RThighXYZ(fr,1), segCenters.RThighXYZ(fr,2), segCenters.RThighXYZ(fr,3),'p','DisplayName','RThigh')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
% 
%     %Leg Markers
%     plot3(segCenters.LLegXYZ(fr,1), segCenters.LLegXYZ(fr,2), segCenters.LLegXYZ(fr,3),'p','DisplayName','LLeg')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     plot3(segCenters.RLegXYZ(fr,1), segCenters.RLegXYZ(fr,2), segCenters.RLegXYZ(fr,3),'p','DisplayName','RLeg')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
%     %Foot Markers
%     plot3(segCenters.LFootXYZ(fr,1), segCenters.LFootXYZ(fr,2), segCenters.LFootXYZ(fr,3),'p','DisplayName','LFoot')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)   
%     plot3(segCenters.RFootXYZ(fr,1), segCenters.RFootXYZ(fr,2), segCenters.RFootXYZ(fr,3),'p','DisplayName','RFoot')%,'kp','MarkerFaceColor','m', 'MarkerSize',12)
%     
    %Total Body Markers
    plot3(comXYZ.totalCOMXYZ(1,fr), comXYZ.totalCOMXYZ(2,fr), comXYZ.totalCOMXYZ(3,fr),'ro','DisplayName','TotalXYZ')%'kp','MarkerFaceColor','ro', 'MarkerSize',12)
    
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
%    ylim([-5e3 10e3]) %full lab
    ylim([1e3 3e3]) %smaller space
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
end


