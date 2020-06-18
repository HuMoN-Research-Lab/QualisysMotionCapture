function [segTheta] = calcSegAngle(marker_mar_dim_frame,markerLabels) %segCenter,trial_start_end,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcSegAngle calculates the angle for lower extremity joints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial Conditions & Marker Reformating
segTheta = [];

%Hip marker reformatting
LFHip_mar =         getMarker(marker_mar_dim_frame,markerLabels,'WaistLFront');
LBHip_mar =         getMarker(marker_mar_dim_frame,markerLabels,'WaistLBack');
RFHip_mar =         getMarker(marker_mar_dim_frame,markerLabels,'WaistRFront');
RBHip_mar =         getMarker(marker_mar_dim_frame,markerLabels,'WaistRBack');

%Thigh, knee, leg(shank), and ankle markers

LThigh_mar_uncal = 	getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKnee_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LAnkle_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

RThigh_mar_uncal =  getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKnee_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RAnkle_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

%% LThigh to Hip Reference Frame Calibration
%hip x position center
LHipPosX(:,1) = 	LFHip_mar(1,:)';
LHipPosX(:,2) =     LBHip_mar(1,:)';
LHip_mar =          mean(LHipPosX,2).';

%hip y position center
LHipPosY(:,1) =     LFHip_mar(2,:)';
LHipPosY(:,2) =     LBHip_mar(2,:)';
LHip_mar(2,:) = 	mean(LHipPosY,2).';

%hip z position center
LHipPosZ(:,1) =     LFHip_mar(3,:)';
LHipPosZ(:,2) =     LBHip_mar(3,:)';
LHip_mar(3,:) =     mean(LHipPosZ,2).';

LThigh_mar_cal = LThigh_mar_uncal - LHip_mar;

for ii = 1:length(LThigh_mar_cal)
    theta_LThigh_rad(ii) = 	atan2(LThigh_mar_cal(3,ii),LThigh_mar_cal(2,ii));
    theta_LThigh_deg(ii) =  atan2d(LThigh_mar_cal(3,ii),LThigh_mar_cal(2,ii));
    length_LThigh(ii) =     sqrt((LThigh_mar_cal(2,ii)).^2 + (LThigh_mar_cal(3,ii)).^2);
end

%Thigh segment angle
segTheta.theta_LThigh_rad = theta_LThigh_rad;
segTheta.theta_LThigh_deg = theta_LThigh_deg;

figure(365);
subplot(3,1,1)
plot(theta_LThigh_deg,'b')
title('Thigh Change in Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RThigh to Hip Reference Frame Calibration
%hip x position center
RHipPosX(:,1) =     RFHip_mar(1,:)';
RHipPosX(:,2) = 	RBHip_mar(1,:)';
RHip_mar =          mean(RHipPosX,2).';

%hip y position center
RHipPosY(:,1) =     RFHip_mar(2,:)';
RHipPosY(:,2) =     RBHip_mar(2,:)';
RHip_mar(2,:) = 	mean(RHipPosY,2).';

%hip z position center
RHipPosZ(:,1) =     RFHip_mar(3,:)';
RHipPosZ(:,2) =     RBHip_mar(3,:)';
RHip_mar(3,:) =     mean(RHipPosZ,2).';

RThigh_mar_cal = RThigh_mar_uncal - RHip_mar;

for ii = 1:length(RThigh_mar_cal)
    theta_RThigh_rad(ii) =  atan2(RThigh_mar_cal(3,ii),RThigh_mar_cal(2,ii));
    theta_RThigh_deg(ii) =  atan2d(RThigh_mar_cal(3,ii),RThigh_mar_cal(2,ii));
    length_RThigh(ii) =     sqrt((RThigh_mar_cal(2,ii)).^2 + (RThigh_mar_cal(3,ii)).^2);
end

%Thigh segment angle
segTheta.theta_RThigh_rad = theta_RThigh_rad;
segTheta.theta_RThigh_deg = theta_RThigh_deg;

subplot(3,1,1)
plot(theta_RThigh_deg,'r')

%% LKnee to Hip Reference Frame Calibration
%Calibration of LKnee w/r/t LHip_mar
LKnee_mar_cal = LKnee_mar_uncal - LHip_mar;

for ii = 1:length(LKnee_mar_cal)
    theta_LKnee_rad(ii) =  atan2(LKnee_mar_cal(3,ii),LKnee_mar_cal(2,ii));
    theta_LKnee_deg(ii) =  atan2d(LKnee_mar_cal(3,ii),LKnee_mar_cal(2,ii));
    length_LKnee(ii) =     sqrt((LKnee_mar_cal(2,ii)).^2 + (LKnee_mar_cal(3,ii)).^2);
end

%Knee segment angle
segTheta.theta_LKnee_rad = theta_LKnee_rad;
segTheta.theta_LKnee_deg = theta_LKnee_deg;

% figure(535);
subplot(3,1,2)
plot(theta_LKnee_deg,'b')
title('Knee Change in Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RKnee to Hip Reference Frame Calibration
%Calibration of RKnee w/r/t RHip_mar
RKnee_mar_cal = RKnee_mar_uncal - RHip_mar;

for ii = 1:length(RKnee_mar_cal)
    theta_RKnee_rad(ii) =  atan2(RKnee_mar_cal(3,ii),RKnee_mar_cal(2,ii));
    theta_RKnee_deg(ii) =  atan2d(RKnee_mar_cal(3,ii),RKnee_mar_cal(2,ii));
    length_RKnee(ii) =     sqrt((RKnee_mar_cal(2,ii)).^2 + (RKnee_mar_cal(3,ii)).^2);
end

%Knee segment angle
segTheta.theta_RKnee_rad = theta_RKnee_rad;
segTheta.theta_RKnee_deg = theta_RKnee_deg;

subplot(3,1,2)
plot(theta_RKnee_deg,'r')

%% LAnkle to LKnee Reference Frame Calibration
%Calibration of LAnkle w/r/t LKnee
LAnkle_mar_cal = LAnkle_mar_uncal - LKnee_mar_uncal;

for ii = 1:length(LAnkle_mar_cal)
    theta_LAnkle_rad(ii) =  atan2(LAnkle_mar_cal(3,ii),LAnkle_mar_cal(2,ii));
    theta_LAnkle_deg(ii) =  atan2d(LAnkle_mar_cal(3,ii),LAnkle_mar_cal(2,ii));
    length_LAnkle(ii) =     sqrt((LAnkle_mar_cal(2,ii)).^2 + (LAnkle_mar_cal(3,ii)).^2);
end

%Ankle segment angle
segTheta.theta_LAnkle_rad = theta_LAnkle_rad;
segTheta.theta_LAnkle_deg = theta_LAnkle_deg;

subplot(3,1,3)
plot(theta_LAnkle_deg,'b')
title('Ankle Change in Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RAnkle to RKnee Reference Frame Calibration
%Calibration of RAnkle w/r/t RKnee
RAnkle_mar_cal = RAnkle_mar_uncal - RKnee_mar_uncal;

for ii = 1:length(RAnkle_mar_cal)
    theta_RAnkle_rad(ii) =  atan2(RAnkle_mar_cal(3,ii),RAnkle_mar_cal(2,ii));
    theta_RAnkle_deg(ii) =  atan2d(RAnkle_mar_cal(3,ii),RAnkle_mar_cal(2,ii));
    length_RAnkle(ii) =     sqrt((RAnkle_mar_cal(2,ii)).^2 + (RAnkle_mar_cal(3,ii)).^2);
end

%Ankle segment angle
segTheta.theta_RAnkle_rad = theta_RAnkle_rad;
segTheta.theta_RAnkle_deg = theta_RAnkle_deg;

subplot(3,1,3)
plot(theta_RAnkle_deg,'r')

end

