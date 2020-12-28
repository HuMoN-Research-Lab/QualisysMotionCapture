function [seg_center] = calc_seg_COM(marker_mar_dim_frame,markerLabels) %,markerID)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimates the center location for each anatomical segment frame-by-frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish output conditions
seg_center = [];

%% Head Markers
%Includes: HeadL, HeadTop, HeadR, and HeadFront
%Next step to expedite the process further
head_marker_names = {'HeadL' 'HeadTop' 'HeadR' 'HeadFront'};
[markerNum] = find_mar_num(markerLabels,head_marker_names);

HeadL =     get_marker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadTop =   get_marker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadR =     get_marker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadFront = get_marker(marker_mar_dim_frame,markerLabels,'HeadFront');

%For loop takes marker_names and restructues x,y,z dimensions to get their
%mean. Next step would be to have for loop reference head_marker_names and
%organize them accordingly

for jj = 1:3 %ref num dim
    head_pos_raw{1,jj} = cat(1,HeadTop(jj,:),HeadR(jj,:),HeadFront(jj,:));
    head_pos(jj,:) =     mean(head_pos_raw{1,jj},1);
end

%Output headCenter data into struct
seg_center.headCenter_mar_dim_frame = head_pos;

%% LShoulder Markers
%Includes: LShoulderTop and LShoulderBack
LShoulder_marker_names = {'LShoulderTop' 'LShoulderBack'};
LShoulderTop =  get_marker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderBack = get_marker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

for jj = 1:3 %ref num dim
    LShoulder_pos_raw{1,jj} = cat(1,LShoulderTop(jj,:),LShoulderBack(jj,:));
    LShoulder_pos(jj,:) =     mean(LShoulder_pos_raw{1,jj},1);
end

%Output LShoulderCenter data into struct
seg_center.LShoulderCenter_mar_dim_frame = LShoulder_pos;

%% RShoulder Markers
%Includes RShoulderTop and RShoulderBack
RShoulder_marker_names = {'RShoulderTop' 'RShoulderBack'};
RShoulderTop =  get_marker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderBack = get_marker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

for jj = 1:3 %ref num dim
    RShoulder_pos_raw{1,jj} = cat(1,RShoulderTop(jj,:),RShoulderBack(jj,:));
    RShoulder_pos(jj,:) =     mean(RShoulder_pos_raw{1,jj},1);
end

%Output RShoulderCenter data into struct
seg_center.RShoulderCenter_mar_dim_frame = RShoulder_pos;

%% Chest Markers
%Includes: Chest, SpineTop, BackL, and BackR
Chest_marker_names = {'Chest' 'SpineTop' 'BackL' 'BackR'};
Chest =     get_marker(marker_mar_dim_frame,markerLabels,'Chest');
SpineTop =  get_marker(marker_mar_dim_frame,markerLabels,'SpineTop');
BackL =     get_marker(marker_mar_dim_frame,markerLabels,'BackL');
BackR =     get_marker(marker_mar_dim_frame,markerLabels,'BackR');

for jj = 1:3 %ref num dim
    Chest_pos_raw{1,jj} = cat(1,Chest(jj,:),SpineTop(jj,:),BackL(jj,:),BackR(jj,:));
    Chest_pos(jj,:) =     mean(Chest_pos_raw{1,jj},1);
end

%Output ChestCenter data into struct
seg_center.chestCenter_mar_dim_frame = Chest_pos;

%Index Torso Center
%Includes: Chest, BackL, BackR
Neck_marker_names =             {'SpineTop' 'Chest'};
for jj = 1:3 %ref num dim
    Neck_pos_raw{1,jj} =        cat(1,Chest(jj,:),SpineTop(jj,:));
    Neck_pos(jj,:) =            mean(Neck_pos_raw{1,jj},1);
end

seg_center.neckCenter_mar_dim_frame = Neck_pos;

%Index Torso Center
%Includes: Chest, BackL, BackR
Torso_marker_names =            {'Chest' 'BackL' 'BackR'};
for jj = 1:3 %ref num dim
    Torso_pos_raw{1,jj} =        cat(1,Chest(jj,:),BackL(jj,:),BackR(jj,:));
    Torso_pos(jj,:) =            mean(Torso_pos_raw{1,jj},1);
end

seg_center.torsoCenter_mar_dim_frame = Torso_pos;

%% LUpperArm Markers
%Includes: LUpperArm Mean, LArm, and LElbowOut
LUpperArm_marker_names = {'LShoulderPos' 'LArm' 'LElbowOut'};
LArm =      get_marker(marker_mar_dim_frame,markerLabels,'LArm');
LElbowOut = get_marker(marker_mar_dim_frame,markerLabels,'LElbowOut');

for jj = 1:3 %ref num dim
    LUpperArm_pos_raw{1,jj} = cat(1,LShoulder_pos(jj,:),LArm(jj,:),LElbowOut(jj,:));
    LUpperArm_pos(jj,:) =     mean(LUpperArm_pos_raw{1,jj},1);
end

%Output LUpperArmCenter data into struct
seg_center.LUpperArmCenter_mar_dim_frame = LUpperArm_pos;

%% RUpperArm Markers
%Includes: RShoulder Mean, RArm, and RElbowOut
RUpperArm_marker_names = {'RShoulderPos' 'RArm' 'RElbowOut'};
RArm =      get_marker(marker_mar_dim_frame,markerLabels,'RArm');
RElbowOut = get_marker(marker_mar_dim_frame,markerLabels,'RElbowOut');

for jj = 1:3 %ref num dim
    RUpperArm_pos_raw{1,jj} = cat(1,RShoulder_pos(jj,:),RArm(jj,:),RElbowOut(jj,:));
    RUpperArm_pos(jj,:) =     mean(RUpperArm_pos_raw{1,jj},1);
end

%Output RUpperArmCenter data into struct
seg_center.RUpperArmCenter_mar_dim_frame = RUpperArm_pos;

%% LForearm Markers
%Includes: LElbowOut, LWristOut, LWristIn
LForearm_marker_names = {'LElbowOut' 'LWristOut' 'LWristIn'};
LWristOut = get_marker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristIn =  get_marker(marker_mar_dim_frame,markerLabels,'LWristIn');

for jj = 1:3 %ref num dim
    LForearm_pos_raw{1,jj} = cat(1,LElbowOut(jj,:),LWristOut(jj,:),LWristIn(jj,:));
    LForearm_pos(jj,:) =     mean(LForearm_pos_raw{1,jj},1);
end

%Output LForearmCenter data into struct
seg_center.LForearmCenter_mar_dim_frame = LForearm_pos;

%% RForearm Markers
%Includes: RElbowOut, RWristOut, RWristIn
RForearm_marker_names = {'RElbowOut' 'RWristOut' 'RWristIn'};
RWristOut = get_marker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristIn =  get_marker(marker_mar_dim_frame,markerLabels,'RWristIn');

for jj = 1:3 %ref num dim
    RForearm_pos_raw{1,jj} = cat(1,RElbowOut(jj,:),RWristOut(jj,:),RWristIn(jj,:));
    RForearm_pos(jj,:) =     mean(RForearm_pos_raw{1,jj},1);
end

%Output RForearmCenter data into struct
seg_center.RForearmCenter_mar_dim_frame = RForearm_pos;

%% LWrist Markers
%Includes: LWristOut, LWristIn
LWrist_marker_names = {'LWristOut' 'LWristIn'};

for jj = 1:3 %ref num dim
    LWrist_pos_raw{1,jj} = cat(1,LWristOut(jj,:),LWristIn(jj,:));
    LWrist_pos(jj,:) =     mean(LWrist_pos_raw{1,jj},1);
end

%Output LWristCenter data into struct
seg_center.LWristCenter_mar_dim_frame = LWrist_pos;

%% RWrist Markers
%Includes: LWristOut, LWristIn
RWrist_marker_names = {'RWristOut' 'RWristIn'};

for jj = 1:3 %ref num dim
    RWrist_pos_raw{1,jj} = cat(1,RWristOut(jj,:),RWristIn(jj,:));
    RWrist_pos(jj,:) =     mean(RWrist_pos_raw{1,jj},1);
end

%Output RWristCenter data into struct
seg_center.RWristCenter_mar_dim_frame = RWrist_pos;

%% LHand Markers
%Includes: LWristOut, LWristIn, LHandOut
LHand_marker_names = {'LWristOut' 'LWristIn' 'LHandOut'};
LHandOut =  get_marker(marker_mar_dim_frame,markerLabels,'LHandOut');

for jj = 1:3 %ref num dim
    LHand_pos_raw{1,jj} = cat(1,LWristOut(jj,:),LWristIn(jj,:),LHandOut(jj,:));
    LHand_pos(jj,:) =     mean(LHand_pos_raw{1,jj},1);
end

%Output LHandCenter data into struct
seg_center.LHandCenter_mar_dim_frame = LHand_pos;

%% RHand Markers
%Includes: RWristOut, RWristIn, RHandOut
RHand_marker_names = {'RWristOut' 'RWristIn' 'RHandOut'};
RHandOut =  get_marker(marker_mar_dim_frame,markerLabels,'RHandOut');

for jj = 1:3 %ref num dim
    RHand_pos_raw{1,jj} = cat(1,RWristOut(jj,:),RWristIn(jj,:),RHandOut(jj,:));
    RHand_pos(jj,:) =     mean(RHand_pos_raw{1,jj},1);
end

%Output RHandCenter data into struct
seg_center.RHandCenter_mar_dim_frame = RHand_pos;

%% Hip Markers
%Includes: WaistLFront, WaistLBack, WaistRFront, WaistRBack
Hip_marker_names = {'WaistLFront' 'WaistLBack' 'WaistRFront' 'WaistRBack'};
WaistLFront =   get_marker(marker_mar_dim_frame,markerLabels,'WaistLFront');
WaistLBack=     get_marker(marker_mar_dim_frame,markerLabels,'WaistLBack');
WaistRFront =   get_marker(marker_mar_dim_frame,markerLabels,'WaistRFront');
WaistRBack =    get_marker(marker_mar_dim_frame,markerLabels,'WaistRBack');

for jj = 1:3 %ref num dim
    Hip_pos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:),WaistRFront(jj,:),WaistRBack(jj,:));
    Hip_pos(jj,:) =     mean(Hip_pos_raw{1,jj},1);
end

%Output HipCenter data into struct
seg_center.hipCenter_mar_dim_frame = Hip_pos;

for jj = 1:3 %ref num dim
    LHip_pos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:));
    LHip_pos(jj,:) =     mean(LHip_pos_raw{1,jj},1);
end

%Output LHipCenter data into struct
seg_center.LHipCenter_mar_dim_frame = LHip_pos;

for jj = 1:3 %ref num dim
    RHip_pos_raw{1,jj} = cat(1,WaistRFront(jj,:),WaistRBack(jj,:));
    RHip_pos(jj,:) =     mean(RHip_pos_raw{1,jj},1);
end

%Output RHipCenter data into struct
seg_center.RHipCenter_mar_dim_frame = RHip_pos;

%% LThigh Markers
%Includes: WaistLFront, WaistLBack, LThigh, LKneeOut
LThigh_marker_names = {'WaistLFront' 'WaistLBack' 'LThigh' 'LKneeOut'};
LThigh =    get_marker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut=   get_marker(marker_mar_dim_frame,markerLabels,'LKneeOut');

for jj = 1:3 %ref num dim
    LThigh_pos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:),LThigh(jj,:),LKneeOut(jj,:));
    LThigh_pos(jj,:) =     mean(LThigh_pos_raw{1,jj},1);
end

%Output LThighCenter data into struct
seg_center.LThighCenter_mar_dim_frame = LThigh_pos;

%% RThigh Markers
%Includes: WaistRFront, WaistRBack, RThigh, RKneeOut
RThigh_marker_names = {'WaistRFront' 'WaistRBack' 'RThigh' 'RKneeOut'};
RThigh =    get_marker(marker_mar_dim_frame,markerLabels,'RThigh');
RKneeOut=   get_marker(marker_mar_dim_frame,markerLabels,'RKneeOut');

for jj = 1:3 %ref num dim
    RThigh_pos_raw{1,jj} = cat(1,WaistRFront(jj,:),WaistRBack(jj,:),RThigh(jj,:),RKneeOut(jj,:));
    RThigh_pos(jj,:) =     mean(RThigh_pos_raw{1,jj},1);
end

%Output RThighCenter data into struct
seg_center.RThighCenter_mar_dim_frame = RThigh_pos;

%% LLeg Markers
%Includes: LKneeOut, LShin, LAnkleOut
%Should marker plates be sure to add them
LLeg_marker_names = {'LKneeOut' 'LShin' 'LAnkleOut'};
LShin =     get_marker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkleOut=  get_marker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

for jj = 1:3 %ref num dim
    LLeg_pos_raw{1,jj} = cat(1,LKneeOut(jj,:),LShin(jj,:),LAnkleOut(jj,:));
    LLeg_pos(jj,:) =     mean(LLeg_pos_raw{1,jj},1);
end

%Output LLegCenter data into struct
seg_center.LLegCenter_mar_dim_frame = LLeg_pos;

%% RLeg Markers
%Includes: RKneeOut, RShin, RAnkleOut
%Should marker plates be sure to add them
RLeg_marker_names = {'RKneeOut' 'RShin' 'RAnkleOut'};
RShin =     get_marker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkleOut=  get_marker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

for jj = 1:3 %ref num dim
    RLeg_pos_raw{1,jj} = cat(1,RKneeOut(jj,:),RShin(jj,:),RAnkleOut(jj,:));
    RLeg_pos(jj,:) =     mean(RLeg_pos_raw{1,jj},1);
end

%Output RLegCenter data into struct
seg_center.RLegCenter_mar_dim_frame = RLeg_pos;

%% LFoot Markers
%Includes: LAnkleOut, LHeelBack, LForefootOut, LToeTip, LForefootIn
LFoot_marker_names = {'LAnkleOut' 'LHeelBack' 'LForefootOut' 'LToeTip' 'LForefootIn'};
LHeelBack =     get_marker(marker_mar_dim_frame,markerLabels,'LHeelBack');
LForefootOut=   get_marker(marker_mar_dim_frame,markerLabels,'LForefootOut');
LToeTip =       get_marker(marker_mar_dim_frame,markerLabels,'LToeTip');
LForefootIn =   get_marker(marker_mar_dim_frame,markerLabels,'LForefootIn');

for jj = 1:3 %ref num dim
    LFoot_pos_raw{1,jj} = cat(1,LAnkleOut(jj,:),LHeelBack(jj,:),LForefootOut(jj,:),LToeTip(jj,:),LForefootIn(jj,:));
    LFoot_pos(jj,:) =     mean(LFoot_pos_raw{1,jj},1);
end

%Output LFootCenter data into struct
seg_center.LFootCenter_mar_dim_frame = LFoot_pos;

%% RFoot Markers
%Includes: RAnkleOut, RHeelBack, RForefootOut, RToeTip, RForefootIn
RFoot_marker_names = {'RAnkleOut' 'RHeelBack' 'RForefootOut' 'RToeTip' 'RForefootIn'};
RHeelBack =     get_marker(marker_mar_dim_frame,markerLabels,'RHeelBack');
RForefootOut=   get_marker(marker_mar_dim_frame,markerLabels,'RForefootOut');
RToeTip =       get_marker(marker_mar_dim_frame,markerLabels,'RToeTip');
RForefootIn =   get_marker(marker_mar_dim_frame,markerLabels,'RForefootIn');

for jj = 1:3 %ref num dim
    RFoot_pos_raw{1,jj} = cat(1,RAnkleOut(jj,:),RHeelBack(jj,:),RForefootOut(jj,:),RToeTip(jj,:),RForefootIn(jj,:));
    RFoot_pos(jj,:) =     mean(RFoot_pos_raw{1,jj},1);
end

%Output RFootCenter data into struct
seg_center.RFootCenter_mar_dim_frame = RFoot_pos;

end
