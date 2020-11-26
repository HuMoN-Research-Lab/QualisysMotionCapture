function [seg_center] = calc_seg_COM(marker_mar_dim_frame,markerLabels) %,markerID)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimates the center location for each anatomical segment frame-by-frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish output conditions
seg_center = [];

%% Head Markers
%Includes: HeadL, HeadTop, HeadR, and HeadFront
%Next step to expedite the process further
head_MarkerNames = {'HeadL' 'HeadTop' 'HeadR' 'HeadFront'};
[markerNum] = findMarNum(markerLabels,head_MarkerNames);

HeadL = getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadTop = getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadR = getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadFront = getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');

%For loop takes markerNames and restructues x,y,z dimensions to get their
%mean. Next step would be to have for loop reference head_MarkerNames and
%organize them accordingly

for jj = 1:3 %ref num dim
    headPos_raw{1,jj} = cat(1,HeadTop(jj,:),HeadR(jj,:),HeadFront(jj,:));
    headPos(jj,:) =     mean(headPos_raw{1,jj},1);
end

%Output headCenter data into struct
seg_center.headCenter_mar_dim_frame = headPos;

%% LShoulder Markers
%Includes: LShoulderTop and LShoulderBack
LShoulder_MarkerNames = {'LShoulderTop' 'LShoulderBack'};
LShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

for jj = 1:3 %ref num dim
    LShoulderPos_raw{1,jj} = cat(1,LShoulderTop(jj,:),LShoulderBack(jj,:));
    LShoulderPos(jj,:) =     mean(LShoulderPos_raw{1,jj},1);
end

%Output LShoulderCenter data into struct
seg_center.LShoulderCenter_mar_dim_frame = LShoulderPos;

%% RShoulder Markers
%Includes RShoulderTop and RShoulderBack
RShoulder_MarkerNames = {'RShoulderTop' 'RShoulderBack'};
RShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

for jj = 1:3 %ref num dim
    RShoulderPos_raw{1,jj} = cat(1,RShoulderTop(jj,:),RShoulderBack(jj,:));
    RShoulderPos(jj,:) =     mean(RShoulderPos_raw{1,jj},1);
end

%Output RShoulderCenter data into struct
seg_center.RShoulderCenter_mar_dim_frame = RShoulderPos;

%% Chest Markers
%Includes: Chest, SpineTop, BackL, and BackR
Chest_MarkerNames = {'Chest' 'SpineTop' 'BackL' 'BackR'};
Chest = getMarker(marker_mar_dim_frame,markerLabels,'Chest');
SpineTop = getMarker(marker_mar_dim_frame,markerLabels,'SpineTop');
BackL = getMarker(marker_mar_dim_frame,markerLabels,'BackL');
BackR = getMarker(marker_mar_dim_frame,markerLabels,'BackR');

for jj = 1:3 %ref num dim
    ChestPos_raw{1,jj} = cat(1,Chest(jj,:),SpineTop(jj,:),BackL(jj,:),BackR(jj,:));
    ChestPos(jj,:) =     mean(ChestPos_raw{1,jj},1);
end

%Output ChestCenter data into struct
seg_center.chestCenter_mar_dim_frame = ChestPos;

%Index Torso Center
%Includes: Chest, BackL, BackR
Neck_MarkerNames =             {'SpineTop' 'Chest'};
for jj = 1:3 %ref num dim
    NeckPos_raw{1,jj} =        cat(1,Chest(jj,:),SpineTop(jj,:));
    NeckPos(jj,:) =            mean(NeckPos_raw{1,jj},1);
end

seg_center.neckCenter_mar_dim_frame = NeckPos;

%Index Torso Center
%Includes: Chest, BackL, BackR
Torso_MarkerNames =             {'Chest' 'BackL' 'BackR'};
for jj = 1:3 %ref num dim
    TorsoPos_raw{1,jj} =        cat(1,Chest(jj,:),BackL(jj,:),BackR(jj,:));
    TorsoPos(jj,:) =            mean(TorsoPos_raw{1,jj},1);
end

seg_center.torsoCenter_mar_dim_frame = TorsoPos;

%% LUpperArm Markers
%Includes: LUpperArm Mean, LArm, and LElbowOut
LUpperArm_MarkerNames = {'LShoulderPos' 'LArm' 'LElbowOut'};
LArm = getMarker(marker_mar_dim_frame,markerLabels,'LArm');
LElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'LElbowOut');

for jj = 1:3 %ref num dim
    LUpperArmPos_raw{1,jj} = cat(1,LShoulderPos(jj,:),LArm(jj,:),LElbowOut(jj,:));
    LUpperArmPos(jj,:) =     mean(LUpperArmPos_raw{1,jj},1);
end

%Output LUpperArmCenter data into struct
seg_center.LUpperArmCenter_mar_dim_frame = LUpperArmPos;

%% RUpperArm Markers
%Includes: RShoulder Mean, RArm, and RElbowOut
RUpperArm_MarkerNames = {'RShoulderPos' 'RArm' 'RElbowOut'};
RArm = getMarker(marker_mar_dim_frame,markerLabels,'RArm');
RElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'RElbowOut');

for jj = 1:3 %ref num dim
    RUpperArmPos_raw{1,jj} = cat(1,RShoulderPos(jj,:),RArm(jj,:),RElbowOut(jj,:));
    RUpperArmPos(jj,:) =     mean(RUpperArmPos_raw{1,jj},1);
end

%Output RUpperArmCenter data into struct
seg_center.RUpperArmCenter_mar_dim_frame = RUpperArmPos;

%% LForearm Markers
%Includes: LElbowOut, LWristOut, LWristIn
LForearm_MarkerNames = {'LElbowOut' 'LWristOut' 'LWristIn'};
LWristOut = getMarker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristIn = getMarker(marker_mar_dim_frame,markerLabels,'LWristIn');

for jj = 1:3 %ref num dim
    LForearmPos_raw{1,jj} = cat(1,LElbowOut(jj,:),LWristOut(jj,:),LWristIn(jj,:));
    LForearmPos(jj,:) =     mean(LForearmPos_raw{1,jj},1);
end

%Output LForearmCenter data into struct
seg_center.LForearmCenter_mar_dim_frame = LForearmPos;

%% RForearm Markers
%Includes: RElbowOut, RWristOut, RWristIn
RForearm_MarkerNames = {'RElbowOut' 'RWristOut' 'RWristIn'};
RWristOut = getMarker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristIn = getMarker(marker_mar_dim_frame,markerLabels,'RWristIn');

for jj = 1:3 %ref num dim
    RForearmPos_raw{1,jj} = cat(1,RElbowOut(jj,:),RWristOut(jj,:),RWristIn(jj,:));
    RForearmPos(jj,:) =     mean(RForearmPos_raw{1,jj},1);
end

%Output RForearmCenter data into struct
seg_center.RForearmCenter_mar_dim_frame = RForearmPos;

%% LWrist Markers
%Includes: LWristOut, LWristIn
LWrist_MarkerNames = {'LWristOut' 'LWristIn'};

for jj = 1:3 %ref num dim
    LWristPos_raw{1,jj} = cat(1,LWristOut(jj,:),LWristIn(jj,:));
    LWristPos(jj,:) =     mean(LWristPos_raw{1,jj},1);
end

%Output LWristCenter data into struct
seg_center.LWristCenter_mar_dim_frame = LWristPos;

%% RWrist Markers
%Includes: LWristOut, LWristIn
RWrist_MarkerNames = {'RWristOut' 'RWristIn'};

for jj = 1:3 %ref num dim
    RWristPos_raw{1,jj} = cat(1,RWristOut(jj,:),RWristIn(jj,:));
    RWristPos(jj,:) =     mean(RWristPos_raw{1,jj},1);
end

%Output RWristCenter data into struct
seg_center.RWristCenter_mar_dim_frame = RWristPos;

%% LHand Markers
%Includes: LWristOut, LWristIn, LHandOut
LHand_MarkerNames = {'LWristOut' 'LWristIn' 'LHandOut'};
LHandOut = getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');

for jj = 1:3 %ref num dim
    LHandPos_raw{1,jj} = cat(1,LWristOut(jj,:),LWristIn(jj,:),LHandOut(jj,:));
    LHandPos(jj,:) =     mean(LHandPos_raw{1,jj},1);
end

%Output LHandCenter data into struct
seg_center.LHandCenter_mar_dim_frame = LHandPos;

%% RHand Markers
%Includes: RWristOut, RWristIn, RHandOut
RHand_MarkerNames = {'RWristOut' 'RWristIn' 'RHandOut'};
RHandOut = getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');

for jj = 1:3 %ref num dim
    RHandPos_raw{1,jj} = cat(1,RWristOut(jj,:),RWristIn(jj,:),RHandOut(jj,:));
    RHandPos(jj,:) =     mean(RHandPos_raw{1,jj},1);
end

%Output RHandCenter data into struct
seg_center.RHandCenter_mar_dim_frame = RHandPos;

%% Hip Markers
%Includes: WaistLFront, WaistLBack, WaistRFront, WaistRBack
Hip_MarkerNames = {'WaistLFront' 'WaistLBack' 'WaistRFront' 'WaistRBack'};
WaistLFront = getMarker(marker_mar_dim_frame,markerLabels,'WaistLFront');
WaistLBack= getMarker(marker_mar_dim_frame,markerLabels,'WaistLBack');
WaistRFront = getMarker(marker_mar_dim_frame,markerLabels,'WaistRFront');
WaistRBack = getMarker(marker_mar_dim_frame,markerLabels,'WaistRBack');

for jj = 1:3 %ref num dim
    HipPos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:),WaistRFront(jj,:),WaistRBack(jj,:));
    HipPos(jj,:) =     mean(HipPos_raw{1,jj},1);
end

%Output HipCenter data into struct
seg_center.hipCenter_mar_dim_frame = HipPos;

for jj = 1:3 %ref num dim
    LHipPos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:));
    LHipPos(jj,:) =     mean(LHipPos_raw{1,jj},1);
end

%Output LHipCenter data into struct
seg_center.LHipCenter_mar_dim_frame = LHipPos;

for jj = 1:3 %ref num dim
    RHipPos_raw{1,jj} = cat(1,WaistRFront(jj,:),WaistRBack(jj,:));
    RHipPos(jj,:) =     mean(RHipPos_raw{1,jj},1);
end

%Output RHipCenter data into struct
seg_center.RHipCenter_mar_dim_frame = RHipPos;

%% LThigh Markers
%Includes: WaistLFront, WaistLBack, LThigh, LKneeOut
LThigh_MarkerNames = {'WaistLFront' 'WaistLBack' 'LThigh' 'LKneeOut'};
LThigh = getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');

for jj = 1:3 %ref num dim
    LThighPos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:),LThigh(jj,:),LKneeOut(jj,:));
    LThighPos(jj,:) =     mean(LThighPos_raw{1,jj},1);
end

%Output LThighCenter data into struct
seg_center.LThighCenter_mar_dim_frame = LThighPos;

%% RThigh Markers
%Includes: WaistRFront, WaistRBack, RThigh, RKneeOut
RThigh_MarkerNames = {'WaistRFront' 'WaistRBack' 'RThigh' 'RKneeOut'};
RThigh = getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKneeOut= getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');

for jj = 1:3 %ref num dim
    RThighPos_raw{1,jj} = cat(1,WaistRFront(jj,:),WaistRBack(jj,:),RThigh(jj,:),RKneeOut(jj,:));
    RThighPos(jj,:) =     mean(RThighPos_raw{1,jj},1);
end

%Output RThighCenter data into struct
seg_center.RThighCenter_mar_dim_frame = RThighPos;

%% LLeg Markers
%Includes: LKneeOut, LShin, LAnkleOut
%Should marker plates be sure to add them
LLeg_MarkerNames = {'LKneeOut' 'LShin' 'LAnkleOut'};
LShin = getMarker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

for jj = 1:3 %ref num dim
    LLegPos_raw{1,jj} = cat(1,LKneeOut(jj,:),LShin(jj,:),LAnkleOut(jj,:));
    LLegPos(jj,:) =     mean(LLegPos_raw{1,jj},1);
end

%Output LLegCenter data into struct
seg_center.LLegCenter_mar_dim_frame = LLegPos;

%% RLeg Markers
%Includes: RKneeOut, RShin, RAnkleOut
%Should marker plates be sure to add them
RLeg_MarkerNames = {'RKneeOut' 'RShin' 'RAnkleOut'};
RShin = getMarker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkleOut= getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

for jj = 1:3 %ref num dim
    RLegPos_raw{1,jj} = cat(1,RKneeOut(jj,:),RShin(jj,:),RAnkleOut(jj,:));
    RLegPos(jj,:) =     mean(RLegPos_raw{1,jj},1);
end

%Output RLegCenter data into struct
seg_center.RLegCenter_mar_dim_frame = RLegPos;

%% LFoot Markers
%Includes: LAnkleOut, LHeelBack, LForefootOut, LToeTip, LForefootIn
LFoot_MarkerNames = {'LAnkleOut' 'LHeelBack' 'LForefootOut' 'LToeTip' 'LForefootIn'};
LHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'LHeelBack');
LForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');
LToeTip = getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LForefootIn = getMarker(marker_mar_dim_frame,markerLabels,'LForefootIn');

for jj = 1:3 %ref num dim
    LFootPos_raw{1,jj} = cat(1,LAnkleOut(jj,:),LHeelBack(jj,:),LForefootOut(jj,:),LToeTip(jj,:),LForefootIn(jj,:));
    LFootPos(jj,:) =     mean(LFootPos_raw{1,jj},1);
end

%Output LFootCenter data into struct
seg_center.LFootCenter_mar_dim_frame = LFootPos;

%% RFoot Markers
%Includes: RAnkleOut, RHeelBack, RForefootOut, RToeTip, RForefootIn
RFoot_MarkerNames = {'RAnkleOut' 'RHeelBack' 'RForefootOut' 'RToeTip' 'RForefootIn'};
RHeelBack = getMarker(marker_mar_dim_frame,markerLabels,'RHeelBack');
RForefootOut= getMarker(marker_mar_dim_frame,markerLabels,'RForefootOut');
RToeTip = getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RForefootIn = getMarker(marker_mar_dim_frame,markerLabels,'RForefootIn');

for jj = 1:3 %ref num dim
    RFootPos_raw{1,jj} = cat(1,RAnkleOut(jj,:),RHeelBack(jj,:),RForefootOut(jj,:),RToeTip(jj,:),RForefootIn(jj,:));
    RFootPos(jj,:) =     mean(RFootPos_raw{1,jj},1);
end

%Output RFootCenter data into struct
seg_center.RFootCenter_mar_dim_frame = RFootPos;

end
