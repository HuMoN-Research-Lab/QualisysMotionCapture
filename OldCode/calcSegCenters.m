function [segCenters] = calcSegCenter(marker_mar_dim_frame) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegXYZPosition function outputs XYZ position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% XYZ head position
%initial conditions for head position

% if markerLabels{1} == ('HeadL');
%     headL = data.
%Start of segXYZ struct

segCenters= [];

headA = 1;
headB = 4;
headIDs = headA:headB;

%headCenters acquisition
segCenters.headCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :)));


%% XYZ shoulder positions
%LShoulder initial position
LShoulderA = 5;
LShoulderB = 6;
LShoulderIDs = LShoulderA:LShoulderB;

%LShoulderCenter calculation
segCenters.LShoulderCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LShoulderIDs, 1:3, :)));

%RShoulder initial position
RShoulderA = 12;
RShoulderB = 13;
RShoulderIDs = RShoulderA:RShoulderB;

%RShoulderCenter calculation
segCenters.RShoulderCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RShoulderIDs, 1:3, :)));

%% XYZ chest positions
%Chest initial conditions
chestA = 19;
chestB = 21;
chestC = 22;
chestIDs = [chestA chestB chestC];

%ChestCenter calculation
segCenters.chestCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(chestIDs, 1:3, :)));

%% XYZ upper arm positions
%LArm initial conditions
LUpperArmA = 7;
LUpperArmB = 8;
LUpperArmIDs = LUpperArmA:LUpperArmB;

%LArmXYZ calculation
segCenters.LUpperArmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LUpperArmIDs, 1:3, :)));

%RArm initial conditions
RUpperArmA = 14;
RUpperArmB = 15;
RUpperArmIDs = RUpperArmA:RUpperArmB;

%RArmXYZ calculation
segCenters.RUpperArmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RUpperArmIDs, 1:3, :)));

%% XYZ forearm positions
%LForearm initial conditions
LForearmA = 8;
LForearmB = 10;
LForearmIDs = LForearmA:LForearmB;

%LForearmXYZ calculation
segCenters.LForearmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LForearmIDs, 1:3, :)));

%RForearm initial conditions
RForearmA = 15;
RForearmB = 17;
RForearmIDs = RForearmA:RForearmB;

%RForearmXYZ calculation
segCenters.RForearmCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RForearmIDs, 1:3, :)));

%% XYZ hand positions
%LHand initial conditions
LHandA = 9;
LHandB = 11;
LHandIDs = LHandA:LHandB;

%LHandXYZ calculation
segCenters.LHandCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LHandIDs, 1:3, :)));

%RHand initial conditions
RHandA = 16;
RHandB = 18;
RHandIDs = RHandA:RHandB;

%RHandXYZ calculation
segCenters.RHandCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RHandIDs, 1:3, :)));

%% XYZ hip positions
%hip initial conditions
hipA = 23;
hipB = 26;
hipsIDs = hipA:hipB;

%hipsXYZ calculation
segCenters.hipsCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(hipsIDs, 1:3, :)));

%% XYZ thigh calculations 
%LThigh initial conditions
LThighA = 27;
LThighB = 28;
LThighIDs = [LThighA LThighB];

%LThighXYZ calculation
segCenters.LThighCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LThighIDs, 1:3, :)));


%RThigh initial conditions
RThighA = 35;
RThighB = 36;
RThighIDs = [RThighA RThighB];

%RThighXYZ calculation
segCenters.RThighCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RThighIDs, 1:3, :)));

%% XYZ leg calculations
%LLeg initial conditions
LLegA = 28;
LLegB = 30;
LLegIDs = [LLegA LLegB];

%LLegXYZ calculations
segCenters.LLegCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LLegIDs, 1:3, :)));

%RLeg initial conditions
RLegA = 36;
RLegB = 38;
RLegIDs = [RLegA RLegB];

%RLegXYZ calculations
segCenters.RLegCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RLegIDs, 1:3, :)));

%% XYZ foot calculations
%LFoot initial conditions
LFootA = 30;
LFootB = 34;
LFootIDs = LFootA:LFootB;

%LFootXYZ calculation
segCenters.LFootCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(LFootIDs, 1:3, :)));

%RFoot initial conditions
RFootA = 38;
RFootB = 42;
RFootIDs = RFootA:RFootB;

%RFootXYZ calculation
segCenters.RFootCenter_mar_dim_frame = squeeze(mean(marker_mar_dim_frame(RFootIDs, 1:3, :)));

end

