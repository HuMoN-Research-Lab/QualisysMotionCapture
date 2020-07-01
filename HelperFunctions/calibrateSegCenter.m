function [segCenter_cal] = calibrateSegCenter(segCenter,trial_start_end,marker_mar_dim_frame,markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calibrates segCenter data to its respective location on force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
segCenter_cal = [];

%% Reformat LLower extremities data
%Identify the market/segment
LHip_loc_unfil_all = 	segCenter.LHipCenter_mar_dim_frame;
LHip_locX_unfil =       LHip_loc_unfil_all(1,:);
LHip_locY_unfil =       LHip_loc_unfil_all(2,:);
LHip_locZ_unfil =       LHip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHip_loc_fil =            LHip_locX_unfil(trial_start_end);
segCenter_cal.LHip_loc_fil(2,:) =       LHip_locY_unfil(trial_start_end);
segCenter_cal.LHip_loc_fil(3,:) =       LHip_locZ_unfil(trial_start_end);

%Identify the market/segment
LThigh_loc_unfil_all = 	segCenter.LThighCenter_mar_dim_frame;
LThigh_locX_unfil =       LThigh_loc_unfil_all(1,:);
LThigh_locY_unfil =       LThigh_loc_unfil_all(2,:);
LThigh_locZ_unfil =       LThigh_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LThigh_loc_fil =          LThigh_locX_unfil(trial_start_end);
segCenter_cal.LThigh_loc_fil(2,:) =     LThigh_locY_unfil(trial_start_end);
segCenter_cal.LThigh_loc_fil(3,:) =     LThigh_locZ_unfil(trial_start_end);

%Identify the market/segment
LKnee_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LKnee_locX_unfil =      LKnee_loc_unfil_all(1,:);
LKnee_locY_unfil =      LKnee_loc_unfil_all(2,:);
LKnee_locZ_unfil =      LKnee_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LKnee_loc_fil =           LKnee_locX_unfil(trial_start_end);
segCenter_cal.LKnee_loc_fil(2,:) =      LKnee_locY_unfil(trial_start_end);
segCenter_cal.LKnee_loc_fil(3,:) =      LKnee_locZ_unfil(trial_start_end);

%Identify the market/segment
LLeg_loc_unfil_all = 	segCenter.LLegCenter_mar_dim_frame;
LLeg_locX_unfil =       LLeg_loc_unfil_all(1,:);
LLeg_locY_unfil =       LLeg_loc_unfil_all(2,:);
LLeg_locZ_unfil =       LLeg_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LLeg_loc_fil =            LLeg_locX_unfil(trial_start_end);
segCenter_cal.LLeg_loc_fil(2,:) =       LLeg_locY_unfil(trial_start_end);
segCenter_cal.LLeg_loc_fil(3,:) =       LLeg_locZ_unfil(trial_start_end);

%Identify the market/segment
LAnkle_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');
LAnkle_locX_unfil =     LAnkle_loc_unfil_all(1,:);
LAnkle_locY_unfil =     LAnkle_loc_unfil_all(2,:);
LAnkle_locZ_unfil =     LAnkle_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LAnkle_loc_fil =          LAnkle_locX_unfil(trial_start_end);
segCenter_cal.LAnkle_loc_fil(2,:) =     LAnkle_locY_unfil(trial_start_end);
segCenter_cal.LAnkle_loc_fil(3,:) =     LAnkle_locZ_unfil(trial_start_end);

%Identify the market/segment
LFoot_loc_unfil_all =   segCenter.LFootCenter_mar_dim_frame;
LFoot_locX_unfil =      LFoot_loc_unfil_all(1,:);
LFoot_locY_unfil =      LFoot_loc_unfil_all(2,:);
LFoot_locZ_unfil =      LFoot_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LFoot_loc_fil =         LFoot_locX_unfil(trial_start_end);
segCenter_cal.LFoot_loc_fil(2,:) =    LFoot_locY_unfil(trial_start_end);
segCenter_cal.LFoot_loc_fil(3,:) =    LFoot_locZ_unfil(trial_start_end);

%Identify the market/segment
LToeTip_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LToeTip_locX_unfil =      LToeTip_loc_unfil_all(1,:);
LToeTip_locY_unfil =      LToeTip_loc_unfil_all(2,:);
LToeTip_locZ_unfil =      LToeTip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LToeTip_loc_fil =         LToeTip_locX_unfil(trial_start_end);
segCenter_cal.LToeTip_loc_fil(2,:) =    LToeTip_locY_unfil(trial_start_end);
segCenter_cal.LToeTip_loc_fil(3,:) =    LToeTip_locZ_unfil(trial_start_end);

%Create for loop that cleans up code
% for ii = 1:3
%     RHip_loc_fil = 
%     
% end

%% Reformat RLower extremities data
%Identify the market/segment
RHip_loc_unfil_all = 	segCenter.RHipCenter_mar_dim_frame;
RHip_locX_unfil =       RHip_loc_unfil_all(1,:);
RHip_locY_unfil =       RHip_loc_unfil_all(2,:);
RHip_locZ_unfil =       RHip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHip_loc_fil =            RHip_locX_unfil(trial_start_end);
segCenter_cal.RHip_loc_fil(2,:) =       RHip_locY_unfil(trial_start_end);
segCenter_cal.RHip_loc_fil(3,:) =       RHip_locZ_unfil(trial_start_end);

%Identify the market/segment
RThigh_loc_unfil_all = 	segCenter.LThighCenter_mar_dim_frame;
RThigh_locX_unfil =       RThigh_loc_unfil_all(1,:);
RThigh_locY_unfil =       RThigh_loc_unfil_all(2,:);
RThigh_locZ_unfil =       RThigh_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RThigh_loc_fil =          RThigh_locX_unfil(trial_start_end);
segCenter_cal.RThigh_loc_fil(2,:) =     RThigh_locY_unfil(trial_start_end);
segCenter_cal.RThigh_loc_fil(3,:) =     RThigh_locZ_unfil(trial_start_end);

%Identify the market/segment
RKnee_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_locX_unfil =      RKnee_loc_unfil_all(1,:);
RKnee_locY_unfil =      RKnee_loc_unfil_all(2,:);
RKnee_locZ_unfil =      RKnee_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RKnee_loc_fil =           RKnee_locX_unfil(trial_start_end);
segCenter_cal.RKnee_loc_fil(2,:) =      RKnee_locY_unfil(trial_start_end);
segCenter_cal.RKnee_loc_fil(3,:) =      RKnee_locZ_unfil(trial_start_end);

%Identify the market/segment
RLeg_loc_unfil_all = 	segCenter.LLegCenter_mar_dim_frame;
RLeg_locX_unfil =       RLeg_loc_unfil_all(1,:);
RLeg_locY_unfil =       RLeg_loc_unfil_all(2,:);
RLeg_locZ_unfil =       RLeg_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RLeg_loc_fil =            RLeg_locX_unfil(trial_start_end);
segCenter_cal.RLeg_loc_fil(2,:) =       RLeg_locY_unfil(trial_start_end);
segCenter_cal.RLeg_loc_fil(3,:) =       RLeg_locZ_unfil(trial_start_end);

%Identify the market/segment
RAnkle_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RAnkle_locX_unfil =     RAnkle_loc_unfil_all(1,:);
RAnkle_locY_unfil =     RAnkle_loc_unfil_all(2,:);
RAnkle_locZ_unfil =     RAnkle_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RAnkle_loc_fil =          RAnkle_locX_unfil(trial_start_end);
segCenter_cal.RAnkle_loc_fil(2,:) =     RAnkle_locY_unfil(trial_start_end);
segCenter_cal.RAnkle_loc_fil(3,:) =     RAnkle_locZ_unfil(trial_start_end);

%Identify the market/segment
RFoot_loc_unfil_all =   segCenter.RFootCenter_mar_dim_frame;
RFoot_locX_unfil =      RFoot_loc_unfil_all(1,:);
RFoot_locY_unfil =      RFoot_loc_unfil_all(2,:);
RFoot_locZ_unfil =      RFoot_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RFoot_loc_fil =           RFoot_locX_unfil(trial_start_end);
segCenter_cal.RFoot_loc_fil(2,:) =      RFoot_locY_unfil(trial_start_end);
segCenter_cal.RFoot_loc_fil(3,:) =      RFoot_locZ_unfil(trial_start_end);

%Identify the market/segment
RToeTip_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RToeTip_locX_unfil =      RToeTip_loc_unfil_all(1,:);
RToeTip_locY_unfil =      RToeTip_loc_unfil_all(2,:);
RToeTip_locZ_unfil =      RToeTip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RToeTip_loc_fil =         RToeTip_locX_unfil(trial_start_end);
segCenter_cal.RToeTip_loc_fil(2,:) =    RToeTip_locY_unfil(trial_start_end);
segCenter_cal.RToeTip_loc_fil(3,:) =    RToeTip_locZ_unfil(trial_start_end);

%Create for loop that cleans up code
% for ii = 1:3
%     RHip_loc_fil = 
%     
% end

end