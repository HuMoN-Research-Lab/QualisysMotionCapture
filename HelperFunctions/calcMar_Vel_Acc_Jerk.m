function [marVel,marAcc,marJerk,marJerk_squared,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,totalCOMXYZ)

%% Marker tracking hip data
%hipIDs were acquired using the markerLabels
marVel =  [];
marAcc =  [];
marJerk = [];
LFoot =   [];
RFoot =   [];

%% COM vel, acc, and jerk calculations
marVelx =           diff(totalCOMXYZ(1,:));
marVelz =           diff(totalCOMXYZ(3,:));
calc_marVel =       plus(marVelx,marVelz);

%id start and end point of trial
ind_start_end =     find(calc_marVel > 2);

%vel, acc, and jerk calc
marVel =            calc_marVel(ind_start_end);
marAcc =            diff(marVel);
marJerk =           diff(marAcc);
marJerk_squared =   (marJerk).^2;

%% RAnkle & LAnkle vel, acc, and jerk calculations
% locate RFoot and LFoot position at start and end of trial
RFoot_marPosx =             segCenter.RFootCenter_mar_dim_frame(1,:);
RFoot_marVelx =             diff(RFoot_marPosx(ind_start_end));
RFoot_marPosz =             segCenter.RFootCenter_mar_dim_frame(3,:);
RFoot_marVelz =             diff(RFoot_marPosz(ind_start_end));
LFoot_marPosx =             segCenter.LFootCenter_mar_dim_frame(1,:);
LFoot_marVelx =             diff(LFoot_marPosx(ind_start_end));
LFoot_marPosz =             segCenter.LFootCenter_mar_dim_frame(3,:);
LFoot_marVelz =             diff(LFoot_marPosz(ind_start_end));

%Calc vel, acc, and jerk for RFoot and LFoot
RFoot.marVel =              plus(RFoot_marVelx,RFoot_marVelz);
RFoot.marAcc =              diff(RFoot.marVel);
RFoot.marJerk =             diff(RFoot.marAcc);
RFoot.marJerk_squared =     (RFoot.marJerk).^2;

LFoot.marVel =              plus(LFoot_marVelx,LFoot_marVelz);
LFoot.marAcc =              diff(LFoot.marVel);
LFoot.marJerk =             diff(LFoot.marAcc);
LFoot.marJerk_squared =     (LFoot.marJerk).^2;

%% Old Code
% RFoot_marVelx =           diff(segCenter.RFootCenter_mar_dim_frame(1,:));
% RFoot_marVelz =           diff(segCenter.RFootCenter_mar_dim_frame(3,:));
% RFoot.marVel =            plus(RFoot_marVelx,RFoot_marVelz);

end

