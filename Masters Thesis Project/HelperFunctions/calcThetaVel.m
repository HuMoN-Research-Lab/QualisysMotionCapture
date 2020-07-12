function [segOmega,segAlpha] = calcThetaVel(segTheta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcThetaVel calculates the angular vel and acc for lower extremity joints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial Conditions
segOmega = [];
segAlpha = [];

%% Thigh, knee, and ankle angular velocity
segOmega.omega_LThigh = diff(segTheta.theta_LThigh_rad);
segOmega.omega_RThigh = diff(segTheta.theta_RThigh_rad);
segOmega.omega_LKnee =  diff(segTheta.theta_LKnee_rad);
segOmega.omega_RKnee =  diff(segTheta.theta_RKnee_rad);
segOmega.omega_LAnkle = diff(segTheta.theta_LAnkle_rad);
segOmega.omega_RAnkle = diff(segTheta.theta_RAnkle_rad);

figure(15395)
%Thigh plot
subplot(3,1,1)
plot(segOmega.omega_LThigh,'b')
hold on
plot(segOmega.omega_RThigh,'r')
title('Change in Thighs Ang Vel')
xlabel('Number of Frames')
ylabel('Ang Vel (rad/s)')

%Knee plot
subplot(3,1,2)
plot(segOmega.omega_LKnee,'b')
hold on
plot(segOmega.omega_RKnee,'r')
title('Change in Knees Ang Vel')
xlabel('Number of Frames')
ylabel('Ang Vel (rad/s)')

subplot(3,1,3)
plot(segOmega.omega_LAnkle,'b')
hold on
plot(segOmega.omega_RAnkle,'r')
title('Change in Ankles Ang Vel')
xlabel('Number of Frames')
ylabel('Ang Vel (rad/s)')

%% Thigh, knee, and ankle angular acceleration
segAlpha.alpha_LThigh = diff(segOmega.omega_LThigh);
segAlpha.alpha_RThigh = diff(segOmega.omega_RThigh);
segAlpha.alpha_LKnee =  diff(segOmega.omega_LKnee);
segAlpha.alpha_RKnee =  diff(segOmega.omega_RKnee);
segAlpha.alpha_LAnkle = diff(segOmega.omega_LAnkle);
segAlpha.alpha_RAnkle = diff(segOmega.omega_RAnkle);

figure(202092)
%Thigh plot
subplot(3,1,1)
plot(segAlpha.alpha_LThigh,'b')
hold on
plot(segAlpha.alpha_RThigh,'r')
title('Change in Thighs Ang Acc')
xlabel('Number of Frames')
ylabel('Ang Acc (rad/s^2)')

%Knee plot
subplot(3,1,2)
plot(segAlpha.alpha_LKnee,'b')
hold on
plot(segAlpha.alpha_RKnee,'r')
title('Change in Knees Ang Acc')
xlabel('Number of Frames')
ylabel('Ang Acc (rad/s^2)')

subplot(3,1,3)
plot(segAlpha.alpha_LAnkle,'b')
hold on
plot(segAlpha.alpha_RAnkle,'r')
title('Change in Ankles Ang Acc')
xlabel('Number of Frames')
ylabel('Ang Acc (rad/s^2)')

end