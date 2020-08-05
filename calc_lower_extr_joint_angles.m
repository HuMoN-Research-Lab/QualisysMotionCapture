function [jointAngles] = calc_lower_extr_joint_angles(skeleton)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcSegCOM find the center position for each anatomical segment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define output values for function
jointAngles = [];

%% Load skeleton joint locations
HipCenter_s =       skeleton.HipCenter;
LHipCenter_s =      skeleton.LHipCenter;
RHipCenter_s =      skeleton.RHipCenter;
LKnee_s =           skeleton.LKnee;
RKnee_s =           skeleton.RKnee;
LAnkle_s =          skeleton.LAnkle;
RAnkle_s =          skeleton.RAnkle;

% LToeBase_s =        skeleton.LToeBase;
% RToeBase_s =        skeleton.RToeBase;

%% RKnee Angles
%first attempt
%walking cycle of one step (frames: 307 - 644)
knee_cal = LKnee_s - 
angle_knee = atan2d(RKnee_s(3,:),RKnee_s(1,:));
figure(10); plot(angle_knee);

%second attempt
angle_knee = atan2d(RKnee_s(3,:),RKnee_s(2,:)); %wrong! - solely decreases
angle_knee = atan2d(RKnee_s(2,:),RKnee_s(3,:)); %wrong! - solely increases
angle_knee = atan2d(RKnee_s(1,:),RKnee_s(3,:)); %gradual increase and decrease (possible)
angle_knee = atan2d(RKnee_s(3,:),RKnee_s(1,:)); %opposite of previous one, might need to be calib
figure(10); plot(angle_knee);


end