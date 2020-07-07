function [segCenter_cal] = calibrateSegCenter(segCenter,trial_start_end,marker_mar_dim_frame,markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calibrates segCenter data to its respective location on force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
segCenter_cal = [];

%% Head marker upper extremities calibration
%Identify the market/segment
HeadL_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadL_locX_unfil =       HeadL_loc_unfil_all(1,:);
HeadL_locY_unfil =       HeadL_loc_unfil_all(2,:);
HeadL_locZ_unfil =       HeadL_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.HeadL_loc_fil =       HeadL_locX_unfil(trial_start_end);
segCenter_cal.HeadL_loc_fil(2,:) =  HeadL_locY_unfil(trial_start_end);
segCenter_cal.HeadL_loc_fil(3,:) =  HeadL_locZ_unfil(trial_start_end); 

%Identify the market/segment
HeadTop_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadTop_locX_unfil =       HeadTop_loc_unfil_all(1,:);
HeadTop_locY_unfil =       HeadTop_loc_unfil_all(2,:);
HeadTop_locZ_unfil =       HeadTop_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.HeadTop_loc_fil =       HeadTop_locX_unfil(trial_start_end);
segCenter_cal.HeadTop_loc_fil(2,:) =  HeadTop_locY_unfil(trial_start_end);
segCenter_cal.HeadTop_loc_fil(3,:) =  HeadTop_locZ_unfil(trial_start_end);

%Identify the market/segment
HeadR_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadR_locX_unfil =       HeadR_loc_unfil_all(1,:);
HeadR_locY_unfil =       HeadR_loc_unfil_all(2,:);
HeadR_locZ_unfil =       HeadR_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.HeadR_loc_fil =       HeadR_locX_unfil(trial_start_end);
segCenter_cal.HeadR_loc_fil(2,:) =  HeadR_locY_unfil(trial_start_end);
segCenter_cal.HeadR_loc_fil(3,:) =  HeadR_locZ_unfil(trial_start_end);

%Identify the market/segment
HeadFront_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');
HeadFront_locX_unfil =       HeadFront_loc_unfil_all(1,:);
HeadFront_locY_unfil =       HeadFront_loc_unfil_all(2,:);
HeadFront_locZ_unfil =       HeadFront_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.HeadFront_loc_fil =       HeadFront_locX_unfil(trial_start_end);
segCenter_cal.HeadFront_loc_fil(2,:) =  HeadFront_locY_unfil(trial_start_end);
segCenter_cal.HeadFront_loc_fil(3,:) =  HeadFront_locZ_unfil(trial_start_end);

%% Marker LUpper extremities calibration
%Identify the market/segment
LShoulderTop_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderTop_locX_unfil =       LShoulderTop_loc_unfil_all(1,:);
LShoulderTop_locY_unfil =       LShoulderTop_loc_unfil_all(2,:);
LShoulderTop_locZ_unfil =       LShoulderTop_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LShoulderTop_loc_fil =       LShoulderTop_locX_unfil(trial_start_end);
segCenter_cal.LShoulderTop_loc_fil(2,:) =  LShoulderTop_locY_unfil(trial_start_end);
segCenter_cal.LShoulderTop_loc_fil(3,:) =  LShoulderTop_locZ_unfil(trial_start_end);

%Identify the market/segment
LShoulderBack_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');
LShoulderBack_locX_unfil =      LShoulderBack_loc_unfil_all(1,:);
LShoulderBack_locY_unfil =      LShoulderBack_loc_unfil_all(2,:);
LShoulderBack_locZ_unfil =      LShoulderBack_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LShoulderBack_loc_fil =       LShoulderBack_locX_unfil(trial_start_end);
segCenter_cal.LShoulderBack_loc_fil(2,:) =  LShoulderBack_locY_unfil(trial_start_end);
segCenter_cal.LShoulderBack_loc_fil(3,:) =  LShoulderBack_locZ_unfil(trial_start_end);

%Identify the market/segment
LArm_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'LArm');
LArm_locX_unfil =       LArm_loc_unfil_all(1,:);
LArm_locY_unfil =       LArm_loc_unfil_all(2,:);
LArm_locZ_unfil =       LArm_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LArm_loc_fil =       LArm_locX_unfil(trial_start_end);
segCenter_cal.LArm_loc_fil(2,:) =  LArm_locY_unfil(trial_start_end);
segCenter_cal.LArm_loc_fil(3,:) =  LArm_locZ_unfil(trial_start_end);

%Identify the market/segment
LElbow_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'LElbowOut');
LElbow_locX_unfil = 	LElbow_loc_unfil_all(1,:);
LElbow_locY_unfil =     LElbow_loc_unfil_all(2,:);
LElbow_locZ_unfil =     LElbow_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LElbow_loc_fil =       LElbow_locX_unfil(trial_start_end);
segCenter_cal.LElbow_loc_fil(2,:) =  LElbow_locY_unfil(trial_start_end);
segCenter_cal.LElbow_loc_fil(3,:) =  LElbow_locZ_unfil(trial_start_end);

%Identify the market/segment
LWristOut_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristOut_locX_unfil =      LWristOut_loc_unfil_all(1,:);
LWristOut_locY_unfil =      LWristOut_loc_unfil_all(2,:);
LWristOut_locZ_unfil =      LWristOut_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LWristOut_loc_fil =       LWristOut_locX_unfil(trial_start_end);
segCenter_cal.LWristOut_loc_fil(2,:) =  LWristOut_locY_unfil(trial_start_end);
segCenter_cal.LWristOut_loc_fil(3,:) =  LWristOut_locZ_unfil(trial_start_end);

%Identify the market/segment
LWristIn_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'LWristIn');
LWristIn_locX_unfil =       LWristIn_loc_unfil_all(1,:);
LWristIn_locY_unfil =       LWristIn_loc_unfil_all(2,:);
LWristIn_locZ_unfil =       LWristIn_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LWristIn_loc_fil =       LWristIn_locX_unfil(trial_start_end);
segCenter_cal.LWristIn_loc_fil(2,:) =  LWristIn_locY_unfil(trial_start_end);
segCenter_cal.LWristIn_loc_fil(3,:) =  LWristIn_locZ_unfil(trial_start_end);

%Identify the market/segment
LHandOut_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');
LHandOut_locX_unfil =       LHandOut_loc_unfil_all(1,:);
LHandOut_locY_unfil =       LHandOut_loc_unfil_all(2,:);
LHandOut_locZ_unfil =       LHandOut_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHandOut_loc_fil =       LHandOut_locX_unfil(trial_start_end);
segCenter_cal.LHandOut_loc_fil(2,:) =  LHandOut_locY_unfil(trial_start_end);
segCenter_cal.LHandOut_loc_fil(3,:) =  LHandOut_locZ_unfil(trial_start_end);

%% Head center upper extremities calibration
%Identify the market/segment
HeadCenter_loc_unfil_all =    segCenter.headCenter_mar_dim_frame;
HeadCenter_locX_unfil =       HeadCenter_loc_unfil_all(1,:);
HeadCenter_locY_unfil =       HeadCenter_loc_unfil_all(2,:);
HeadCenter_locZ_unfil =       HeadCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.HeadCenter_loc_fil =       HeadCenter_locX_unfil(trial_start_end);
segCenter_cal.HeadCenter_loc_fil(2,:) =  HeadCenter_locY_unfil(trial_start_end);
segCenter_cal.HeadCenter_loc_fil(3,:) =  HeadCenter_locZ_unfil(trial_start_end); 

%Identify the market/segment
SpineTop_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'SpineTop');
SpineTop_locX_unfil =       SpineTop_loc_unfil_all(1,:);
SpineTop_locY_unfil =       SpineTop_loc_unfil_all(2,:);
SpineTop_locZ_unfil =       SpineTop_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.SpineTop_loc_fil =       SpineTop_locX_unfil(trial_start_end);
segCenter_cal.SpineTop_loc_fil(2,:) =  SpineTop_locY_unfil(trial_start_end);
segCenter_cal.SpineTop_loc_fil(3,:) =  SpineTop_locZ_unfil(trial_start_end);

%Identify the market/segment
ChestCenter_loc_unfil_all =    segCenter.chestCenter_mar_dim_frame;
ChestCenter_locX_unfil =       ChestCenter_loc_unfil_all(1,:);
ChestCenter_locY_unfil =       ChestCenter_loc_unfil_all(2,:);
ChestCenter_locZ_unfil =       ChestCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.ChestCenter_loc_fil =       ChestCenter_locX_unfil(trial_start_end);
segCenter_cal.ChestCenter_loc_fil(2,:) =  ChestCenter_locY_unfil(trial_start_end);
segCenter_cal.ChestCenter_loc_fil(3,:) =  ChestCenter_locZ_unfil(trial_start_end);

%% SegCenter LUpper extremities calibration
%Identify the market/segment
LShoulderCenter_loc_unfil_all =  segCenter.LShoulderCenter_mar_dim_frame;
LShoulderCenter_locX_unfil =     LShoulderCenter_loc_unfil_all(1,:);
LShoulderCenter_locY_unfil =     LShoulderCenter_loc_unfil_all(2,:);
LShoulderCenter_locZ_unfil =     LShoulderCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LShoulderCenter_loc_fil =       LShoulderCenter_locX_unfil(trial_start_end);
segCenter_cal.LShoulderCenter_loc_fil(2,:) =  LShoulderCenter_locY_unfil(trial_start_end);
segCenter_cal.LShoulderCenter_loc_fil(3,:) =  LShoulderCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
LUpperArmCenter_loc_unfil_all =  segCenter.LUpperArmCenter_mar_dim_frame;
LUpperArmCenter_locX_unfil =     LUpperArmCenter_loc_unfil_all(1,:);
LUpperArmCenter_locY_unfil =     LUpperArmCenter_loc_unfil_all(2,:);
LUpperArmCenter_locZ_unfil =     LUpperArmCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LUpperArmCenter_loc_fil =       LUpperArmCenter_locX_unfil(trial_start_end);
segCenter_cal.LUpperArmCenter_loc_fil(2,:) =  LUpperArmCenter_locY_unfil(trial_start_end);
segCenter_cal.LUpperArmCenter_loc_fil(3,:) =  LUpperArmCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
LForearmCenter_loc_unfil_all =  segCenter.LForearmCenter_mar_dim_frame;
LForearmCenter_locX_unfil =     LForearmCenter_loc_unfil_all(1,:);
LForearmCenter_locY_unfil =     LForearmCenter_loc_unfil_all(2,:);
LForearmCenter_locZ_unfil =     LForearmCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LForearmCenter_loc_fil =       LForearmCenter_locX_unfil(trial_start_end);
segCenter_cal.LForearmCenter_loc_fil(2,:) =  LForearmCenter_locY_unfil(trial_start_end);
segCenter_cal.LForearmCenter_loc_fil(3,:) =  LForearmCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
LHandCenter_loc_unfil_all =  segCenter.LHandCenter_mar_dim_frame;
LHandCenter_locX_unfil =     LHandCenter_loc_unfil_all(1,:);
LHandCenter_locY_unfil =     LHandCenter_loc_unfil_all(2,:);
LHandCenter_locZ_unfil =     LHandCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHandCenter_loc_fil =       LHandCenter_locX_unfil(trial_start_end);
segCenter_cal.LHandCenter_loc_fil(2,:) =  LHandCenter_locY_unfil(trial_start_end);
segCenter_cal.LHandCenter_loc_fil(3,:) =  LHandCenter_locZ_unfil(trial_start_end);

%% Marker RUpper extremities calibration
%Identify the market/segment
RShoulderTop_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderTop_locX_unfil =       RShoulderTop_loc_unfil_all(1,:);
RShoulderTop_locY_unfil =       RShoulderTop_loc_unfil_all(2,:);
RShoulderTop_locZ_unfil =       RShoulderTop_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RShoulderTop_loc_fil =       RShoulderTop_locX_unfil(trial_start_end);
segCenter_cal.RShoulderTop_loc_fil(2,:) =  RShoulderTop_locY_unfil(trial_start_end);
segCenter_cal.RShoulderTop_loc_fil(3,:) =  RShoulderTop_locZ_unfil(trial_start_end);

%Identify the market/segment
RShoulderBack_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');
RShoulderBack_locX_unfil =      RShoulderBack_loc_unfil_all(1,:);
RShoulderBack_locY_unfil =      RShoulderBack_loc_unfil_all(2,:);
RShoulderBack_locZ_unfil =      RShoulderBack_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RShoulderBack_loc_fil =       RShoulderBack_locX_unfil(trial_start_end);
segCenter_cal.RShoulderBack_loc_fil(2,:) =  RShoulderBack_locY_unfil(trial_start_end);
segCenter_cal.RShoulderBack_loc_fil(3,:) =  RShoulderBack_locZ_unfil(trial_start_end);

%Identify the market/segment
RArm_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'RArm');
RArm_locX_unfil =       RArm_loc_unfil_all(1,:);
RArm_locY_unfil =       RArm_loc_unfil_all(2,:);
RArm_locZ_unfil =       RArm_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RArm_loc_fil =       RArm_locX_unfil(trial_start_end);
segCenter_cal.RArm_loc_fil(2,:) =  RArm_locY_unfil(trial_start_end);
segCenter_cal.RArm_loc_fil(3,:) =  RArm_locZ_unfil(trial_start_end);

%Identify the market/segment
RElbow_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'RElbowOut');
RElbow_locX_unfil = 	RElbow_loc_unfil_all(1,:);
RElbow_locY_unfil =     RElbow_loc_unfil_all(2,:);
RElbow_locZ_unfil =     RElbow_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RElbow_loc_fil =       RElbow_locX_unfil(trial_start_end);
segCenter_cal.RElbow_loc_fil(2,:) =  RElbow_locY_unfil(trial_start_end);
segCenter_cal.RElbow_loc_fil(3,:) =  RElbow_locZ_unfil(trial_start_end);

%Identify the market/segment
RWristOut_loc_unfil_all = 	getMarker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristOut_locX_unfil =      RWristOut_loc_unfil_all(1,:);
RWristOut_locY_unfil =      RWristOut_loc_unfil_all(2,:);
RWristOut_locZ_unfil =      RWristOut_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RWristOut_loc_fil =       RWristOut_locX_unfil(trial_start_end);
segCenter_cal.RWristOut_loc_fil(2,:) =  RWristOut_locY_unfil(trial_start_end);
segCenter_cal.RWristOut_loc_fil(3,:) =  RWristOut_locZ_unfil(trial_start_end);

%Identify the market/segment
RWristIn_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'RWristIn');
RWristIn_locX_unfil =       RWristIn_loc_unfil_all(1,:);
RWristIn_locY_unfil =       RWristIn_loc_unfil_all(2,:);
RWristIn_locZ_unfil =       RWristIn_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RWristIn_loc_fil =       RWristIn_locX_unfil(trial_start_end);
segCenter_cal.RWristIn_loc_fil(2,:) =  RWristIn_locY_unfil(trial_start_end);
segCenter_cal.RWristIn_loc_fil(3,:) =  RWristIn_locZ_unfil(trial_start_end);

%Identify the market/segment
RHandOut_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');
RHandOut_locX_unfil =       RHandOut_loc_unfil_all(1,:);
RHandOut_locY_unfil =       RHandOut_loc_unfil_all(2,:);
RHandOut_locZ_unfil =       RHandOut_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHandOut_loc_fil =       RHandOut_locX_unfil(trial_start_end);
segCenter_cal.RHandOut_loc_fil(2,:) =  RHandOut_locY_unfil(trial_start_end);
segCenter_cal.RHandOut_loc_fil(3,:) =  RHandOut_locZ_unfil(trial_start_end);

%% SegCenter RUpper extremities calibration
%Identify the market/segment
RShoulderCenter_loc_unfil_all =     segCenter.RShoulderCenter_mar_dim_frame;
RShoulderCenter_locX_unfil =        RShoulderCenter_loc_unfil_all(1,:);
RShoulderCenter_locY_unfil =        RShoulderCenter_loc_unfil_all(2,:);
RShoulderCenter_locZ_unfil =        RShoulderCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RShoulderCenter_loc_fil =       RShoulderCenter_locX_unfil(trial_start_end);
segCenter_cal.RShoulderCenter_loc_fil(2,:) =  RShoulderCenter_locY_unfil(trial_start_end);
segCenter_cal.RShoulderCenter_loc_fil(3,:) =  RShoulderCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
RUpperArmCenter_loc_unfil_all =     segCenter.RUpperArmCenter_mar_dim_frame;
RUpperArmCenter_locX_unfil =        RUpperArmCenter_loc_unfil_all(1,:);
RUpperArmCenter_locY_unfil =        RUpperArmCenter_loc_unfil_all(2,:);
RUpperArmCenter_locZ_unfil =        RUpperArmCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RUpperArmCenter_loc_fil =       RUpperArmCenter_locX_unfil(trial_start_end);
segCenter_cal.RUpperArmCenter_loc_fil(2,:) =  RUpperArmCenter_locY_unfil(trial_start_end);
segCenter_cal.RUpperArmCenter_loc_fil(3,:) =  RUpperArmCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
RForearmCenter_loc_unfil_all =  segCenter.RForearmCenter_mar_dim_frame;
RForearmCenter_locX_unfil =     RForearmCenter_loc_unfil_all(1,:);
RForearmCenter_locY_unfil =     RForearmCenter_loc_unfil_all(2,:);
RForearmCenter_locZ_unfil =     RForearmCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RForearmCenter_loc_fil =       RForearmCenter_locX_unfil(trial_start_end);
segCenter_cal.RForearmCenter_loc_fil(2,:) =  RForearmCenter_locY_unfil(trial_start_end);
segCenter_cal.RForearmCenter_loc_fil(3,:) =  RForearmCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
RHandCenter_loc_unfil_all =  segCenter.RHandCenter_mar_dim_frame;
RHandCenter_locX_unfil =     RHandCenter_loc_unfil_all(1,:);
RHandCenter_locY_unfil =     RHandCenter_loc_unfil_all(2,:);
RHandCenter_locZ_unfil =     RHandCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHandCenter_loc_fil =       RHandCenter_locX_unfil(trial_start_end);
segCenter_cal.RHandCenter_loc_fil(2,:) =  RHandCenter_locY_unfil(trial_start_end);
segCenter_cal.RHandCenter_loc_fil(3,:) =  RHandCenter_locZ_unfil(trial_start_end);

%% Marker LLower extremities calibration
%Identify the market/segment
LHipFront_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'WaistLFront');
LHipFront_locX_unfil =     LHipFront_loc_unfil_all(1,:);
LHipFront_locY_unfil =     LHipFront_loc_unfil_all(2,:);
LHipFront_locZ_unfil =     LHipFront_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHipFront_loc_fil =       LHipFront_locX_unfil(trial_start_end);
segCenter_cal.LHipFront_loc_fil(2,:) =  LHipFront_locY_unfil(trial_start_end);
segCenter_cal.LHipFront_loc_fil(3,:) =  LHipFront_locZ_unfil(trial_start_end);

%Identify the market/segment
LHipBack_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'WaistLBack');
LHipBack_locX_unfil =     LHipBack_loc_unfil_all(1,:);
LHipBack_locY_unfil =     LHipBack_loc_unfil_all(2,:);
LHipBack_locZ_unfil =     LHipBack_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHipBack_loc_fil =        LHipBack_locX_unfil(trial_start_end);
segCenter_cal.LHipBack_loc_fil(2,:) =   LHipBack_locY_unfil(trial_start_end);
segCenter_cal.LHipBack_loc_fil(3,:) =   LHipBack_locZ_unfil(trial_start_end);

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
LAnkle_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');
LAnkle_locX_unfil =     LAnkle_loc_unfil_all(1,:);
LAnkle_locY_unfil =     LAnkle_loc_unfil_all(2,:);
LAnkle_locZ_unfil =     LAnkle_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LAnkle_loc_fil =          LAnkle_locX_unfil(trial_start_end);
segCenter_cal.LAnkle_loc_fil(2,:) =     LAnkle_locY_unfil(trial_start_end);
segCenter_cal.LAnkle_loc_fil(3,:) =     LAnkle_locZ_unfil(trial_start_end);

%Identify the market/segment
LToeTip_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LToeTip_locX_unfil =      LToeTip_loc_unfil_all(1,:);
LToeTip_locY_unfil =      LToeTip_loc_unfil_all(2,:);
LToeTip_locZ_unfil =      LToeTip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LToeTip_loc_fil =         LToeTip_locX_unfil(trial_start_end);
segCenter_cal.LToeTip_loc_fil(2,:) =    LToeTip_locY_unfil(trial_start_end);
segCenter_cal.LToeTip_loc_fil(3,:) =    LToeTip_locZ_unfil(trial_start_end);

%% SegCenter LLower extremities calibration
%Identify the market/segment
LHipCenter_loc_unfil_all =  segCenter.LHipCenter_mar_dim_frame;
LHipCenter_locX_unfil =     LHipCenter_loc_unfil_all(1,:);
LHipCenter_locY_unfil =     LHipCenter_loc_unfil_all(2,:);
LHipCenter_locZ_unfil =     LHipCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LHipCenter_loc_fil =          LHipCenter_locX_unfil(trial_start_end);
segCenter_cal.LHipCenter_loc_fil(2,:) =     LHipCenter_locY_unfil(trial_start_end);
segCenter_cal.LHipCenter_loc_fil(3,:) = 	LHipCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
LThigh_loc_unfil_all =      segCenter.LThighCenter_mar_dim_frame;
LThigh_locX_unfil =         LThigh_loc_unfil_all(1,:);
LThigh_locY_unfil =         LThigh_loc_unfil_all(2,:);
LThigh_locZ_unfil =         LThigh_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LThigh_loc_fil =              LThigh_locX_unfil(trial_start_end);
segCenter_cal.LThigh_loc_fil(2,:) =         LThigh_locY_unfil(trial_start_end);
segCenter_cal.LThigh_loc_fil(3,:) =         LThigh_locZ_unfil(trial_start_end);

%Identify the market/segment
LLeg_loc_unfil_all =        segCenter.LLegCenter_mar_dim_frame;
LLeg_locX_unfil =           LLeg_loc_unfil_all(1,:);
LLeg_locY_unfil =           LLeg_loc_unfil_all(2,:);
LLeg_locZ_unfil =           LLeg_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LLeg_loc_fil =                LLeg_locX_unfil(trial_start_end);
segCenter_cal.LLeg_loc_fil(2,:) =           LLeg_locY_unfil(trial_start_end);
segCenter_cal.LLeg_loc_fil(3,:) =           LLeg_locZ_unfil(trial_start_end);

%Identify the market/segment
LFoot_loc_unfil_all =       segCenter.LFootCenter_mar_dim_frame;
LFoot_locX_unfil =          LFoot_loc_unfil_all(1,:);
LFoot_locY_unfil =          LFoot_loc_unfil_all(2,:);
LFoot_locZ_unfil =          LFoot_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.LFoot_loc_fil =               LFoot_locX_unfil(trial_start_end);
segCenter_cal.LFoot_loc_fil(2,:) =          LFoot_locY_unfil(trial_start_end);
segCenter_cal.LFoot_loc_fil(3,:) =          LFoot_locZ_unfil(trial_start_end);

%Create for loop that cleans up code
% for ii = 1:3
%     RHip_loc_fil = 
%     
% end

%% Marker RLower extremities calibration
%Identify the market/segment
RHipFront_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'WaistRFront');
RHipFront_locX_unfil =      RHipFront_loc_unfil_all(1,:);
RHipFront_locY_unfil =      RHipFront_loc_unfil_all(2,:);
RHipFront_locZ_unfil =      RHipFront_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHipFront_loc_fil =       RHipFront_locX_unfil(trial_start_end);
segCenter_cal.RHipFront_loc_fil(2,:) =  RHipFront_locY_unfil(trial_start_end);
segCenter_cal.RHipFront_loc_fil(3,:) =  RHipFront_locZ_unfil(trial_start_end);

%Identify the market/segment
RHipBack_loc_unfil_all =    getMarker(marker_mar_dim_frame,markerLabels,'WaistRBack');
RHipBack_locX_unfil =       RHipBack_loc_unfil_all(1,:);
RHipBack_locY_unfil =       RHipBack_loc_unfil_all(2,:);
RHipBack_locZ_unfil =       RHipBack_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHipBack_loc_fil =        RHipBack_locX_unfil(trial_start_end);
segCenter_cal.RHipBack_loc_fil(2,:) =   RHipBack_locY_unfil(trial_start_end);
segCenter_cal.RHipBack_loc_fil(3,:) =   RHipBack_locZ_unfil(trial_start_end);

%Identify the market/segment
RKnee_loc_unfil_all =       getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_locX_unfil =          RKnee_loc_unfil_all(1,:);
RKnee_locY_unfil =          RKnee_loc_unfil_all(2,:);
RKnee_locZ_unfil =          RKnee_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RKnee_loc_fil =           RKnee_locX_unfil(trial_start_end);
segCenter_cal.RKnee_loc_fil(2,:) =      RKnee_locY_unfil(trial_start_end);
segCenter_cal.RKnee_loc_fil(3,:) =      RKnee_locZ_unfil(trial_start_end);

%Identify the market/segment
RAnkle_loc_unfil_all =      getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RAnkle_locX_unfil =         RAnkle_loc_unfil_all(1,:);
RAnkle_locY_unfil =         RAnkle_loc_unfil_all(2,:);
RAnkle_locZ_unfil =         RAnkle_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RAnkle_loc_fil =          RAnkle_locX_unfil(trial_start_end);
segCenter_cal.RAnkle_loc_fil(2,:) =     RAnkle_locY_unfil(trial_start_end);
segCenter_cal.RAnkle_loc_fil(3,:) =     RAnkle_locZ_unfil(trial_start_end);

%Identify the market/segment
RToeTip_loc_unfil_all =     getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RToeTip_locX_unfil =        RToeTip_loc_unfil_all(1,:);
RToeTip_locY_unfil =        RToeTip_loc_unfil_all(2,:);
RToeTip_locZ_unfil =        RToeTip_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RToeTip_loc_fil =         RToeTip_locX_unfil(trial_start_end);
segCenter_cal.RToeTip_loc_fil(2,:) =    RToeTip_locY_unfil(trial_start_end);
segCenter_cal.RToeTip_loc_fil(3,:) =    RToeTip_locZ_unfil(trial_start_end);

%% Reformat RLower extremities data
%Identify the market/segment
RHipCenter_loc_unfil_all = 	segCenter.RHipCenter_mar_dim_frame;
RHipCenter_locX_unfil =     RHipCenter_loc_unfil_all(1,:);
RHipCenter_locY_unfil =     RHipCenter_loc_unfil_all(2,:);
RHipCenter_locZ_unfil =     RHipCenter_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RHipCenter_loc_fil =            RHipCenter_locX_unfil(trial_start_end);
segCenter_cal.RHipCenter_loc_fil(2,:) =       RHipCenter_locY_unfil(trial_start_end);
segCenter_cal.RHipCenter_loc_fil(3,:) =       RHipCenter_locZ_unfil(trial_start_end);

%Identify the market/segment
RThigh_loc_unfil_all =      segCenter.RThighCenter_mar_dim_frame;
RThigh_locX_unfil =         RThigh_loc_unfil_all(1,:);
RThigh_locY_unfil =         RThigh_loc_unfil_all(2,:);
RThigh_locZ_unfil =         RThigh_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RThigh_loc_fil =          RThigh_locX_unfil(trial_start_end);
segCenter_cal.RThigh_loc_fil(2,:) =     RThigh_locY_unfil(trial_start_end);
segCenter_cal.RThigh_loc_fil(3,:) =     RThigh_locZ_unfil(trial_start_end);

%Identify the market/segment
RLeg_loc_unfil_all =        segCenter.RLegCenter_mar_dim_frame;
RLeg_locX_unfil =           RLeg_loc_unfil_all(1,:);
RLeg_locY_unfil =           RLeg_loc_unfil_all(2,:);
RLeg_locZ_unfil =           RLeg_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RLeg_loc_fil =            RLeg_locX_unfil(trial_start_end);
segCenter_cal.RLeg_loc_fil(2,:) =       RLeg_locY_unfil(trial_start_end);
segCenter_cal.RLeg_loc_fil(3,:) =       RLeg_locZ_unfil(trial_start_end);

%Identify the market/segment
RFoot_loc_unfil_all =       segCenter.RFootCenter_mar_dim_frame;
RFoot_locX_unfil =          RFoot_loc_unfil_all(1,:);
RFoot_locY_unfil =          RFoot_loc_unfil_all(2,:);
RFoot_locZ_unfil =          RFoot_loc_unfil_all(3,:);

%Filter using start and end of trial
segCenter_cal.RFoot_loc_fil =           RFoot_locX_unfil(trial_start_end);
segCenter_cal.RFoot_loc_fil(2,:) =      RFoot_locY_unfil(trial_start_end);
segCenter_cal.RFoot_loc_fil(3,:) =      RFoot_locZ_unfil(trial_start_end);

%Create for loop that cleans up code
% for ii = 1:3
%     RHip_loc_fil = 
%     
% end

end