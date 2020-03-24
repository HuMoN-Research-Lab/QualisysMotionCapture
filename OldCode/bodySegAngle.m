function [bodySegAngleStruct] = bodySegAngle(segMean)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates theta lower extremities based on segment position(deg)
%[limited to angles in 3D]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Theta equations
%thetaij = atan((yj-yi)/(xj-xi));
%theta21 = atan((y1-y2)/(x1-x2));
%% Thigh angle calculations
%Thigh angle (theta21)

%leftThigh angle calculation
thetaLeftThigh = atand((segMean.leftThighMean(:,2) - segMean.leftLegMean(:,2))...
   ./(segMean.leftThighMean(:,1)-segMean.leftLegMean(:,1)));
thetaLeft21 = thetaLeftThigh;

%Start of bodySegAngleStruct
bodySegAngleStruct = [];
bodySegAngleStruct.thetaLeft21 = thetaLeft21;

%rightThigh angle calculation
thetaRightThigh = atand((segMean.rightThighMean(:,2) - segMean.rightLegMean(:,2))...
   ./(segMean.rightThighMean(:,1)-segMean.rightLegMean(:,1)));
thetaRight21 = thetaRightThigh;
bodySegAngleStruct.thetaRight21 = thetaRight21;


%% Shank angle calculations
%Shank angle (theta43)

%leftShank angle calculation
thetaLeftShank = atand((segMean.leftLegMean(:,2) - segMean.leftFootMean(:,2))...
   ./(segMean.leftLegMean(:,1)-segMean.leftFootMean(:,1)));
thetaLeft43 = thetaLeftShank;
bodySegAngleStruct.thetaLeftShank = thetaLeft43;

%rightShank angle calculation
thetaRightShank = atand((segMean.rightLegMean(:,2) - segMean.rightFootMean(:,2))...
   ./(segMean.rightLegMean(:,1)-segMean.rightFootMean(:,1)));
thetaRight43 = thetaRightShank;
bodySegAngleStruct.thetaRight43 = thetaRight43;

%% Knee angle calculations
%Knee Angle (thetaKnee)

%leftThigh angle calculation
thetaLeftKnee = thetaLeft21 - thetaLeft43;
bodySegAngleStruct.thetaLeftKnee = thetaLeftKnee;

%rightThigh angle calculation
thetaRightKnee = thetaRight21 - thetaRight43;
bodySegAngleStruct.thetaRightKnee = thetaRightKnee;

end

