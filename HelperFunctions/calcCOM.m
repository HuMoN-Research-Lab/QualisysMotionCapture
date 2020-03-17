function [totalCOMXYZ] = calcCOM(segCenter,bodySegMass) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcCOM individual seg contribution to totalCOM
%facilitates plotting totalCOMXYZ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Head Seg
%% Remove struct
headCOM =        bodySegMass.headMass .* segCenter.headCenters_mar_dim_frame;

%% Shoulder Seg
LShoulderCOM =   bodySegMass.shoulderMass .* segCenter.LShoulderCenter_mar_dim_frame;
RShoulderCOM =   bodySegMass.shoulderMass .* segCenter.RShoulderCenter_mar_dim_frame;

%% Chest Seg
chestCOM =       bodySegMass.chestMass .* segCenter.chestCenter_mar_dim_frame;

%% UpperArm Seg
LUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.LUpperArmCenter_mar_dim_frame;
RUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.RUpperArmCenter_mar_dim_frame;

%% Forearm Seg
LForearmCOM =    bodySegMass.forearmMass .* segCenter.LForearmCenter_mar_dim_frame;
RForearmCOM =    bodySegMass.forearmMass .* segCenter.RForearmCenter_mar_dim_frame;

%% Hand Seg
LHandCOM =       bodySegMass.handMass .* segCenter.LHandCenter_mar_dim_frame;
RHandCOM =       bodySegMass.handMass .* segCenter.RHandCenter_mar_dim_frame;

%% Hip Seg
hipsCOM =        bodySegMass.hipMass .* segCenter.hipsCenter_mar_dim_frame;

%% Thigh Seg
LThighCOM =      bodySegMass.thighMass .* segCenter.LThighCenter_mar_dim_frame;
RThighCOM =      bodySegMass.thighMass .* segCenter.RThighCenter_mar_dim_frame;

%% Leg Seg
LLegCOM =        bodySegMass.legMass .* segCenter.LLegCenter_mar_dim_frame;
RLegCOM =        bodySegMass.legMass .* segCenter.RLegCenter_mar_dim_frame;

%% Foot Seg
LFootCOM =       bodySegMass.footMass .* segCenter.LFootCenter_mar_dim_frame;
RFootCOM =       bodySegMass.footMass .* segCenter.RFootCenter_mar_dim_frame;

%% Total Center_mar_dim_frame for Body
totalCOMXYZ = (headCOM + LShoulderCOM + RShoulderCOM...
    + chestCOM + LUpperArmCOM + RUpperArmCOM...
    + LForearmCOM + RForearmCOM + LHandCOM ...
    + RHandCOM + hipsCOM + LThighCOM + RThighCOM...
    + LLegCOM + RLegCOM + LFootCOM + RFootCOM)/ kgMass;

end


