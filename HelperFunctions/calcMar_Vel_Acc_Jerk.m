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
marVel =            plus(marVelx,marVelz);
marAcc =            diff(marVel);
marJerk =           diff(marAcc);
marJerk_squared =   (marJerk).^2;

%% RAnkle & LAnkle vel, acc, and jerk calculations
RFoot_marVelx =           diff(segCenter.RFootCenter_mar_dim_frame(1,:));
RFoot_marVelz =           diff(segCenter.RFootCenter_mar_dim_frame(3,:));
RFoot.marVel =            plus(RFoot_marVelx,RFoot_marVelz);
RFoot.marAcc =            diff(marVel);
RFoot.marJerk =           diff(marAcc);
RFoot.marJerk_squared =   (marJerk).^2;

LFoot_marVelx =           diff(segCenter.LFootCenter_mar_dim_frame(1,:));
LFoot_marVelz =           diff(segCenter.LFootCenter_mar_dim_frame(3,:));
LFoot.marVel =            plus(LFoot_marVelx,LFoot_marVelz);
LFoot.marAcc =            diff(marVel);
LFoot.marJerk =           diff(marAcc);
LFoot.marJerk_squared =   (marJerk).^2;

end

