function [totalCOMXYZ] = calcSegWeightCOM(segCenter,propWeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcCOM individual seg contribution to totalCOM
%facilitates plotting totalCOMXYZ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Head Seg
headCOM =        propWeight.headWeight .* segCenter.headCenter_mar_dim_frame;
% headCOM =        (bodySegMass.headMass .* segCenter.headCenter_mar_dim_frame);

%% Shoulder Seg
LShoulderCOM =   propWeight.shoulderWeight .* segCenter.LShoulderCenter_mar_dim_frame;
RShoulderCOM =   propWeight.shoulderWeight .* segCenter.RShoulderCenter_mar_dim_frame;

% LShoulderCOM =   bodySegMass.shoulderMass .* segCenter.LShoulderCenter_mar_dim_frame;
% RShoulderCOM =   bodySegMass.shoulderMass .* segCenter.RShoulderCenter_mar_dim_frame;

%% Chest Seg
chestCOM =       propWeight.chestWeight .* segCenter.chestCenter_mar_dim_frame;
%chestCOM =       bodySegMass.chestMass .* segCenter.chestCenter_mar_dim_frame;

%% UpperArm Seg
LUpperArmCOM =   propWeight.upperArmWeight .* segCenter.LUpperArmCenter_mar_dim_frame;
RUpperArmCOM =   propWeight.upperArmWeight .* segCenter.RUpperArmCenter_mar_dim_frame;

% LUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.LUpperArmCenter_mar_dim_frame;
% RUpperArmCOM =   bodySegMass.upperArmMass .* segCenter.RUpperArmCenter_mar_dim_frame;

%% Forearm Seg
LForearmCOM =    propWeight.forearmWeight .* segCenter.LForearmCenter_mar_dim_frame;
RForearmCOM =    propWeight.forearmWeight .* segCenter.RForearmCenter_mar_dim_frame;

% LForearmCOM =    bodySegMass.forearmMass .* segCenter.LForearmCenter_mar_dim_frame;
% RForearmCOM =    bodySegMass.forearmMass .* segCenter.RForearmCenter_mar_dim_frame;

%% Hand Seg
LHandCOM =       propWeight.handWeight .* segCenter.LHandCenter_mar_dim_frame;
RHandCOM =       propWeight.handWeight .* segCenter.RHandCenter_mar_dim_frame;

% LHandCOM =       bodySegMass.handMass .* segCenter.LHandCenter_mar_dim_frame;
% RHandCOM =       bodySegMass.handMass .* segCenter.RHandCenter_mar_dim_frame;

%% Hip Seg
hipCOM =         propWeight.hipWeight .* segCenter.hipCenter_mar_dim_frame;

% hipCOM =          bodySegMass.hipMass .* segCenter.hipCenter_mar_dim_frame;

%% Thigh Seg
LThighCOM =      propWeight.thighWeight .* segCenter.LThighCenter_mar_dim_frame;
RThighCOM =      propWeight.thighWeight .* segCenter.RThighCenter_mar_dim_frame;

% LThighCOM =      bodySegMass.thighMass .* segCenter.LThighCenter_mar_dim_frame;
% RThighCOM =      bodySegMass.thighMass .* segCenter.RThighCenter_mar_dim_frame;

%% Leg Seg
LLegCOM =        propWeight.legWeight .* segCenter.LLegCenter_mar_dim_frame;
RLegCOM =        propWeight.legWeight .* segCenter.RLegCenter_mar_dim_frame;

% LLegCOM =        bodySegMass.legMass .* segCenter.LLegCenter_mar_dim_frame;
% RLegCOM =        bodySegMass.legMass .* segCenter.RLegCenter_mar_dim_frame;

%% Foot Seg
LFootCOM =       propWeight.footWeight .* segCenter.LFootCenter_mar_dim_frame;
RFootCOM =       propWeight.footWeight .* segCenter.RFootCenter_mar_dim_frame;

% LFootCOM =       bodySegMass.footMass .* segCenter.LFootCenter_mar_dim_frame;
% RFootCOM =       bodySegMass.footMass .* segCenter.RFootCenter_mar_dim_frame;

%% Total Center_mar_dim_frame for Body
totalCOMXYZ = (headCOM + LShoulderCOM + RShoulderCOM...
    + chestCOM + LUpperArmCOM + RUpperArmCOM...
    + LForearmCOM + RForearmCOM + LHandCOM ...
    + RHandCOM + hipCOM + LThighCOM + RThighCOM...
    + LLegCOM + RLegCOM + LFootCOM + RFootCOM);

end


