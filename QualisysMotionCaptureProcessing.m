%% MATLAB Motion Capture Data Acquisition
%closes all open graphs
close all

%deletes all variables
clearvars

%clears the path and establishes a new folder pathw
restoredefaultpath
addpath(genpath(cd))

%% load acquired motion capture data
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

[thighCOMx, thighCOMy, thighCOMz] = CalculateCOM(marker_mar_dim_frame, markerLabels);

%% Vaughan Equations for Body Segmentation
%length of foot and malleolus height need to be found for EQ's

%Reg EQ for Foot about Flexion-Extension Axis
% inertiaFootFlexionExtension = 0.00023*totalMass...
%     (4*malleolusHeight^2+3*lengthFoot^2)+0.00022)

%Reg EQ for Foot about Abduction-Adduction Axis

%Reg EQ for Foot about Internal-External rotation


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
hipIDs = 23:26;

%acquires mean value for the hips data
hipsMean =  squeeze(mean(squeeze(marker_mar_dim_frame(hipIDs, 1:3, :)),1))';

%Error: Unrecognized function or variable 'hipsAcc'
%calculates velocity of hips
hipsVel =  [0 0 0; diff(hipsMean)];

%calculates acceleration of hips
hipsAcc = [0 0 0; diff(hipsVel)];


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
    
    %plots column 1(x), 2(y), 3(z) for the hipIDs
    plot3(marker_mar_dim_frame(hipIDs, 1, fr),...
        marker_mar_dim_frame(hipIDs, 2, fr),...
        marker_mar_dim_frame(hipIDs, 3, fr),'ro','MarkerFaceColor','r','MarkerSize',3)
    
    plot3(marker_mar_dim_frame(thighIDs, 1, fr),...
        marker_mar_dim_frame(thighIDs, 2, fr),...
        marker_mar_dim_frame(thighIDs, 3, fr),'mo','MarkerFaceColor','m','MarkerSize',3)
    
    %plots approximate center of mass for the hips in 3D
    plot3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3),'kp','MarkerFaceColor','m', 'MarkerSize',12)
        
    velScale = 100;
    %quiver - for components x,y,z of the hip, the velocity vector arrows
    %in 3d are are plotted
    h_hipsVel = quiver3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3), hipsVel(fr,1)*velScale, hipsVel(fr,2)*velScale, hipsVel(fr,3)*velScale);
    h_hipsVel.LineWidth = 3;
    h_hipsVel.Color = 'r';
    h_hipsVel.MaxHeadSize = 2;
    
    hold on
    axis equal
    
    grid on
    
    %optimal x y z graph limits 
    xlim([0 2e3])
    ylim([-5e3 10e3])
    zlim([0 3e3])
    
    %unsure of what this section means
    az = -84.362;
    el =  20.417;
    
    
    view(az,el)
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% traces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Plots hips position 
    subplot(numRows, numCols, 4)
    plot(hipsMean)
    hold on
    
    %Traces each x,y,z components with corresponding labels
    %calls out the x,y,z position of hipsMean vector with fr
    %structure plot(x,y,ID)
    plot(fr, hipsMean(fr,1), 'ko')
    plot(fr, hipsMean(fr,2), 'ro')
    plot(fr, hipsMean(fr,3), 'bo')
    
    %Equivalent to previous code except written concisely
    %plot([fr fr fr], hipsMean(fr,:), 'ko')    
    
    %Plots hips velocity
    subplot(numRows, numCols, 5)
    plot(hipsVel)
    hold on
    
    %Traces each x,y,z components with corresponding labels
    plot(fr,hipsVel(fr,1), 'ko')
    plot(fr,hipsVel(fr,2), 'ro')
    plot(fr,hipsVel(fr,3), 'bo')
    
    %Plots hips acceleration
    subplot(numRows, numCols, 6)
    plot(hipsAcc)
    hold on
    
    %Traces each x,y,z components with corresponding labels
    plot(fr,hipsAcc(fr,1), 'ko')
    plot(fr,hipsAcc(fr,2), 'ro')
    plot(fr,hipsAcc(fr,3), 'bo')
    %after each frames iteration the code will immediately draw the plot
    drawnow
end


