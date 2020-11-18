function [seg_center_cal] = index_seg_center(seg_center,trial_start_end,marker_mar_dim_frame,marker_labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function indexes segCenter data to trial_start_end frames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
seg_center_cal = [];

%% Head marker upper extremities calibration
%Index the market/segment
seg_center_cal.HeadL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadL');
seg_center_cal.HeadTop =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadTop');
seg_center_cal.HeadR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadR');
seg_center_cal.HeadFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadFront');

%% Marker upper extremities calibration
seg_center_cal.LShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LShoulderTop');
seg_center_cal.RShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RShoulderTop');
seg_center_cal.LShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LShoulderBack');
seg_center_cal.RShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RShoulderBack');
seg_center_cal.LArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LArm');
seg_center_cal.RArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RArm');
seg_center_cal.LElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LElbowOut');
seg_center_cal.RElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RElbowOut');
seg_center_cal.LWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LWristOut');
seg_center_cal.RWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RWristOut');
seg_center_cal.LWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LWristIn');
seg_center_cal.RWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RWristIn');
seg_center_cal.LHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LHandOut');
seg_center_cal.RHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RHandOut');

%% Head center upper extremities calibration
seg_center_cal.HeadCenter =          seg_center.headCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.SpineTop =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'SpineTop');
seg_center_cal.ChestCenter =         seg_center.chestCenter_mar_dim_frame(:,trial_start_end);

%% SegCenter upper extremities calibration
seg_center_cal.LShoulderCenter =     seg_center.LShoulderCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RShoulderCenter =     seg_center.RShoulderCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LUpperArmCenter =     seg_center.LUpperArmCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RUpperArmCenter =     seg_center.RUpperArmCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LForearmCenter =      seg_center.LForearmCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RForearmCenter =      seg_center.RForearmCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LHandCenter =         seg_center.LHandCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RHandCenter =         seg_center.RHandCenter_mar_dim_frame(:,trial_start_end);

%% Marker lower extremities calibration
seg_center_cal.LHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistLFront');
seg_center_cal.RHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistRFront');
seg_center_cal.LHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistLBack');
seg_center_cal.RHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistRBack');
seg_center_cal.LKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LKneeOut');
seg_center_cal.RKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RKneeOut');
seg_center_cal.LAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LAnkleOut');
seg_center_cal.RAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RAnkleOut');
seg_center_cal.LToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LToeTip');
seg_center_cal.RToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RToeTip');

%% SegCenter lower extremities calibration
seg_center_cal.LHipCenter =          seg_center.LHipCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RHipCenter =          seg_center.RHipCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LThigh =              seg_center.LThighCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RThigh =              seg_center.RThighCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LLeg =                seg_center.LLegCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RLeg =                seg_center.RLegCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.LFoot =               seg_center.LFootCenter_mar_dim_frame(:,trial_start_end);
seg_center_cal.RFoot =               seg_center.RFootCenter_mar_dim_frame(:,trial_start_end);

end