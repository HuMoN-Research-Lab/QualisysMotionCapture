function [trial_start_end,vel_start_end,acc_start_end,jerk_start_end,all_markers] = calc_COMXYZ_vel_acc_jerk(totalCOMXYZ,num_frames,marker_mar_dim_frame,marker_labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identifies and indexes the start and end of a trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%differences might be magnified in diff dimensions
%free walking people walk faster
%limited walking people walk slower but evaluate diff dimension 

%% Define output structure
totalCOM_metrics = [];
all_markers = [];
vel_frames = (num_frames-1);

%% COM vel, acc, and jerk calculations
%movement of totalCOM used to ID start of trial
marVelx =                       diff(totalCOMXYZ(1,:));
marVely_calc =                  diff(totalCOMXYZ(2,:));
marVelz =                       diff(totalCOMXYZ(3,:));

for ii = 1:vel_frames
    if mean(marVely_calc) <= 0
        marVely(1,ii) = -marVely_calc(1,ii);
    else
        marVely = marVely_calc;
    end
end

calc_totalmarVel =              plus(marVelx,marVely);
trial_start_end =               find(calc_totalmarVel > 2);

for jj = 1:length(trial_start_end)
    time_start_end(1,jj) = (trial_start_end(1,jj))/300;
end

vel_start_end = resample(time_start_end,length(time_start_end)-1,length(time_start_end));
acc_start_end = resample(vel_start_end,length(vel_start_end)-1,length(vel_start_end));
jerk_start_end = resample(acc_start_end,length(acc_start_end)-1,length(acc_start_end));
% figure(1)
% plot(calc_totalmarVel)

%velx, accx, and jerkx
totalCOM_metrics.marVelx =         marVelx(trial_start_end);
totalCOM_metrics.marAccx =         diff(totalCOM_metrics.marVelx);
totalCOM_metrics.absMarJerkx =     abs(diff(totalCOM_metrics.marAccx));

%vely, accy, and jerky 
totalCOM_metrics.marVely =         marVely(trial_start_end);
totalCOM_metrics.marAccy =         diff(totalCOM_metrics.marVely);
totalCOM_metrics.absMarJerky =     abs(diff(totalCOM_metrics.marAccy));

%velz, accz, and jerkz
totalCOM_metrics.marVelz =         marVelz(trial_start_end);
totalCOM_metrics.marAccz =         diff(totalCOM_metrics.marVelz);
totalCOM_metrics.absMarJerkz =     abs(diff(totalCOM_metrics.marAccz));

%total marker vel, acc, and jerk calc
totalCOM_metrics.totalmarVel =         calc_totalmarVel(trial_start_end);
totalCOM_metrics.totalmarAcc =         diff(totalCOM_metrics.totalmarVel);
totalCOM_metrics.totalmarJerk =        diff(totalCOM_metrics.totalmarAcc);
totalCOM_metrics.totalmarJerk_abs =    abs(totalCOM_metrics.totalmarJerk);

%Identify all markers
%% Head markers indexing
%Index marker
all_markers.HeadL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadL');
all_markers.HeadTop =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadTop');
all_markers.HeadR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadR');
all_markers.HeadFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'HeadFront');
all_markers.SpineTop =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'SpineTop');
all_markers.Chest =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'Chest');
all_markers.BackL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'BackL');
all_markers.BackR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'BackR');
all_markers.LHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistLFront');
all_markers.LHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistLBack');
all_markers.RHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistRFront');
all_markers.RHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'WaistRBack');

%% Upper markers indexing
%Index markers
all_markers.LShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LShoulderTop');
all_markers.LShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LShoulderBack');
all_markers.RShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RShoulderTop');
all_markers.RShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RShoulderBack');
all_markers.LArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LArm');
all_markers.RArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RArm');
all_markers.LElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LElbowOut');
all_markers.RElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RElbowOut');
all_markers.LWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LWristOut');
all_markers.LWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LWristIn');
all_markers.LHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LHandOut');
all_markers.RWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RWristOut');
all_markers.RWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RWristIn');
all_markers.RHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RHandOut');

%% Lower marker indexing
%Index markers
all_markers.LThigh =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LThigh');
all_markers.RThigh =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RThigh');
all_markers.LKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LKneeOut');
all_markers.RKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RKneeOut');
all_markers.LLeg =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LShin');
all_markers.RLeg =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RShin');
all_markers.LAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LAnkleOut');
all_markers.RAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RAnkleOut');
all_markers.LHeel =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LHeelBack');
all_markers.RHeel =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RHeelBack');
all_markers.LForefoot =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LForefootOut');
all_markers.RForefoot =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RForefootOut');
all_markers.LToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LToeTip');
all_markers.RToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RToeTip');

%% Lower marker clusters indexing
all_markers.LUpLegCluster1 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftUpLegCluster1');
all_markers.LUpLegCluster2 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftUpLegCluster2');
all_markers.LUpLegCluster3 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftUpLegCluster3');
all_markers.LUpLegCluster4 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftUpLegCluster4');
all_markers.RUpLegCluster1 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightUpLegCluster1');
all_markers.RUpLegCluster2 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightUpLegCluster2');
all_markers.RUpLegCluster3 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightUpLegCluster3');
all_markers.RUpLegCluster4 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightUpLegCluster4');

all_markers.LLegCluster1 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftLegCluster1');
all_markers.LLegCluster2 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftLegCluster2');
all_markers.LLegCluster3 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftLegCluster3');
all_markers.LLegCluster4 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'LeftLegCluster4');
all_markers.RLegCluster1 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightLegCluster1');
all_markers.RLegCluster2 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightLegCluster2');
all_markers.RLegCluster3 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightLegCluster3');
all_markers.RLegCluster4 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),marker_labels,'RightLegCluster4');

end

