function [segCenter] = calcMarCenter(marker_mar_dim_frame,markerLabels) %,markerID)
%calcMarCenter find the center position for each anatomical segment

%% Head Markers
%Store markers data into marTrajectory for the Head
HeadL = getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadTop = getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadR = getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadFront = getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');

%x values located on corresponding column
headPosX(:,1) =                     HeadL(1,:)';
headPosX(:,2) =                     HeadTop(1,:)';
headPosX(:,3) =                     HeadR(1,:)';
headPosX(:,4) =                     HeadFront(1,:)';
headPosX =                          mean(headPosX,2);

%y values located on corresponding column
headPosY(:,1) =                     HeadL(2,:)';
headPosY(:,2) =                     HeadTop(2,:)';
headPosY(:,3) =                     HeadR(2,:)';
headPosY(:,4) =                     HeadFront(2,:)';
headPosY =                          mean(headPosY,2);

%z values located on corresponding column
headPosZ(:,1) =                     HeadL(3,:)';
headPosZ(:,2) =                     HeadTop(3,:)';
headPosZ(:,3) =                     HeadR(3,:)';
headPosZ(:,4) =                     HeadFront(3,:)';
headPosZ =                          mean(headPosZ,2);

%Center location for the Head
segCenter.headCenter_mar_dim_frame =              (headPosX).';
segCenter.headCenter_mar_dim_frame(2,:) =         (headPosY).';
segCenter.headCenter_mar_dim_frame(3,:) =         (headPosZ).';

%% LShoulder Markers
%Store markers data into segCenter for the LShoulder
LShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

%x values located on corresponding column
LShoulderPosX(:,1) =                LShoulderTop(1,:)';
LShoulderPosX(:,2) =                LShoulderBack(1,:)';
LShoulderPosX =                     mean(LShoulderPosX,2);

%y values located on corresponding column
LShoulderPosY(:,1) =                LShoulderTop(2,:)';
LShoulderPosY(:,2) =                LShoulderBack(2,:)';
LShoulderPosY =                     mean(LShoulderPosY,2);

%z values located on corresponding column
LShoulderPosZ(:,1) =                LShoulderTop(3,:)';
LShoulderPosZ(:,2) =                LShoulderBack(3,:)';
LShoulderPosZ =                     mean(LShoulderPosZ,2);

%Center location for the LShoulder
segCenter.LShoulderCenter_mar_dim_frame =         (LShoulderPosX).';
segCenter.LShoulderCenter_mar_dim_frame(2,:) =    (LShoulderPosY).';
segCenter.LShoulderCenter_mar_dim_frame(3,:) =    (LShoulderPosZ).';

%% RShoulder Markers
%Store markers data into segCenter for the RShoulder
RShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

%x values located on corresponding column
RShoulderPosX(:,1) =                RShoulderTop(1,:)';
RShoulderPosX(:,2) =                RShoulderBack(1,:)';
RShoulderPosX =                     mean(RShoulderPosX,2);

%y values located on corresponding column
RShoulderPosY(:,1) =                RShoulderTop(2,:)';
RShoulderPosY(:,2) =                RShoulderBack(2,:)';
RShoulderPosY =                     mean(RShoulderPosY,2);

%z values located on corresponding column
RShoulderPosZ(:,1) =                RShoulderTop(3,:)';
RShoulderPosZ(:,2) =                RShoulderBack(3,:)';
RShoulderPosZ =                     mean(RShoulderPosZ,2);

%Center location for the RShoulder
segCenter.RShoulderCenter_mar_dim_frame =         (RShoulderPosX).';
segCenter.RShoulderCenter_mar_dim_frame(2,:) =    (RShoulderPosY).';
segCenter.RShoulderCenter_mar_dim_frame(3,:) =    (RShoulderPosZ).';

%% Chest Markers
%Store markers data into segCenter for the Chest
Chest = getMarker(marker_mar_dim_frame,markerLabels,'Chest');
SpineTop = getMarker(marker_mar_dim_frame,markerLabels,'SpineTop');
BackL = getMarker(marker_mar_dim_frame,markerLabels,'BackL');
BackR = getMarker(marker_mar_dim_frame,markerLabels,'BackR');

%x values located on corresponding column
chestPosX(:,1) =                 Chest(1,:)';
chestPosX(:,2) =                 SpineTop(1,:)';
chestPosX(:,3) =                 BackL(1,:)';
chestPosX(:,4) =                 BackR(1,:)';
chestPosX =                      mean(chestPosX,2);

%y values located on corresponding column
chestPosY(:,1) =                 Chest(2,:)';
chestPosY(:,2) =                 SpineTop(2,:)';
chestPosY(:,3) =                 BackL(2,:)';
chestPosY(:,4) =                 BackR(2,:)';
chestPosY =                      mean(chestPosY,2);

%z values located on corresponding column
chestPosZ(:,1) =                 Chest(3,:)';
chestPosZ(:,2) =                 SpineTop(3,:)';
chestPosZ(:,3) =                 BackL(3,:)';
chestPosZ(:,4) =                 BackR(3,:)';
chestPosZ =                      mean(chestPosZ,2);

%Center location for the Chest
segCenter.chestCenter_mar_dim_frame =          (chestPosX).';
segCenter.chestCenter_mar_dim_frame(2,:) =     (chestPosY).';
segCenter.chestCenter_mar_dim_frame(3,:) =     (chestPosZ).';

%% LUpperArm Markers
%Store markers data into segCenter for the LUpperArm
LArm = getMarker(marker_mar_dim_frame,markerLabels,'LArm');
LElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'LElbowOut');

%x values located on corresponding column
LUpperArmPosX(:,1) =                LShoulderPosX(1,:)';
LUpperArmPosX(:,2) =                LArm(1,:)';
LUpperArmPosX(:,3) =                LElbowOut(1,:)';
LUpperArmPosX =                     mean(LUpperArmPosX,2);

%y values located on corresponding column
LUpperArmPosY(:,1) =                LShoulderPosY(1,:)';
LUpperArmPosY(:,2) =                LArm(2,:)';
LUpperArmPosY(:,3) =                LElbowOut(2,:)';
LUpperArmPosY =                     mean(LUpperArmPosY,2);

%z values located on corresponding column
LUpperArmPosZ(:,1) =                LShoulderPosZ(1,:)';
LUpperArmPosZ(:,2) =                LArm(1,:)';
LUpperArmPosZ(:,3) =                LElbowOut(1,:)';
LUpperArmPosZ =                     mean(LUpperArmPosZ,2);

%Center location for the LUpperArm
segCenter.LUpperArmCenter_mar_dim_frame =         (LUpperArmPosX).';
segCenter.LUpperArmCenter_mar_dim_frame(2,:) =    (LUpperArmPosY).';
segCenter.LUpperArmCenter_mar_dim_frame(3,:) =    (LUpperArmPosZ).';

%% RUpperArm Markers
%Store markers data into segCenter for the RUpperArm
RArm = getMarker(marker_mar_dim_frame,markerLabels,'RArm');
RElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'RElbowOut');

%x values located on corresponding column
RUpperArmPosX(:,1) =                RShoulderPosX(1,:)';
RUpperArmPosX(:,2) =                LArm(1,:)';
RUpperArmPosX(:,3) =                LElbowOut(1,:)';
RUpperArmPosX =                     mean(RUpperArmPosX,2);

%y values located on corresponding column
RUpperArmPosY(:,1) =                LShoulderPosY(1,:)';
RUpperArmPosY(:,2) =                LArm(2,:)';
RUpperArmPosY(:,3) =                LElbowOut(2,:)';
RUpperArmPosY =                     mean(RUpperArmPosY,2);

%z values located on corresponding column
RUpperArmPosZ(:,1) =                RShoulderPosZ(1,:)';
RUpperArmPosZ(:,2) =                RArm(1,:)';
RUpperArmPosZ(:,3) =                RElbowOut(1,:)';
RUpperArmPosZ =                     mean(RUpperArmPosZ,2);

%Center location for the RUpperArm
segCenter.RUpperArmCenter_mar_dim_frame =         (RUpperArmPosX).';
segCenter.RUpperArmCenter_mar_dim_frame(2,:) =    (RUpperArmPosY).';
segCenter.RUpperArmCenter_mar_dim_frame(3,:) =    (RUpperArmPosZ).';

%% LForearm Markers
%Store markers data into segCenter for the LForearm
LWristOut = getMarker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristIn = getMarker(marker_mar_dim_frame,markerLabels,'LWristIn');

%x values located on corresponding column
LForearmPosX(:,1) =                 LElbowOut(1,:)';
LForearmPosX(:,2) =                 LWristOut(1,:)';
LForearmPosX(:,3) =                 LWristIn(1,:)';
LForearmPosX =                      mean(LForearmPosX,2);

%y values located on corresponding column
LForearmPosY(:,1) =                 LElbowOut(2,:)';
LForearmPosY(:,2) =                 LWristOut(2,:)';
LForearmPosY(:,3) =                 LWristIn(2,:)';
LForearmPosY =                      mean(LForearmPosY,2);

%z values located on corresponding column
LForearmPosZ(:,1) =                 LElbowOut(3,:)';
LForearmPosZ(:,2) =                 LWristOut(3,:)';
LForearmPosZ(:,3) =                 LWristIn(3,:)';
LForearmPosZ =                      mean(LForearmPosZ,2);

%Center location for the LForearm
segCenter.LForearmCenter_mar_dim_frame =          (LForearmPosX).';
segCenter.LForearmCenter_mar_dim_frame(2,:) =     (LForearmPosY).';
segCenter.LForearmCenter_mar_dim_frame(3,:) =     (LForearmPosZ).';

%% RForearm Markers
%Store markers data into segCenter for the RForearm
RWristOut = getMarker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristIn = getMarker(marker_mar_dim_frame,markerLabels,'RWristIn');

%x values located on corresponding column
RForearmPosX(:,1) =                 RElbowOut(1,:)';
RForearmPosX(:,2) =                 RWristOut(1,:)';
RForearmPosX(:,3) =                 RWristIn(1,:)';
RForearmPosX =                      mean(RForearmPosX,2);

%y values located on corresponding column
RForearmPosY(:,1) =                 RElbowOut(2,:)';
RForearmPosY(:,2) =                 RWristOut(2,:)';
RForearmPosY(:,3) =                 RWristIn(2,:)';
RForearmPosY =                      mean(RForearmPosY,2);

%z values located on corresponding column
RForearmPosZ(:,1) =                 RElbowOut(3,:)';
RForearmPosZ(:,2) =                 RWristOut(3,:)';
RForearmPosX(:,3) =                 RWristIn(3,:)';
RForearmPosZ =                      mean(RForearmPosZ,2);

%Center location for the RForearm
segCenter.RForearmCenter_mar_dim_frame =          (RForearmPosX).';
segCenter.RForearmCenter_mar_dim_frame(2,:) =     (RForearmPosY).';
segCenter.RForearmCenter_mar_dim_frame(3,:) =     (RForearmPosZ).';

%% LHand Markers
%Store markers data into segCenter for the LHand
LHandOut = getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');

%x values located on corresponding column
LHandPosX(:,1) =                 LWristOut(1,:)';
LHandPosX(:,2) =                 LWristIn(1,:)';
LHandPosX(:,3) =                 LHandOut(1,:)';
LHandPosX =                      mean(LHandPosX,2);

%y values located on corresponding column
LHandPosY(:,1) =                 LWristOut(2,:)';
LHandPosY(:,2) =                 LWristIn(2,:)';
LHandPosY(:,3) =                 LHandOut(2,:)';
LHandPosY =                      mean(LHandPosY,2);

%z values located on corresponding column
LHandPosZ(:,1) =                 LWristOut(3,:)';
LHandPosZ(:,2) =                 LWristIn(3,:)';
LHandPosZ(:,3) =                 LHandOut(3,:)';
LHandPosZ =                      mean(LHandPosZ,2);

%Center location for the LHand
segCenter.LHandCenter_mar_dim_frame =          (LHandPosX).';
segCenter.LHandCenter_mar_dim_frame(2,:) =     (LHandPosY).';
segCenter.LHandCenter_mar_dim_frame(3,:) =     (LHandPosZ).';

%% RHand Markers
%Store markers data into segCenter for the RHand
RHandOut = getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');

%x values located on corresponding column
RHandPosX(:,1) =                 RWristOut(1,:)';
RHandPosX(:,2) =                 RWristIn(1,:)';
RHandPosX(:,3) =                 RHandOut(1,:)';
RHandPosX =                      mean(RHandPosX,2);

%y values located on corresponding column
RHandPosY(:,1) =                 RWristOut(2,:)';
RHandPosY(:,2) =                 RWristIn(2,:)';
RHandPosY(:,3) =                 RHandOut(2,:)';
RHandPosY =                      mean(RHandPosY,2);

%z values located on corresponding column
RHandPosZ(:,1) =                 RWristOut(3,:)';
RHandPosZ(:,2) =                 RWristIn(3,:)';
RHandPosZ(:,3) =                 RHandOut(3,:)';
RHandPosZ =                      mean(RHandPosZ,2);

%Center location for the RHand
segCenter.RHandCenter_mar_dim_frame =          (RHandPosX).';
segCenter.RHandCenter_mar_dim_frame(2,:) =     (RHandPosY).';
segCenter.RHandCenter_mar_dim_frame(3,:) =     (RHandPosZ).';


%% Hip Markers
%Store markers data into segCenter for the Hip
WaistLFront = getMarker(marker_mar_dim_frame,markerLabels,'WaistLFront');
WaistLBack= getMarker(marker_mar_dim_frame,markerLabels,'WaistLBack');
WaistRFront = getMarker(marker_mar_dim_frame,markerLabels,'WaistRFront');
WaistRBack = getMarker(marker_mar_dim_frame,markerLabels,'WaistRBack');

%x values located on corresponding column
hipPosX(:,1) =                 WaistLFront(1,:)';
hipPosX(:,2) =                 WaistLBack(1,:)';
hipPosX(:,3) =                 WaistRFront(1,:)';
hipPosX(:,4) =                 WaistRBack(1,:)';
hipPosX =                      mean(hipPosX,2);

%y values located on corresponding column
hipPosY(:,1) =                 WaistLFront(2,:)';
hipPosY(:,2) =                 WaistLBack(2,:)';
hipPosY(:,3) =                 WaistRFront(2,:)';
hipPosY(:,4) =                 WaistRBack(2,:)';
hipPosY =                      mean(hipPosY,2);

%z values located on corresponding column
hipPosZ(:,1) =                 WaistLFront(3,:)';
hipPosZ(:,2) =                 WaistLBack(3,:)';
hipPosZ(:,3) =                 WaistRFront(3,:)';
hipPosZ(:,4) =                 WaistRBack(3,:)';
hipPosZ =                      mean(hipPosZ,2);

%Center location for the Hip
segCenter.hipCenter_mar_dim_frame =          (hipPosX).';
segCenter.hipCenter_mar_dim_frame(2,:) =     (hipPosY).';
segCenter.hipCenter_mar_dim_frame(3,:) =     (hipPosZ).';

%% LThigh Markers
%Store markers data into segCenter for the LThigh
LThigh = getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');

%x values located on corresponding column
LThighPosX(:,1) =                 WaistLFront(1,:)';
LThighPosX(:,2) =                 WaistLBack(1,:)';
LThighPosX(:,3) =                 LThigh(1,:)';
LThighPosX(:,4) =                 LKneeOut(1,:)';
LThighPosX =                      mean(LThighPosX,2);

%y values located on corresponding column
LThighPosY(:,1) =                 WaistLFront(2,:)';
LThighPosY(:,2) =                 WaistLBack(2,:)';
LThighPosY(:,3) =                 LThigh(2,:)';
LThighPosY(:,4) =                 LKneeOut(2,:)';
LThighPosY =                      mean(LThighPosY,2);

%z values located on corresponding column
LThighPosZ(:,1) =                 WaistLFront(3,:)';
LThighPosZ(:,2) =                 WaistLBack(3,:)';
LThighPosZ(:,3) =                 LThigh(3,:)';
LThighPosZ(:,4) =                 LKneeOut(3,:)';
LThighPosZ =                      mean(LThighPosZ,2);

%Center location for the LThigh
segCenter.LThighCenter_mar_dim_frame =          (LThighPosX).';
segCenter.LThighCenter_mar_dim_frame(2,:) =     (LThighPosY).';
segCenter.LThighCenter_mar_dim_frame(3,:) =     (LThighPosZ).';

%% RThigh Markers
%Store markers data into segCenter for the RThigh
RThigh = getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');

%x values located on corresponding column
RThighPosX(:,1) =                 WaistRFront(1,:)';
RThighPosX(:,2) =                 WaistRBack(1,:)';
RThighPosX(:,3) =                 RThigh(1,:)';
RThighPosX(:,4) =                 RKneeOut(1,:)';
RThighPosX =                      mean(RThighPosX,2);

%y values located on corresponding column
RThighPosY(:,1) =                 WaistRFront(2,:)';
RThighPosY(:,2) =                 WaistRBack(2,:)';
RThighPosY(:,3) =                 RThigh(2,:)';
RThighPosY(:,4) =                 RKneeOut(2,:)';
RThighPosY =                      mean(RThighPosY,2);

%z values located on corresponding column
RThighPosZ(:,1) =                 WaistRFront(3,:)';
RThighPosZ(:,2) =                 WaistRBack(3,:)';
RThighPosZ(:,3) =                 RThigh(3,:)';
RThighPosZ(:,4) =                 RKneeOut(3,:)';
RThighPosZ =                      mean(RThighPosZ,2);

%Center location for the RThigh
segCenter.RThighCenter_mar_dim_frame =          (RThighPosX).';
segCenter.RThighCenter_mar_dim_frame(2,:) =     (RThighPosY).';
segCenter.RThighCenter_mar_dim_frame(3,:) =     (RThighPosZ).';

%% LLeg Markers
%Store markers data into segCenter for the LLeg
LShin = getMarker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

%x values located on corresponding column
LLegPosX(:,1) =                 LKneeOut(1,:)';
LLegPosX(:,2) =                 LShin(1,:)';
LLegPosX(:,3) =                 LAnkleOut(1,:)';
LLegPosX =                      mean(LLegPosX,2);

%y values located on corresponding column
LLegPosY(:,1) =                 LKneeOut(2,:)';
LLegPosY(:,2) =                 LShin(2,:)';
LLegPosY(:,3) =                 LAnkleOut(2,:)';
LLegPosY =                      mean(LLegPosY,2);

%z values located on corresponding column
LLegPosZ(:,1) =                 LKneeOut(3,:)';
LLegPosZ(:,2) =                 LShin(3,:)';
LLegPosZ(:,3) =                 LAnkleOut(3,:)';
LLegPosZ =                      mean(LLegPosZ,2);

%Center location for the LLeg
segCenter.LLegCenter_mar_dim_frame =          (LLegPosX).';
segCenter.LLegCenter_mar_dim_frame(2,:) =     (LLegPosY).';
segCenter.LLegCenter_mar_dim_frame(3,:) =     (LLegPosZ).';

%% RLeg Markers
%Store markers data into segCenter for the RLeg
RShin = getMarker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

%x values located on corresponding column
RLegPosX(:,1) =                 RKneeOut(1,:)';
RLegPosX(:,2) =                 RShin(1,:)';
RLegPosX(:,3) =                 RAnkleOut(1,:)';
RLegPosX =                      mean(RLegPosX,2);

%y values located on corresponding column
RLegPosY(:,1) =                 RKneeOut(2,:)';
RLegPosY(:,2) =                 RShin(2,:)';
RLegPosY(:,3) =                 RAnkleOut(2,:)';
RLegPosY =                      mean(RLegPosY,2);

%z values located on corresponding column
RLegPosZ(:,1) =                 RKneeOut(3,:)';
RLegPosZ(:,2) =                 RShin(3,:)';
RLegPosZ(:,3) =                 RAnkleOut(3,:)';
RLegPosZ =                      mean(RLegPosZ,2);

%Center location for the RLeg
segCenter.RLegCenter_mar_dim_frame =          (RLegPosX).';
segCenter.RLegCenter_mar_dim_frame(2,:) =     (RLegPosY).';
segCenter.RLegCenter_mar_dim_frame(3,:) =     (RLegPosZ).';

%% LFoot Markers
%Store markers data into segCenter for the LFoot
LHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'LHeelBack');
LForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');
LToeTip = getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LForefootIn = getMarker(marker_mar_dim_frame,markerLabels,'LForefootIn');

%x values located on corresponding column
LFootPosX(:,1) =                 LAnkleOut(1,:)';
LFootPosX(:,2) =                 LHeelBack(1,:)';
LFootPosX(:,3) =                 LForefootOut(1,:)';
LFootPosX(:,4) =                 LToeTip(1,:)';
LFootPosX(:,5) =                 LForefootIn(1,:)';
LFootPosX =                      mean(LFootPosX,2);

%y values located on corresponding column
LFootPosY(:,1) =                 LAnkleOut(2,:)';
LFootPosY(:,2) =                 LHeelBack(2,:)';
LFootPosY(:,3) =                 LForefootOut(2,:)';
LFootPosY(:,4) =                 LToeTip(2,:)';
LFootPosY(:,5) =                 LForefootIn(2,:)';
LFootPosY =                      mean(LFootPosY,2);

%z values located on corresponding column
LFootPosZ(:,1) =                 LAnkleOut(3,:)';
LFootPosZ(:,2) =                 LHeelBack(3,:)';
LFootPosZ(:,3) =                 LForefootOut(3,:)';
LFootPosZ(:,4) =                 LToeTip(3,:)';
LFootPosZ(:,5) =                 LForefootIn(3,:)';
LFootPosZ =                      mean(LFootPosZ,2);

%Center location for the LFoot
segCenter.LFootCenter_mar_dim_frame =          (LFootPosX).';
segCenter.LFootCenter_mar_dim_frame(2,:) =     (LFootPosY).';
segCenter.LFootCenter_mar_dim_frame(3,:) =     (LFootPosZ).';

%% RFoot Markers
%Store markers data into segCenter for the RFoot
RHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'RHeelBack');
RForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'RForefootOut');
RToeTip = getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RForefootIn = getMarker(marker_mar_dim_frame,markerLabels,'RForefootIn');

%x values located on corresponding column
RFootPosX(:,1) =                 RAnkleOut(1,:)';
RFootPosX(:,2) =                 RHeelBack(1,:)';
RFootPosX(:,3) =                 RForefootOut(1,:)';
RFootPosX(:,4) =                 RToeTip(1,:)';
RFootPosX(:,5) =                 RForefootIn(1,:)';
RFootPosX =                      mean(RFootPosX,2);

%y values located on corresponding column
RFootPosY(:,1) =                 RAnkleOut(2,:)';
RFootPosY(:,2) =                 RHeelBack(2,:)';
RFootPosY(:,3) =                 RForefootOut(2,:)';
RFootPosY(:,4) =                 RToeTip(2,:)';
RFootPosY(:,5) =                 RForefootIn(2,:)';
RFootPosY =                      mean(RFootPosY,2);

%z values located on corresponding column
RFootPosZ(:,1) =                 RAnkleOut(3,:)';
RFootPosZ(:,2) =                 RHeelBack(3,:)';
RFootPosZ(:,3) =                 RForefootOut(3,:)';
RFootPosZ(:,4) =                 RToeTip(3,:)';
RFootPosZ(:,5) =                 RForefootIn(3,:)';
RFootPosZ =                      mean(RFootPosZ,2);

%Center location for the RFoot
segCenter.RFootCenter_mar_dim_frame =          (RFootPosX).';
segCenter.RFootCenter_mar_dim_frame(2,:) =     (RFootPosY).';
segCenter.RFootCenter_mar_dim_frame(3,:) =     (RFootPosZ).';


end
