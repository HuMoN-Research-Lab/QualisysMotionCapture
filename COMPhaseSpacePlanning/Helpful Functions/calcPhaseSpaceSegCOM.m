function [segCenter] = calcPhaseSpaceSegCOM(marker_mar_dim_frame,markerLabels) %,markerID)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcSegCOM find the center position for each anatomical segment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
segCenter = [];

%% Head Markers
%Store markers data into segCenter for the Head
%Includes: HeadL, HeadTop, HeadR, and HeadFront
HeadFrontL = getMarker(marker_mar_dim_frame,markerLabels,'LFHD');
HeadFrontR = getMarker(marker_mar_dim_frame,markerLabels,'RFHD');
HeadBackL = getMarker(marker_mar_dim_frame,markerLabels,'LBHD');
HeadBackR = getMarker(marker_mar_dim_frame,markerLabels,'RBHD');

%x values located on corresponding column
headPosX(:,1) =                     HeadFrontL(1,:)';
headPosX(:,2) =                     HeadFrontR(1,:)';
headPosX(:,3) =                     HeadBackL(1,:)';
headPosX(:,4) =                     HeadBackR(1,:)';
headPosX =                          mean(headPosX,2);

%y values located on corresponding column
headPosY(:,1) =                     HeadFrontL(2,:)';
headPosY(:,2) =                     HeadFrontR(2,:)';
headPosY(:,3) =                     HeadBackL(2,:)';
headPosY(:,4) =                     HeadBackR(2,:)';
headPosY =                          mean(headPosY,2);

%z values located on corresponding column
headPosZ(:,1) =                     HeadFrontL(2,:)';
headPosZ(:,2) =                     HeadFrontR(2,:)';
headPosZ(:,3) =                     HeadBackL(2,:)';
headPosZ(:,4) =                     HeadBackR(2,:)';
headPosZ =                          mean(headPosZ,2);


%Center location for the Head
segCenter.headCenter_mar_dim_frame =              (headPosX).';
segCenter.headCenter_mar_dim_frame(2,:) =         (headPosY).';
segCenter.headCenter_mar_dim_frame(3,:) =         (headPosZ).';

%% LShoulder Markers
%Store markers data into segCenter for the LShoulder
%Includes: LShoulder
LShoulder = getMarker(marker_mar_dim_frame,markerLabels,'LSHO');
% LShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

segCenter.LShoulderCenter_mar_dim_frame =         LShoulder;

%% RShoulder Markers
%Store markers data into segCenter for the RShoulder
%Includes RShoulderTop and RShoulderBack
RShoulder = getMarker(marker_mar_dim_frame,markerLabels,'RSHO');
% RShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

segCenter.RShoulderCenter_mar_dim_frame =         RShoulder;

%% Chest Markers
%Store markers data into segCenter for the Chest
%Includes: Chest, SpineTop, BackL, and BackR
BackUpper  = getMarker(marker_mar_dim_frame,markerLabels,'C7');
BackLower  = getMarker(marker_mar_dim_frame,markerLabels,'T10');
TorsoUpper = getMarker(marker_mar_dim_frame,markerLabels,'CLAV');
TorsoMid   = getMarker(marker_mar_dim_frame,markerLabels,'STRN');


%x values located on corresponding column
chestPosX(:,1) =                 BackLower(1,:)';
chestPosX(:,2) =                 BackUpper(1,:)';
chestPosX(:,3) =                 TorsoUpper(1,:)';
chestPosX(:,4) =                 TorsoMid(1,:)';
chestPosX =                      mean(chestPosX,2);

%y values located on corresponding column
chestPosY(:,1) =                 BackLower(2,:)';
chestPosY(:,2) =                 BackUpper(2,:)';
chestPosY(:,3) =                 TorsoUpper(2,:)';
chestPosY(:,4) =                 TorsoMid(2,:)';
chestPosY =                      mean(chestPosY,2);

%z values located on corresponding column
chestPosZ(:,1) =                 BackLower(3,:)';
chestPosZ(:,2) =                 BackUpper(3,:)';
chestPosZ(:,3) =                 TorsoUpper(3,:)';
chestPosZ(:,4) =                 TorsoMid(3,:)';
chestPosZ =                      mean(chestPosZ,2);

%Center location for the Chest
segCenter.chestCenter_mar_dim_frame =          (chestPosX).';
segCenter.chestCenter_mar_dim_frame(2,:) =     (chestPosY).';
segCenter.chestCenter_mar_dim_frame(3,:) =     (chestPosZ).';

%% LUpperArm Markers
%Store markers data into segCenter for the LUpperArm
%Includes: LShoulder and LELB
LElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'LELB');

%x values located on corresponding column
LUpperArmPosX(:,1) =                segCenter.LShoulderCenter_mar_dim_frame(1,:)'; % LShoulderPosX(1,:)';
LUpperArmPosX(:,2) =                LElbowOut(1,:)';
LUpperArmPosX =                     mean(LUpperArmPosX,2);

%y values located on corresponding column
LUpperArmPosY(:,1) =                segCenter.LShoulderCenter_mar_dim_frame(2,:)'; %LShoulderPosY(1,:)';
LUpperArmPosY(:,2) =                LElbowOut(2,:)';
LUpperArmPosY =                     mean(LUpperArmPosY,2);

%z values located on corresponding column
LUpperArmPosZ(:,1) =                segCenter.LShoulderCenter_mar_dim_frame(3,:)'; %LShoulderPosZ(1,:)';
LUpperArmPosZ(:,2) =                LElbowOut(3,:)';
LUpperArmPosZ =                     mean(LUpperArmPosZ,2);

%Center location for the LUpperArm
segCenter.LUpperArmCenter_mar_dim_frame =         (LUpperArmPosX).';
segCenter.LUpperArmCenter_mar_dim_frame(2,:) =    (LUpperArmPosY).';
segCenter.LUpperArmCenter_mar_dim_frame(3,:) =    (LUpperArmPosZ).';

%% RUpperArm Markers
%Store markers data into segCenter for the RUpperArm
%Includes: RShoulder and RELB
RElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'RELB');

%x values located on corresponding column
RUpperArmPosX(:,1) =                segCenter.RShoulderCenter_mar_dim_frame(1,:)'; % RShoulderPosX(1,:)';
RUpperArmPosX(:,2) =                RElbowOut(1,:)';
RUpperArmPosX =                     mean(RUpperArmPosX,2);

%y values located on corresponding column
RUpperArmPosY(:,1) =                segCenter.RShoulderCenter_mar_dim_frame(2,:)'; %RShoulderPosY(1,:)';
RUpperArmPosY(:,2) =                RElbowOut(2,:)';
RUpperArmPosY =                     mean(RUpperArmPosY,2);

%z values located on corresponding column
RUpperArmPosZ(:,1) =                segCenter.RShoulderCenter_mar_dim_frame(3,:)'; %RShoulderPosZ(1,:)';
RUpperArmPosZ(:,2) =                RElbowOut(3,:)';
RUpperArmPosZ =                     mean(RUpperArmPosZ,2);

%Center location for the RUpperArm
segCenter.RUpperArmCenter_mar_dim_frame =         (RUpperArmPosX).';
segCenter.RUpperArmCenter_mar_dim_frame(2,:) =    (RUpperArmPosY).';
segCenter.RUpperArmCenter_mar_dim_frame(3,:) =    (RUpperArmPosZ).';

%% LForearm Markers
%Store markers data into segCenter for the LForearm
%Includes: LELB, LWRA, LWRB
LWristIn = getMarker(marker_mar_dim_frame,markerLabels,'LWRA');
LWristOut = getMarker(marker_mar_dim_frame,markerLabels,'LWRB');

%x values located on corresponding column
LForearmPosX(:,1) =                 LElbowOut(1,:)';
LForearmPosX(:,2) =                 LWristIn(1,:)';
LForearmPosX(:,3) =                 LWristOut(1,:)';
LForearmPosX =                      mean(LForearmPosX,2);

%y values located on corresponding column
LForearmPosY(:,1) =                 LElbowOut(2,:)';
LForearmPosY(:,2) =                 LWristIn(2,:)';
LForearmPosY(:,3) =                 LWristOut(2,:)';
LForearmPosY =                      mean(LForearmPosY,2);

%z values located on corresponding column
LForearmPosZ(:,1) =                 LElbowOut(3,:)';
LForearmPosZ(:,2) =                 LWristIn(3,:)';
LForearmPosZ(:,3) =                 LWristOut(3,:)';
LForearmPosZ =                      mean(LForearmPosZ,2);

%Center location for the LForearm
segCenter.LForearmCenter_mar_dim_frame =          (LForearmPosX).';
segCenter.LForearmCenter_mar_dim_frame(2,:) =     (LForearmPosY).';
segCenter.LForearmCenter_mar_dim_frame(3,:) =     (LForearmPosZ).';

%% RForearm Markers
%Store markers data into segCenter for the RForearm
%Includes: RElbowOut, RWristOut, RWristIn
RWristIn = getMarker(marker_mar_dim_frame,markerLabels,'RWRA');
RWristOut = getMarker(marker_mar_dim_frame,markerLabels,'RWRB');

%x values located on corresponding column
RForearmPosX(:,1) =                 RElbowOut(1,:)';
RForearmPosX(:,2) =                 RWristIn(1,:)';
RForearmPosX(:,3) =                 RWristOut(1,:)';
RForearmPosX =                      mean(RForearmPosX,2);

%y values located on corresponding column
RForearmPosY(:,1) =                 RElbowOut(2,:)';
RForearmPosY(:,2) =                 RWristIn(2,:)';
RForearmPosY(:,3) =                 RWristOut(2,:)';
RForearmPosY =                      mean(RForearmPosY,2);

%z values located on corresponding column
RForearmPosZ(:,1) =                 RElbowOut(3,:)';
RForearmPosZ(:,2) =                 RWristIn(3,:)';
RForearmPosZ(:,3) =                 RWristOut(3,:)';
RForearmPosZ =                      mean(RForearmPosZ,2);

%Center location for the RForearm
segCenter.RForearmCenter_mar_dim_frame =          (RForearmPosX).';
segCenter.RForearmCenter_mar_dim_frame(2,:) =     (RForearmPosY).';
segCenter.RForearmCenter_mar_dim_frame(3,:) =     (RForearmPosZ).';

%% LHand Markers
%Store markers data into segCenter for the LHand
%Includes: LWRA, LWRB, LFIN
LHandOut = getMarker(marker_mar_dim_frame,markerLabels,'LFIN');

%x values located on corresponding column
LHandPosX(:,1) =                 LWristOut(1,:)';
LHandPosX(:,2) =                 LWristOut(1,:)';
LHandPosX(:,3) =                 LHandOut(1,:)';
LHandPosX =                      mean(LHandPosX,2);

%y values located on corresponding column
LHandPosY(:,1) =                 LWristOut(2,:)';
LHandPosY(:,2) =                 LWristOut(2,:)';
LHandPosY(:,3) =                 LHandOut(2,:)';
LHandPosY =                      mean(LHandPosY,2);

%z values located on corresponding column
LHandPosZ(:,1) =                 LWristOut(3,:)';
LHandPosZ(:,2) =                 LWristOut(3,:)';
LHandPosZ(:,3) =                 LHandOut(3,:)';
LHandPosZ =                      mean(LHandPosZ,2);

%Center location for the LHand
segCenter.LHandCenter_mar_dim_frame =          (LHandPosX).';
segCenter.LHandCenter_mar_dim_frame(2,:) =     (LHandPosY).';
segCenter.LHandCenter_mar_dim_frame(3,:) =     (LHandPosZ).';

%% RHand Markers
%Store markers data into segCenter for the RHand
%Includes: RWRA, RWRB, and RFIN
RHandOut = getMarker(marker_mar_dim_frame,markerLabels,'RFIN');

%x values located on corresponding column
RHandPosX(:,1) =                 RWristIn(1,:)';
RHandPosX(:,2) =                 RWristOut(1,:)';
RHandPosX(:,3) =                 RHandOut(1,:)';
RHandPosX =                      mean(RHandPosX,2);

%y values located on corresponding column
RHandPosY(:,1) =                 RWristIn(2,:)';
RHandPosY(:,2) =                 RWristOut(2,:)';
RHandPosY(:,3) =                 RHandOut(2,:)';
RHandPosY =                      mean(RHandPosY,2);

%z values located on corresponding column
RHandPosZ(:,1) =                 RWristIn(3,:)';
RHandPosZ(:,2) =                 RWristOut(3,:)';
RHandPosZ(:,3) =                 RHandOut(3,:)';
RHandPosZ =                      mean(RHandPosZ,2);

%Center location for the RHand
segCenter.RHandCenter_mar_dim_frame =          (RHandPosX).';
segCenter.RHandCenter_mar_dim_frame(2,:) =     (RHandPosY).';
segCenter.RHandCenter_mar_dim_frame(3,:) =     (RHandPosZ).';


%% Hip Markers
%Store markers data into segCenter for the Hip
%Includes: LASI and RASI
WaistLFront = getMarker(marker_mar_dim_frame,markerLabels,'LASI');
WaistRFront = getMarker(marker_mar_dim_frame,markerLabels,'RASI');

%x values located on corresponding column
hipPosX(:,1) =                 WaistLFront(1,:)';
hipPosX(:,2) =                 WaistRFront(1,:)';
hipPosX =                      mean(hipPosX,2);

%y values located on corresponding column
hipPosY(:,1) =                 WaistLFront(2,:)';
hipPosY(:,2) =                 WaistRFront(2,:)';
hipPosY =                      mean(hipPosY,2);

%z values located on corresponding column
hipPosZ(:,1) =                 WaistLFront(3,:)';
hipPosZ(:,2) =                 WaistRFront(3,:)';
hipPosZ =                      mean(hipPosZ,2);

%Center location for the Hip
segCenter.hipCenter_mar_dim_frame =          (hipPosX).';
segCenter.hipCenter_mar_dim_frame(2,:) =     (hipPosY).';
segCenter.hipCenter_mar_dim_frame(3,:) =     (hipPosZ).';

%% LThigh Markers
%Store markers data into segCenter for the LThigh
%Includes: LASI, LTHI, and LKNE
% POTENTIAL SOURCE OF ERROR
LThigh = getMarker(marker_mar_dim_frame,markerLabels,'LTHI');
LKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'LKNE');

%x values located on corresponding column
LThighPosX(:,1) =                 WaistLFront(1,:)';
% LThighPosX(:,1) =                 WaistLBack(1,:)';
LThighPosX(:,2) =                 LThigh(1,:)';
LThighPosX(:,3) =                 LKneeOut(1,:)';
LThighPosX =                      mean(LThighPosX,2);

%y values located on corresponding column
LThighPosY(:,1) =                 WaistLFront(2,:)';
% LThighPosY(:,1) =                 WaistLBack(2,:)';
LThighPosY(:,2) =                 LThigh(2,:)';
LThighPosY(:,3) =                 LKneeOut(2,:)';
LThighPosY =                      mean(LThighPosY,2);

%z values located on corresponding column
LThighPosZ(:,1) =                 WaistLFront(3,:)';
% LThighPosZ(:,1) =                 WaistLBack(3,:)';
LThighPosZ(:,2) =                 LThigh(3,:)';
LThighPosZ(:,3) =                 LKneeOut(3,:)';
LThighPosZ =                      mean(LThighPosZ,2);

%Center location for the LThigh
segCenter.LThighCenter_mar_dim_frame =          (LThighPosX).';
segCenter.LThighCenter_mar_dim_frame(2,:) =     (LThighPosY).';
segCenter.LThighCenter_mar_dim_frame(3,:) =     (LThighPosZ).';

%% RThigh Markers
%Store markers data into segCenter for the RThigh
%Includes: RASI, RTHI, and RKNE
% POTENTIAL SOURCE OF ERROR
RThigh = getMarker(marker_mar_dim_frame,markerLabels,'RTHI');
RKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'RKNE');

%x values located on corresponding column
RThighPosX(:,1) =                 WaistRFront(1,:)';
% RThighPosX(:,1) =                 WaistRBack(1,:)';
RThighPosX(:,2) =                 RThigh(1,:)';
RThighPosX(:,3) =                 RKneeOut(1,:)';
RThighPosX =                      mean(RThighPosX,2);

%y values located on corresponding column
RThighPosY(:,1) =                 WaistRFront(2,:)';
% RThighPosY(:,1) =                 WaistRBack(2,:)';
RThighPosY(:,2) =                 RThigh(2,:)';
RThighPosY(:,3) =                 RKneeOut(2,:)';
RThighPosY =                      mean(RThighPosY,2);

%z values located on corresponding column
RThighPosZ(:,1) =                 WaistRFront(3,:)';
% RThighPosZ(:,1) =                 WaistRBack(3,:)';
RThighPosZ(:,2) =                 RThigh(3,:)';
RThighPosZ(:,3) =                 RKneeOut(3,:)';
RThighPosZ =                      mean(RThighPosZ,2);

%Center location for the RThigh
segCenter.RThighCenter_mar_dim_frame =          (RThighPosX).';
segCenter.RThighCenter_mar_dim_frame(2,:) =     (RThighPosY).';
segCenter.RThighCenter_mar_dim_frame(3,:) =     (RThighPosZ).';

%% LLeg Markers
%Store markers data into segCenter for the LLeg
%Includes: LKNE, LTIB, and LANK
LShin = getMarker(marker_mar_dim_frame,markerLabels,'LTIB');
LAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'LANK');

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
%Includes: RKNE, RTIB, RANK
RShin = getMarker(marker_mar_dim_frame,markerLabels,'RTIB');
RAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'RANK');

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
%Includes: LANK, LHEE, and LTOE
LHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'LHEE');
LForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'LTOE');

%x values located on corresponding column
LFootPosX(:,1) =                 LAnkleOut(1,:)';
LFootPosX(:,2) =                 LHeelBack(1,:)';
LFootPosX(:,3) =                 LForefootOut(1,:)';
LFootPosX =                      mean(LFootPosX,2);

%y values located on corresponding column
LFootPosY(:,1) =                 LAnkleOut(2,:)';
LFootPosY(:,2) =                 LHeelBack(2,:)';
LFootPosY(:,3) =                 LForefootOut(2,:)';
LFootPosY =                      mean(LFootPosY,2);

%z values located on corresponding column
LFootPosZ(:,1) =                 LAnkleOut(3,:)';
LFootPosZ(:,2) =                 LHeelBack(3,:)';
LFootPosZ(:,3) =                 LForefootOut(3,:)';
LFootPosZ =                      mean(LFootPosZ,2);

%Center location for the LFoot
segCenter.LFootCenter_mar_dim_frame =          (LFootPosX).';
segCenter.LFootCenter_mar_dim_frame(2,:) =     (LFootPosY).';
segCenter.LFootCenter_mar_dim_frame(3,:) =     (LFootPosZ).';

%% RFoot Markers
%Store markers data into segCenter for the RFoot
%Includes: RANK, RHEE, and RTOE
RHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'RHEE');
RForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'RTOE');

%x values located on corresponding column
RFootPosX(:,1) =                 RAnkleOut(1,:)';
RFootPosX(:,2) =                 RHeelBack(1,:)';
RFootPosX(:,3) =                 RForefootOut(1,:)';
RFootPosX =                      mean(RFootPosX,2);

%y values located on corresponding column
RFootPosY(:,1) =                 RAnkleOut(2,:)';
RFootPosY(:,2) =                 RHeelBack(2,:)';
RFootPosY(:,3) =                 RForefootOut(2,:)';
RFootPosY =                      mean(RFootPosY,2);

%z values located on corresponding column
RFootPosZ(:,1) =                 RAnkleOut(3,:)';
RFootPosZ(:,2) =                 RHeelBack(3,:)';
RFootPosZ(:,3) =                 RForefootOut(3,:)';
RFootPosZ =                      mean(RFootPosZ,2);

%Center location for the RFoot
segCenter.RFootCenter_mar_dim_frame =          (RFootPosX).';
segCenter.RFootCenter_mar_dim_frame(2,:) =     (RFootPosY).';
segCenter.RFootCenter_mar_dim_frame(3,:) =     (RFootPosZ).';

end