function [handTotalLength,forearmTotalLength] = bodySegLength(totalHeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates length of each body segment based on totalHeight (cm)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper extremity segment by total height
handTotalLength = 0.108*totalHeight;
forearmTotalLength = 0.146*totalHeight;
armTotalLength = 0.186*totalHeight;
shoulderTotalLength = 0.129*totalHeight;

%% Lower extremity segment length
footTotalLength = 0.152*totalHeight;
footTotalBreadth = 0.055*totalHeight;
ankleTotalHeight = 0.039*totalHeight;
legTotalLength = 0.285*totalHeight - ankleTotalHeight;
thighTotalLength = 0.530*totalHeight - legTotalLength;
hipsTotalLength = 0.191*totalHeight;

%% Upper torso segment length
%% REVIEW ADDITIONAL CONTENT TO VERIFY SPECIFIC SECTIONS OF BODY
headTotalLength = 0.130*totalHeight;
ribsTotalWidth = 0.174*totalHeight;

%% Vaughan Equations for Body Segmentation
%length of foot and malleolus height need to be found for EQ's

%Reg EQ for Foot about Flexion-Extension Axis
% inertiaFootFlexionExtension = 0.00023*totalMass...
%     (4*malleolusHeight^2+3*lengthFoot^2)+0.00022)

%Reg EQ for Foot about Abduction-Adduction Axis

%Reg EQ for Foot about Internal-External rotation

end

