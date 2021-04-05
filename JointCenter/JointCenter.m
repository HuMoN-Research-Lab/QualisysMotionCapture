clear all;
%% Load in Segment Centers
segments = load('segCenter.mat');%Load in file
LeftThighSegment  = segments.segCenter.LThighCenter_mar_dim_frame;%Access the Segment of Interest from the struct
%% Load in Markers
markers= load('02_21_2020_Walking_Calibration.mat');%Load in the marker data file
marker = markers.qtm_02_21_2020_Walking_Calibration.Trajectories.Labeled.Data;%Access the marker struct
%% Load in each marker and then find the average (You would change this Depending on the joint)
marker1 = squeeze(marker(23,:,:));%WaistLFront
marker2 = squeeze(marker(24,:,:));%WaistLBabk
marker3 = squeeze(marker(21,:,:));%BackL
marker4 = squeeze(marker(27,:,:));%LThigh
marker5 = squeeze(marker(28,:,:));%LKneeOut
marker6 = squeeze(marker(29,:,:));%LShin

%Put markers into array
allXMarkers = [marker1(1,:);marker2(1,:);marker3(1,:);marker4(1,:);marker5(1,:);marker5(1,:);marker6(1,:)];
allYMarkers = [marker1(2,:);marker2(2,:);marker3(2,:);marker4(2,:);marker5(2,:);marker5(2,:);marker6(2,:)];
allZMarkers = [marker1(3,:);marker2(3,:);marker3(3,:);marker4(3,:);marker5(3,:);marker5(3,:);marker6(3,:)];

%Average position of the markers around the joint
XMarkerMeans = mean(allXMarkers);
YMarkerMeans = mean(allYMarkers);
ZMarkerMeans = mean(allZMarkers);

%Create variables for function
JointMarkerMean = [XMarkerMeans; YMarkerMeans;ZMarkerMeans];%Put Joint Center Guess into variable one vector
SegmentCenters = LeftThighSegment;%Put Segment Centers here (Would change this obviously for when finding different joint centers)
InitialGuess = [0;0;0];%Initial Guess of how much the JointGuess vector is wrong

%Call error function from JointCenterErrorFun.M (the @ means that the JointCenterGuess will be changing for each iteration of the optimizer) 
JointCenterError = @(JointCenterGuess) JointCenterErrorFun(SegmentCenters, JointCenterGuess, JointMarkerMean);

%Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A = [];
b = [];
Aeq = [];
beq = [];
lb = 0;
ub = 1;

%Run optimizer (IDK what the A, b, Aeq and beq are, lb and ub are lower and
%upper bound the Initial Guess intializes the optimizer to firt run the
%error function with those initial conditions
[jointCenterDifference, jointCenterErr] = fmincon(JointCenterError, InitialGuess,A,b,Aeq,beq,lb,ub,[],opts);
% jointCenterDifference = what it solves the joint center out to be. Most
% optimal jointCenterGuess. How far away in the x, y, z it is?

%This is to get the correct coordinates as the JointCenterDifference that
%is returned from the optimizer is how much you have to translate the
%Initial 'Guess'
jointCenters = [(jointCenterDifference(1)+ XMarkerMeans);(jointCenterDifference(2)+ YMarkerMeans);(jointCenterDifference(3)+ ZMarkerMeans)]; 

%This is my bad attempt at plottng the joint center and segment center
f = figure(237283);
for ff = 1:20:length(XMarkerMeans)
    clf
    plot3(LeftThighSegment(1,ff),LeftThighSegment(2,ff),LeftThighSegment(3,ff),'k.','MarkerFaceColor','k','MarkerSize',25)
    hold on
    plot3(jointCenters(1,ff),jointCenters(2,ff),jointCenters(3,ff),'r.','MarkerFaceColor','r','MarkerSize',25)
    %drawLine3d([topMean(fr,:), differenceIntTopAndBottomMean(fr,:],'LineWidth',3,'Color','r')
    axis equal
    az = -70.362;
    el =  19.417;
    xlim([0 1.5e3])
    ylim([-3e3 4e3])
    zlim([400 900])
    view(az,el)
    grid on
end
