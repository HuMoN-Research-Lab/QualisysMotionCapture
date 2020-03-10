function [comXYZ] = segWeight2bodyWeight(segXYZ,bodySegWeight) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegXYZPosition function outputs XYZ position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Head Seg
headCOM = bodySegWeight.headWeight .* segXYZ.headXYZ;
comXYZ = [];
comXYZ.headCOM = headCOM;

%% Shoulder Seg
LShoulderCOM = bodySegWeight.shoulderWeight .* segXYZ.LShoulderXYZ;
comXYZ.LShoulderCOM = LShoulderCOM;

RShoulderCOM = bodySegWeight.shoulderWeight .* segXYZ.RShoulderXYZ;
comXYZ.RShoulderCOM = RShoulderCOM;

%% Chest Seg
chestCOM = bodySegWeight.chestWeight .* segXYZ.chestXYZ;
comXYZ.chestCOM = chestCOM;

%% UpperArm Seg
LUpperArmCOM = bodySegWeight.upperArmWeight .* segXYZ.LUpperArmXYZ;
comXYZ.LUpperArmCOM = LUpperArmCOM;

RUpperArmCOM = bodySegWeight.upperArmWeight .* segXYZ.RUpperArmXYZ;
comXYZ.RUpperArmCOM = RUpperArmCOM;

%% Forearm Seg
LForearmCOM = bodySegWeight.forearmWeight .* segXYZ.LForearmXYZ;
comXYZ.LForearmCOM = LForearmCOM;

RForearmCOM = bodySegWeight.forearmWeight .* segXYZ.RForearmXYZ;
comXYZ.RForearmCOM = RForearmCOM;

%% Hand Seg
LHandCOM = bodySegWeight.handWeight .* segXYZ.LHandXYZ;
comXYZ.LHandCOM = LHandCOM;

RHandCOM = bodySegWeight.handWeight .* segXYZ.RHandXYZ;
comXYZ.RHandCOM = RHandCOM;

%% Hip Seg
hipCOM = bodySegWeight.hipWeight .* segXYZ.hipXYZ;
comXYZ.hipCOM = hipCOM;

%% Thigh Seg
LThighCOM = bodySegWeight.thighWeight .* segXYZ.LThighXYZ;
comXYZ.LThighCOM = LThighCOM;

RThighCOM = bodySegWeight.thighWeight .* segXYZ.RThighXYZ;
comXYZ.RThighCOM = RThighCOM;

%% Total XYZ for Body
comTotalXYZ = (headXYZ + LShoulderXYZ + RShoulderXYZ + LUpperArmXYZ...
    + RUpperArmXYZ + LForearmXYZ + RForearmXYZ + LHandXYZ +...
    RHandXYZ + hipsXYZ + LThighXYZ + RThighXYZ +...
    LLegXYZ + RLegXYZ + LFootXYZ + RFootXYZ)/16;
% totalXYZ = + LFootXYZ + RFootXYZ;
segXYZ.totalXYZ = comTotalXYZ;




