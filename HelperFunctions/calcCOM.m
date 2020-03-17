function [comXYZ] = calcCOM(segCenters,bodySegMass) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegXYZPosition function outputs XYZ position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Head Seg
comXYZ = [];
comXYZ.headCOM = bodySegMass.headMass .* segCenters.headCenters_mar_dim_frame;

%% Shoulder Seg
comXYZ.LShoulderCOM = bodySegMass.shoulderMass .* segCenters.LShoulderCenter_mar_dim_frame;

comXYZ.RShoulderCOM = bodySegMass.shoulderMass .* segCenters.RShoulderCenter_mar_dim_frame;

%% Chest Seg
comXYZ.chestCOM = bodySegMass.chestMass .* segCenters.chestCenter_mar_dim_frame;

%% UpperArm Seg
comXYZ.LUpperArmCOM = bodySegMass.upperArmMass .* segCenters.LUpperArmCenter_mar_dim_frame;

comXYZ.RUpperArmCOM = bodySegMass.upperArmMass .* segCenters.RUpperArmCenter_mar_dim_frame;

%% Forearm Seg
comXYZ.LForearmCOM = bodySegMass.forearmMass .* segCenters.LForearmCenter_mar_dim_frame;

comXYZ.RForearmCOM = bodySegMass.forearmMass .* segCenters.RForearmCenter_mar_dim_frame;

%% Hand Seg
comXYZ.LHandCOM = bodySegMass.handMass .* segCenters.LHandCenter_mar_dim_frame;

comXYZ.RHandCOM = bodySegMass.handMass .* segCenters.RHandCenter_mar_dim_frame;

%% Hip Seg
comXYZ.hipsCOM = bodySegMass.hipMass .* segCenters.hipsCenter_mar_dim_frame;

%% Thigh Seg
comXYZ.LThighCOM = bodySegMass.thighMass .* segCenters.LThighCenter_mar_dim_frame;

comXYZ.RThighCOM = bodySegMass.thighMass .* segCenters.RThighCenter_mar_dim_frame;

%% Leg Seg
comXYZ.LLegCOM = bodySegMass.legMass .* segCenters.LLegCenter_mar_dim_frame;

comXYZ.RLegCOM = bodySegMass.legMass .* segCenters.RLegCenter_mar_dim_frame;

%% Foot Seg
comXYZ.LFootCOM = bodySegMass.footMass .* segCenters.LFootCenter_mar_dim_frame;

comXYZ.RFootCOM = bodySegMass.footMass .* segCenters.RFootCenter_mar_dim_frame;

%% Total Center_mar_dim_frame for Body
comXYZ.totalCOMXYZ = (comXYZ.headCOM + comXYZ.LShoulderCOM + comXYZ.RShoulderCOM...
    + comXYZ.chestCOM + comXYZ.LUpperArmCOM + comXYZ.RUpperArmCOM...
    + comXYZ.LForearmCOM + comXYZ.RForearmCOM + comXYZ.LHandCOM ...
    + comXYZ.RHandCOM + comXYZ.hipsCOM + comXYZ.LThighCOM + comXYZ.RThighCOM...
    + comXYZ.LLegCOM + comXYZ.RLegCOM + comXYZ.LFootCOM + comXYZ.RFootCOM);

end


