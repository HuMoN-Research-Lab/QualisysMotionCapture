function [total_body_COMXYZ] = calc_seg_weight_COM(seg_center,seg_prop_weight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prop_weight was multiplied by each frame of its corresponding marker
% Contributes to calculating total COM of subject
%Prepared based on Miller & Nelson and Lea & Febiger
%Pages 63-64 in David A. Winters book
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Head Seg
head_COM =        seg_prop_weight.head_prop .* seg_center.headCenter_mar_dim_frame;

%% Shoulder Seg
LShoulder_COM =   seg_prop_weight.shoulder_prop .* seg_center.LShoulderCenter_mar_dim_frame;
RShoulder_COM =   seg_prop_weight.shoulder_prop .* seg_center.RShoulderCenter_mar_dim_frame;

%% Chest Seg
chest_COM =       (seg_prop_weight.chest_prop + seg_prop_weight.abdomen_prop)...
                    .* seg_center.chestCenter_mar_dim_frame;
                
%% UpperArm Seg
LUpperArm_COM =   seg_prop_weight.upper_arm_prop .* seg_center.LUpperArmCenter_mar_dim_frame;
RUpperArm_COM =   seg_prop_weight.upper_arm_prop .* seg_center.RUpperArmCenter_mar_dim_frame;

%% Forearm Seg
LForearm_COM =    seg_prop_weight.forearm_prop .* seg_center.LForearmCenter_mar_dim_frame;
RForearm_COM =    seg_prop_weight.forearm_prop .* seg_center.RForearmCenter_mar_dim_frame;

%% Hand Seg
LHand_COM =       seg_prop_weight.hand_prop .* seg_center.LHandCenter_mar_dim_frame;
RHand_COM =       seg_prop_weight.hand_prop .* seg_center.RHandCenter_mar_dim_frame;

%% Hip Seg
hip_COM =         seg_prop_weight.hip_prop .* seg_center.hipCenter_mar_dim_frame;

%% Thigh Seg
LThigh_COM =      seg_prop_weight.thigh_prop .* seg_center.LThighCenter_mar_dim_frame;
RThigh_COM =      seg_prop_weight.thigh_prop .* seg_center.RThighCenter_mar_dim_frame;

%% Leg Seg
LLeg_COM =        seg_prop_weight.leg_prop .* seg_center.LLegCenter_mar_dim_frame;
RLeg_COM =        seg_prop_weight.leg_prop .* seg_center.RLegCenter_mar_dim_frame;

%% Foot Seg
LFoot_COM =       seg_prop_weight.foot_prop .* seg_center.LFootCenter_mar_dim_frame;
RFoot_COM =       seg_prop_weight.foot_prop .* seg_center.RFootCenter_mar_dim_frame;

%% Calculation for Total COM of Subject
total_body_COMXYZ = (head_COM + LShoulder_COM + RShoulder_COM...
                + chest_COM + LUpperArm_COM + RUpperArm_COM...
                + LForearm_COM + RForearm_COM + LHand_COM ...
                + RHand_COM + hip_COM + LThigh_COM + RThigh_COM...
                + LLeg_COM + RLeg_COM + LFoot_COM + RFoot_COM);

end


