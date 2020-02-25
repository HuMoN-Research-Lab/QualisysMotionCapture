function [segMean] = segMeanPosition(marker_mar_dim_frame, markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegMeanPosition function outputs mean position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Mean head position
%initial conditions for head position
headA = 1;
headB = 4;
headIDs = headA:headB;

%headMean acquisition
headMean =  squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :),1))';

%Start of segMean struct
segMean = [];
segMean.headMean = headMean;

%% Mean shoulder positions
%leftShoulder initial position
leftShoulderA = 5;
leftShoulderB = 6;
leftShoulderIDs = leftShoulderA:leftShoulderB;

%leftShoulderMean calculation
leftShoulderMean =  squeeze(mean(marker_mar_dim_frame(leftShoulderIDs, 1:3, :),1))';
segMean.leftShoulderMean = leftShoulderMean;

%rightShoulder initial position
rightShoulderA = 12;
rightShoulderB = 13;
rightShoulderIDs = rightShoulderA:rightShoulderB;

%rightShoulderMean calculation
rightShoulderMean =  squeeze(mean(marker_mar_dim_frame(rightShoulderIDs, 1:3, :),1))';
segMean.rightShoulderMean = rightShoulderMean;

%% Mean arm positions
%leftArm initial conditions
leftArmA = 7;
leftArmB = 8;
leftArmIDs = leftArmA:leftArmB;

%leftArmMean calculation
leftArmMean =  squeeze(mean(marker_mar_dim_frame(leftArmIDs, 1:3, :),1))';
segMean.leftArmMean = leftArmMean; 

%rightArm initial conditions
rightArmA = 14;
rightArmB = 15;
rightArmIDs = rightArmA:rightArmB;

%rightArmMean calculation
rightArmMean =  squeeze(mean(marker_mar_dim_frame(rightArmIDs, 1:3, :),1))';
segMean.rightArmMean = rightArmMean;

%% Mean forearm positions
%leftForearm initial conditions
leftForearmA = 8;
leftForearmB = 10;
leftForearmIDs = leftForearmA:leftForearmB;

%leftForearmMean calculation
leftForearmMean =  squeeze(mean(marker_mar_dim_frame(leftForearmIDs, 1:3, :),1))';
segMean.leftForearmMean = leftForearmMean;

%rightForearm initial conditions
rightForearmA = 15;
rightForearmB = 17;
rightForearmIDs = rightForearmA:rightForearmB;

%rightForearmMean calculation
rightForearmMean =  squeeze(mean(marker_mar_dim_frame(rightForearmIDs, 1:3, :),1))';
segMean.rightForearmMean = rightForearmMean;

%% Mean hand positions
%leftHand initial conditions
leftHandA = 9;
leftHandB = 11;
leftHandIDs = leftHandA:leftHandB;

%leftHandMean calculation
leftHandMean =  squeeze(mean(marker_mar_dim_frame(leftHandIDs, 1:3, :),1))';
segMean.leftHandMean = leftHandMean;

%rightHand initial conditions
rightHandA = 16;
rightHandB = 18;
rightHandIDs = rightHandA:rightHandB;

%rightHandMean calculation
rightHandMean =  squeeze(mean(marker_mar_dim_frame(rightHandIDs, 1:3, :),1))';
segMean.rightHandMean = rightHandMean;

%% Mean hip positions
%hip initial conditions
hipA = 23;
hipB = 26;
hipsIDs = hipA:hipB;

%hipsMean calculation
hipsMean =  squeeze(mean(marker_mar_dim_frame(hipsIDs, 1:3, :),1))';
segMean.hipsMean = hipsMean;

%% Mean thigh calculations 
%leftThigh initial conditions
leftThighA = 27;
leftThighB = 28;
leftThighIDs = [leftThighA leftThighB];

%leftThighMean calculation
leftThighMean =  squeeze(mean(marker_mar_dim_frame(leftThighIDs, 1:3, :),1))';
segMean.leftThighMean = leftThighMean;

%rightThigh initial conditions
rightThighA = 35;
rightThighB = 36;
rightThighIDs = [rightThighA rightThighB];

%rightThighMean calculation
rightThighMean =  squeeze(mean(marker_mar_dim_frame(rightThighIDs, 1:3, :),1))';
segMean.rightThighMean = rightThighMean;

%% Mean leg calculations
%leftLeg initial conditions
leftLegA = 28;
leftLegB = 30;
leftLegIDs = [leftLegA leftLegB];

%leftLegMean calculations
leftLegMean =  squeeze(mean(marker_mar_dim_frame(leftLegIDs, 1:3, :),1))';
segMean.leftLegMean = leftLegMean;

%rightLeg initial conditions
rightLegA = 36;
rightLegB = 38;
rightLegIDs = [rightLegA rightLegB];

%rightLegMean calculations
rightLegMean =  squeeze(mean(marker_mar_dim_frame(rightLegIDs, 1:3, :),1))';
segMean.rightLegMean = rightLegMean;

%% Mean foot calculations
%leftFoot initial conditions
leftFootA = 30;
leftFootB = 34;
leftFootIDs = leftFootA:leftFootB;

%leftFootMean calculation
leftFootMean =  squeeze(mean(marker_mar_dim_frame(leftFootIDs, 1:3, :),1))';
segMean.leftFootMean = leftFootMean;

%rightFoot initial conditions
rightFootA = 38;
rightFootB = 42;
rightFootIDs = rightFootA:rightFootB;

%rightFootMean calculation
rightFootMean =  squeeze(mean(marker_mar_dim_frame(rightFootIDs, 1:3, :),1))';
segMean.rightFootMean = rightFootMean;

end

