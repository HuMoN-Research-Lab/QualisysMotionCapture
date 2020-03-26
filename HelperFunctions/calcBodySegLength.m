function [bodySegLength] = calcBodySegLength(mmHeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates length of each body segment based on totalHeight (mm)
%calcBodySegLength function prepared via Drillis and Contini (1966)
%From pg 60 of Winter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Head and neck length
bodySegLength.headTotalLength =           0.130*mmHeight;

%% Shoulder length
bodySegLength.shoulderTotalLength =       0.1295*mmHeight;

%% Chest breadth
bodySegLength.chestTotalWidth =           0.174*mmHeight; %thorax width

%% UpperArm length
bodySegLength.upperArmTotalLength =       0.186*mmHeight;

%% Forearm length
bodySegLength.forearmTotalLength =        0.146*mmHeight;

%% Hand length
bodySegLength.handTotalLength =           0.108*mmHeight;

%% Hip length
bodySegLength.hipTotalLength =            0.191*mmHeight;

%% Thigh length
bodySegLength.thighTotalLength =          0.245*mmHeight;
%bodySegLength.thighTotalLength =          0.530*mmHeight - bodySegLength.legTotalLength;

%% Leg length
bodySegLength.legTotalLength =            0.246*mmHeight;
%bodySegLength.legTotalLength =            0.285*mmHeight - bodySegLength.ankleTotalHeight;

%% Foot length measurements
bodySegLength.ankleTotalHeight =          0.039*mmHeight;
bodySegLength.footTotalLength =           0.152*mmHeight;
bodySegLength.footTotalBreadth =          0.055*mmHeight;

end
