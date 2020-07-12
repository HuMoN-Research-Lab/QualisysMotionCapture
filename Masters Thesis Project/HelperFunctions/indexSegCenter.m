function [segCenter_cal] = indexSegCenter(segCenter,trial_start_end,marker_mar_dim_frame,markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function indexes segCenter data to trial_start_end frames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
segCenter_cal = [];

%% Head marker upper extremities calibration
%Index the market/segment
segCenter_cal.HeadL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadL');

%Identify the market/segment
segCenter_cal.HeadTop =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadTop');

%Identify the market/segment
segCenter_cal.HeadR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadR');

%Identify the market/segment
segCenter_cal.HeadFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadFront');

%% Marker LUpper extremities calibration
%Identify the market/segment
segCenter_cal.LShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderTop');

%Identify the market/segment
segCenter_cal.LShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderBack');

%Identify the market/segment
segCenter_cal.LArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LArm');

%Identify the market/segment
segCenter_cal.LElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LElbowOut');

%Identify the market/segment
segCenter_cal.LWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristOut');

%Identify the market/segment
segCenter_cal.LWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristIn');

%Identify the market/segment
segCenter_cal.LHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LHandOut');

%% Head center upper extremities calibration
%Identify the market/segment
segCenter_cal.HeadCenter =          segCenter.headCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.SpineTop =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'SpineTop');

%Identify the market/segment
segCenter_cal.ChestCenter =         segCenter.chestCenter_mar_dim_frame(:,trial_start_end);

%% SegCenter LUpper extremities calibration
%Identify the market/segment
segCenter_cal.LShoulderCenter =     segCenter.LShoulderCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LUpperArmCenter =     segCenter.LUpperArmCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LForearmCenter =      segCenter.LForearmCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LHandCenter =         segCenter.LHandCenter_mar_dim_frame(:,trial_start_end);

%% Marker RUpper extremities calibration
%Identify the market/segment
segCenter_cal.RShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderTop');

%Identify the market/segment
segCenter_cal.RShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderBack');

%Identify the market/segment
segCenter_cal.RArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RArm');

%Identify the market/segment
segCenter_cal.RElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RElbowOut');

%Identify the market/segment
segCenter_cal.RWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristOut');

%Identify the market/segment
segCenter_cal.RWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristIn');

%Identify the market/segment
segCenter_cal.RHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RHandOut');

%% SegCenter RUpper extremities calibration
%Identify the market/segment
segCenter_cal.RShoulderCenter =     segCenter.RShoulderCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RUpperArmCenter =     segCenter.RUpperArmCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RForearmCenter =      segCenter.RForearmCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RHandCenter =         segCenter.RHandCenter_mar_dim_frame(:,trial_start_end);

%% Marker LLower extremities calibration
%Identify the market/segment
segCenter_cal.LHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLFront');

%Identify the market/segment
segCenter_cal.LHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLBack');

%Identify the market/segment
segCenter_cal.LKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LKneeOut');

%Identify the market/segment
segCenter_cal.LAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LAnkleOut');

%Identify the market/segment
segCenter_cal.LToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LToeTip');

%% SegCenter LLower extremities calibration
%Identify the market/segment
segCenter_cal.LHipCenter =          segCenter.LHipCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LThigh =              segCenter.LThighCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LLeg =                segCenter.LLegCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.LFoot =               segCenter.LFootCenter_mar_dim_frame(:,trial_start_end);

%% Marker RLower extremities calibration
%Identify the market/segment
segCenter_cal.RHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRFront');

%Identify the market/segment
segCenter_cal.RHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRBack');

%Identify the market/segment
segCenter_cal.RKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RKneeOut');

%Identify the market/segment
segCenter_cal.RAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RAnkleOut');

%Identify the market/segment
segCenter_cal.RToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RToeTip');

%% Reformat RLower extremities data
%Identify the market/segment
segCenter_cal.RHipCenter =          segCenter.RHipCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RThigh =              segCenter.RThighCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RLeg =                segCenter.RLegCenter_mar_dim_frame(:,trial_start_end);

%Identify the market/segment
segCenter_cal.RFoot =               segCenter.RFootCenter_mar_dim_frame(:,trial_start_end);

end