function [bodySegLength] = calcBodySegLength(mmHeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates length of each body segment based on totalHeight (cm)
%bodyHeight functions prepared via Drillis and Contini (1966)
%From pg 60
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper extremity segment by total height
bodySegLength.handTotalLength =           0.108*mmHeight;
bodySegLength.forearmTotalLength =        0.146*mmHeight;
bodySegLength.upperArmTotalLength =       0.186*mmHeight;
bodySegLength.shoulderTotalLength =       0.1295*mmHeight;

%% Lower extremity segment length
bodySegLength.footTotalLength =           0.152*mmHeight;
bodySegLength.footTotalBreadth =          0.055*mmHeight;
bodySegLength.ankleTotalHeight =          0.039*mmHeight;
bodySegLength.legTotalLength =            0.285*mmHeight - bodySegLength.ankleTotalHeight;
bodySegLength.thighTotalLength =          0.530*mmHeight - bodySegLength.legTotalLength;
bodySegLength.hipsTotalLength =           0.191*mmHeight;

%% Upper torso segment length
bodySegLength.headTotalLength =           0.130*mmHeight;
bodySegLength.chestTotalWidth =           0.174*mmHeight; %ribs width
%include thorax code as well


%% Vaughan Equations for Body Segmentation
%length of foot and malleolus height need to be found for EQ's

%Reg EQ for Foot about Flexion-Extension Axis
% inertiaFootFlexionExtension = 0.00023*totalMass...
%     (4*malleolusHeight^2+3*lengthFoot^2)+0.00022)

%Reg EQ for Foot about Abduction-Adduction Axis

%Reg EQ for Foot about Internal-External rotation

end

