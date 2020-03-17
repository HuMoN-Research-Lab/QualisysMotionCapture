function [bodySegMass] = calcBodySegMass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalMass of each body segment based on users totalMass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Torso segMass by totalMass of body
bodySegMass = [];
bodySegMass.headMass =              0.0810*kgMass; %headMass and neckMass 

%trunkMass calculation
bodySegMass.chestMass =             0.2160*kgMass; %thoraxMass
bodySegMass.abdomenMass =           0.1390*kgMass;
bodySegMass.hipMass =               0.1420*kgMass; %pelvisMass
bodySegMass.trunkMass =             0.4970*kgMass;

assert(bodySegMass.trunkMass == bodySegMass.chestMass...
    + bodySegMass.abdomenMass + bodySegMass.hipMass, 'Torso needs rechecking!')

%% Upper extremity segMass by total Mass of body
bodySegMass.handMass =              0.0060*kgMass;
bodySegMass.forearmMass =           0.0160*kgMass;
bodySegMass.upperArmMass =          0.0280*kgMass;
bodySegMass.totalArmMass =          0.0500*kgMass;

%disregarded for calc 
%bodySegMass.shoulderMass =          0.0158*kgMass;

assert(bodySegMass.totalArmMass == bodySegMass.handMass...
    + bodySegMass.forearmMass + bodySegMass.upperArmMass, 'Upper extremity needs rechecking!')

%% Lower extremity segMass by total Mass of body
bodySegMass.footMass =              0.0145*kgMass;
bodySegMass.legMass =               0.0465*kgMass;
bodySegMass.thighMass =             0.1000*kgMass;
bodySegMass.totalLegMass =          0.1610*kgMass;

assert((bodySegMass.totalLegMass - (bodySegMass.footMass...
    + bodySegMass.legMass + bodySegMass.thighMass)) < 1e-10, 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping

bodySegMass.TotalMass = (bodySegMass.headMass + bodySegMass.trunkMass + (2.*bodySegMass.totalArmMass)...
    + (2.*bodySegMass.totalLegMass))/kgMass;

assert(bodySegMass.headMass + bodySegMass.trunkMass + (2.*bodySegMass.totalArmMass)...
    + (2.*bodySegMass.totalLegMass) > 1, 'Total Body Evaluation needs rechecking!')


end

