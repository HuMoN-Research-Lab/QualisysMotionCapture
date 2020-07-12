function [segCenter,marTrajectory] = calcSegCenter(marker_mar_dim_frame,markerLabels) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegXYZPosition function outputs XYZ position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% XYZ head position
%initial conditions for head position

segCenter= [];
marTrajectory = [];

%Store markers data into marTrajectory for the head
marTrajectory.HeadL = getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
marTrajectory.HeadTop = getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
marTrajectory.HeadR = getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
marTrajectory.HeadFront = getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');

%x values located on corresponding row
% marTrajectory.HeadCenter.x = marTrajectory.HeadL(1,:);
% marTrajectory.HeadCenter.x(2,:) = marTrajectory.HeadTop(1,:);
% marTrajectory.HeadCenter.x(3,:) = marTrajectory.HeadR(1,:);
% marTrajectory.HeadCenter.x(4,:) = marTrajectory.HeadR(1,:);

%x values located on corresponding column
marTrajectory.HeadCenter.x(:,1) = marTrajectory.HeadL(1,:)';
marTrajectory.HeadCenter.x(:,2) = marTrajectory.HeadTop(1,:)';
marTrajectory.HeadCenter.x(:,3) = marTrajectory.HeadR(1,:)';
marTrajectory.HeadCenter.x(:,4) = marTrajectory.HeadFront(1,:)';
marTrajectory.HeadCenter.x = mean(marTrajectory.HeadCenter.x,2);

%y values located on corresponding column
marTrajectory.HeadCenter.y(:,1) = marTrajectory.HeadL(2,:)';
marTrajectory.HeadCenter.y(:,2) = marTrajectory.HeadTop(2,:)';
marTrajectory.HeadCenter.y(:,3) = marTrajectory.HeadR(2,:)';
marTrajectory.HeadCenter.y(:,4) = marTrajectory.HeadFront(2,:)';
marTrajectory.HeadCenter.y = mean(marTrajectory.HeadCenter.x,2);

%z values located on corresponding column
marTrajectory.HeadCenter.z(:,1) = marTrajectory.HeadL(3,:)';
marTrajectory.HeadCenter.z(:,2) = marTrajectory.HeadTop(3,:)';
marTrajectory.HeadCenter.z(:,3) = marTrajectory.HeadR(3,:)';
marTrajectory.HeadCenter.z(:,4) = marTrajectory.HeadFront(3,:)';
marTrajectory.HeadCenter.z = mean(marTrajectory.HeadCenter.x,3);

%% Storage of all x,y,z values in HeadCenter variable 

marTrajectory.HeadCenter = (marTrajectory.HeadCenter.x).';
marTrajectory.HeadCenter(2,:) = (marTrajectory.HeadCenter.y).';
marTrajectory.HeadCenter(3,:) = (marTrajectory.HeadCenter.z).';

% ACQUISITION OF SEG CENTER NOT READY YET
%segCenter.headCenter_mar_dim_frame = squeeze(mean([marTrajectory.HeadL marTrajectory.HeadTop...
%    marTrajectory.HeadR marTrajectory.HeadFront]));

%Previous code that still works!
headA = 1;
headB = 4;
headIDs = headA:headB;

%headCenter acquisition
segCenter.headCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :)));


%% XYZ shoulder positions
%Store markers data into marTrajectory for the LShoulder
marTrajectory.LShoulderTop= getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
marTrajectory.LShoulderBack= getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

%LShoulder initial position
LShoulderA = 5;
LShoulderB = 6;
LShoulderIDs = LShoulderA:LShoulderB;

%LShoulderCenter calculation
segCenter.LShoulderCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LShoulderIDs, 1:3, :)));

%Store markers data into marTrajectory for the RShoulder
marTrajectory.RShoulderTop= getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
marTrajectory.RShoulderBack= getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

%RShoulder initial position
RShoulderA = 12;
RShoulderB = 13;
RShoulderIDs = RShoulderA:RShoulderB;

%RShoulderCenter calculation
segCenter.RShoulderCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RShoulderIDs, 1:3, :)));

%% XYZ chest positions
%Chest initial conditions
chestA = 19;
chestB = 21;
chestC = 22;
chestIDs = [chestA chestB chestC];

%ChestCenter calculation
segCenter.chestCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(chestIDs, 1:3, :)));

%% XYZ upper arm positions
%LArm initial conditions
LUpperArmA = 7;
LUpperArmB = 8;
LUpperArmIDs = LUpperArmA:LUpperArmB;

%LArmXYZ calculation
segCenter.LUpperArmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LUpperArmIDs, 1:3, :)));

%RArm initial conditions
RUpperArmA = 14;
RUpperArmB = 15;
RUpperArmIDs = RUpperArmA:RUpperArmB;

%RArmXYZ calculation
segCenter.RUpperArmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RUpperArmIDs, 1:3, :)));

%% XYZ forearm positions
%LForearm initial conditions
LForearmA = 8;
LForearmB = 10;
LForearmIDs = LForearmA:LForearmB;

%LForearmXYZ calculation
segCenter.LForearmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LForearmIDs, 1:3, :)));

%RForearm initial conditions
RForearmA = 15;
RForearmB = 17;
RForearmIDs = RForearmA:RForearmB;

%RForearmXYZ calculation
segCenter.RForearmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RForearmIDs, 1:3, :)));

%% XYZ hand positions
%LHand initial conditions
LHandA = 9;
LHandB = 11;
LHandIDs = LHandA:LHandB;

%LHandXYZ calculation
segCenter.LHandCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LHandIDs, 1:3, :)));

%RHand initial conditions
RHandA = 16;
RHandB = 18;
RHandIDs = RHandA:RHandB;

%RHandXYZ calculation
segCenter.RHandCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RHandIDs, 1:3, :)));

%% XYZ hip positions
%hip initial conditions
hipA = 23;
hipB = 26;
hipsIDs = hipA:hipB;

%hipsXYZ calculation
segCenter.hipsCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(hipsIDs, 1:3, :)));

%% XYZ thigh calculations 
%LThigh initial conditions
LThighA = 27;
LThighB = 28;
LThighIDs = [LThighA LThighB];

%LThighXYZ calculation
segCenter.LThighCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LThighIDs, 1:3, :)));


%RThigh initial conditions
RThighA = 35;
RThighB = 36;
RThighIDs = [RThighA RThighB];

%RThighXYZ calculation
segCenter.RThighCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RThighIDs, 1:3, :)));

%% XYZ leg calculations
%LLeg initial conditions
LLegA = 28;
LLegB = 30;
LLegIDs = [LLegA LLegB];

%LLegXYZ calculations
segCenter.LLegCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LLegIDs, 1:3, :)));

%RLeg initial conditions
RLegA = 36;
RLegB = 38;
RLegIDs = [RLegA RLegB];

%RLegXYZ calculations
segCenter.RLegCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RLegIDs, 1:3, :)));

%% XYZ foot calculations
%LFoot initial conditions
LFootA = 30;
LFootB = 34;
LFootIDs = LFootA:LFootB;

%LFootXYZ calculation
segCenter.LFootCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LFootIDs, 1:3, :)));

%RFoot initial conditions
RFootA = 38;
RFootB = 42;
RFootIDs = RFootA:RFootB;

%RFootXYZ calculation
segCenter.RFootCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RFootIDs, 1:3, :)));

end

