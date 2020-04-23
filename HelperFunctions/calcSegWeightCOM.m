function [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcCOM individual seg contribution to totalCOM
%facilitates plotting totalCOMXYZ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
% totalCOMXYZ = [];

%% Head Seg
headCOM =        segPropWeight.headProp .* segCenter.headCenter_mar_dim_frame;
% headCOM =        (bodySegMass.headMass .* segCenter.headCenter_mar_dim_frame);

%% Shoulder Seg
LShoulderCOM =   segPropWeight.shoulderProp .* segCenter.LShoulderCenter_mar_dim_frame;
RShoulderCOM =   segPropWeight.shoulderProp .* segCenter.RShoulderCenter_mar_dim_frame;

% LShoulderCOM =   bodySegMass.shoulderMass .* segCenter.LShoulderCenter_mar_dim_frame;
% RShoulderCOM =   bodySegMass.shoulderMass .* segCenter.RShoulderCenter_mar_dim_frame;

%% Chest Seg
chestCOM =       (segPropWeight.chestProp + segPropWeight.abdomenProp)...
                    .* segCenter.chestCenter_mar_dim_frame;
%chestCOM =       bodySegMass.chestMass .* segCenter.chestCenter_mar_dim_frame;

%% UpperArm Seg
LUpperArmCOM =   segPropWeight.upperArmProp .* segCenter.LUpperArmCenter_mar_dim_frame;
RUpperArmCOM =   segPropWeight.upperArmProp .* segCenter.RUpperArmCenter_mar_dim_frame;

% LUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.LUpperArmCenter_mar_dim_frame;
% RUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.RUpperArmCenter_mar_dim_frame;

%% Forearm Seg
LForearmCOM =    segPropWeight.forearmProp .* segCenter.LForearmCenter_mar_dim_frame;
RForearmCOM =    segPropWeight.forearmProp .* segCenter.RForearmCenter_mar_dim_frame;

% LForearmCOM =    bodySegMass.forearmMass .* segCenter.LForearmCenter_mar_dim_frame;
% RForearmCOM =    bodySegMass.forearmMass .* segCenter.RForearmCenter_mar_dim_frame;

%% Hand Seg
LHandCOM =       segPropWeight.handProp .* segCenter.LHandCenter_mar_dim_frame;
RHandCOM =       segPropWeight.handProp .* segCenter.RHandCenter_mar_dim_frame;

% LHandCOM =       bodySegMass.handMass .* segCenter.LHandCenter_mar_dim_frame;
% RHandCOM =       bodySegMass.handMass .* segCenter.RHandCenter_mar_dim_frame;

%% Hip Seg
hipCOM =         segPropWeight.hipProp .* segCenter.hipCenter_mar_dim_frame;

% hipCOM =          bodySegMass.hipMass .* segCenter.hipCenter_mar_dim_frame;

%% Thigh Seg
LThighCOM =      segPropWeight.thighProp .* segCenter.LThighCenter_mar_dim_frame;
RThighCOM =      segPropWeight.thighProp .* segCenter.RThighCenter_mar_dim_frame;

% LThighCOM =      bodySegMass.thighMass .* segCenter.LThighCenter_mar_dim_frame;
% RThighCOM =      bodySegMass.thighMass .* segCenter.RThighCenter_mar_dim_frame;

%% Leg Seg
LLegCOM =        segPropWeight.legProp .* segCenter.LLegCenter_mar_dim_frame;
RLegCOM =        segPropWeight.legProp .* segCenter.RLegCenter_mar_dim_frame;

% LLegCOM =        bodySegMass.legMass .* segCenter.LLegCenter_mar_dim_frame;
% RLegCOM =        bodySegMass.legMass .* segCenter.RLegCenter_mar_dim_frame;

%% Foot Seg
LFootCOM =       segPropWeight.footProp .* segCenter.LFootCenter_mar_dim_frame;
RFootCOM =       segPropWeight.footProp .* segCenter.RFootCenter_mar_dim_frame;

% LFootCOM =       bodySegMass.footMass .* segCenter.LFootCenter_mar_dim_frame;
% RFootCOM =       bodySegMass.footMass .* segCenter.RFootCenter_mar_dim_frame;

%% Total Center_mar_dim_frame for Body
totalCOMXYZ = (headCOM + LShoulderCOM + RShoulderCOM...
    + chestCOM + LUpperArmCOM + RUpperArmCOM...
    + LForearmCOM + RForearmCOM + LHandCOM ...
    + RHandCOM + hipCOM + LThighCOM + RThighCOM...
    + LLegCOM + RLegCOM + LFootCOM + RFootCOM);

end


