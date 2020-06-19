function [segTheta] = calcSegAngle(marker_mar_dim_frame,markerLabels,segCenter) %segCenter,trial_start_end,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot)
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
LThigh_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKnee_mar_uncal =       getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LShank_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkle_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');
LForefoot_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');

RThigh_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKnee_mar_uncal =       getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RShank_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkle_mar_uncal =      getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RForefoot_mar_uncal =   getMarker(marker_mar_dim_frame,markerLabels,'RForefootOut');

%% LHip Angle Calculations
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

%LThigh to LHip Reference Frame Calibration
LThigh_mar_cal = LThigh_mar_uncal - LHip_mar;

for ii = 1:length(LThigh_mar_cal)
    theta_LHip_rad(ii) = 	atan2(LThigh_mar_cal(3,ii),LThigh_mar_cal(2,ii));
    theta_LHip_deg(ii) =    atan2d(LThigh_mar_cal(3,ii),LThigh_mar_cal(2,ii));
    length_LThigh(ii) =     sqrt((LThigh_mar_cal(2,ii)).^2 + (LThigh_mar_cal(3,ii)).^2);
end

%Thigh segment angle
segTheta.theta_LHip_rad = theta_LHip_rad;
segTheta.theta_LHip_deg = theta_LHip_deg;

figure(365);
subplot(3,1,1)
plot(theta_LHip_deg,'b')
title('Hip Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RHip Angle Calculations
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

%RThigh to RHip Reference Frame Calibration
RThigh_mar_cal = RThigh_mar_uncal - RHip_mar;

for ii = 1:length(RThigh_mar_cal)
    theta_RHip_rad(ii) =  atan2(RThigh_mar_cal(3,ii),RThigh_mar_cal(2,ii));
    theta_RHip_deg(ii) =  atan2d(RThigh_mar_cal(3,ii),RThigh_mar_cal(2,ii));
    length_RThigh(ii) =   sqrt((RThigh_mar_cal(2,ii)).^2 + (RThigh_mar_cal(3,ii)).^2);
end

%Thigh segment angle
segTheta.theta_RHip_rad = theta_RHip_rad;
segTheta.theta_RHip_deg = theta_RHip_deg;

subplot(3,1,1)
plot(theta_RHip_deg,'r')

%% LKnee Angle Calculations
%LShank to LThigh Reference Frame Calibration
LShank_mar_cal = LShank_mar_uncal - LThigh_mar_uncal; % - LShank_mar_uncal;

for ii = 1:length(LShank_mar_cal)
    theta_LKnee_rad(ii) =  atan2(LShank_mar_cal(3,ii),LShank_mar_cal(2,ii));
    theta_LKnee_deg(ii) =  atan2d(LShank_mar_cal(3,ii),LShank_mar_cal(2,ii));
    length_LShank(ii) =     sqrt((LShank_mar_cal(2,ii)).^2 + (LShank_mar_cal(3,ii)).^2);
end

%Knee segment angle
segTheta.theta_LKnee_rad = theta_LKnee_rad;
segTheta.theta_LKnee_deg = theta_LKnee_deg;

% figure(535);
subplot(3,1,2)
plot(theta_LKnee_deg,'b')
title('Knee Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RKnee Angle Calculations
%RShank to RShank Reference Frame Calibration
RShank_mar_cal = RShank_mar_uncal - RThigh_mar_uncal; %RShank_mar_uncal;

for ii = 1:length(RShank_mar_cal)
    theta_RKnee_rad(ii) =  atan2(RShank_mar_cal(3,ii),RShank_mar_cal(2,ii));
    theta_RKnee_deg(ii) =  atan2d(RShank_mar_cal(3,ii),RShank_mar_cal(2,ii));
    length_RShank(ii) =     sqrt((RShank_mar_cal(2,ii)).^2 + (RShank_mar_cal(3,ii)).^2);
end

%Knee segment angle
segTheta.theta_RKnee_rad = theta_RKnee_rad;
segTheta.theta_RKnee_deg = theta_RKnee_deg;

subplot(3,1,2)
plot(theta_RKnee_deg,'r')

%% LAnkle Angle Calculations
%LAnkle to LShank Reference Frame Calibration
LAnkle_mar_cal = segCenter.LFootCenter_mar_dim_frame - LShank_mar_uncal;

for ii = 1:length(LAnkle_mar_cal)
    theta_LAnkle_rad(ii) =  atan2(LAnkle_mar_cal(3,ii),LAnkle_mar_cal(2,ii));
    theta_LAnkle_deg(ii) =  atan2d(LAnkle_mar_cal(3,ii),LAnkle_mar_cal(2,ii));
    length_LFoot(ii) =     sqrt((LAnkle_mar_cal(2,ii)).^2 + (LAnkle_mar_cal(3,ii)).^2);
end

%Ankle segment angle
segTheta.theta_LAnkle_rad = theta_LAnkle_rad;
segTheta.theta_LAnkle_deg = theta_LAnkle_deg;

subplot(3,1,3)
plot(theta_LAnkle_deg,'b')
title('Ankle Theta')
xlabel('Number of Frames')
ylabel('Angular Position (deg)')
hold on

%% RAnkle to RKnee Reference Frame Calibration
%Calibration of RAnkle w/r/t RKnee
RAnkle_mar_cal = segCenter.RFootCenter_mar_dim_frame - RShank_mar_uncal;

for ii = 1:length(RAnkle_mar_cal)
    theta_RAnkle_rad(ii) =  atan2(RAnkle_mar_cal(3,ii),RAnkle_mar_cal(2,ii));
    theta_RAnkle_deg(ii) =  atan2d(RAnkle_mar_cal(3,ii),RAnkle_mar_cal(2,ii));
    length_RFoot(ii) =     sqrt((RAnkle_mar_cal(2,ii)).^2 + (RAnkle_mar_cal(3,ii)).^2);
end

%Ankle segment angle
segTheta.theta_RAnkle_rad = theta_RAnkle_rad;
segTheta.theta_RAnkle_deg = theta_RAnkle_deg;

subplot(3,1,3)
plot(theta_RAnkle_deg,'r')

end

