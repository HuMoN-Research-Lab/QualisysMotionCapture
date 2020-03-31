function [bodySegMass,segPropWeight] = calcBodySegMass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalMass of each body segment based on users overall kgMass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Establishing output parameters
bodySegMass = [];
segPropWeight = [];

%% Torso segMass by totalMass of body
%Head propWeight
segPropWeight.headProp =             0.0810; %headMass and neckMass 
bodySegMass.headMass =              segPropWeight.headProp*kgMass;

%Shoulder propWeight
segPropWeight.shoulderProp =         0.0158;
bodySegMass.shoulderMass =          0.0158*kgMass;

%trunkMass calculation
segPropWeight.chestProp =            0.2160; %thoraxMass
bodySegMass.chestMass =             segPropWeight.chestProp*kgMass; 
segPropWeight.abdomenProp =          0.1390;
bodySegMass.abdomenMass =           segPropWeight.abdomenProp*kgMass;
segPropWeight.hipProp =              0.1420; %pelvisMass
bodySegMass.hipMass =               segPropWeight.hipProp*kgMass; 
segPropWeight.trunkProp =            0.4970;
bodySegMass.trunkMass =             segPropWeight.trunkProp*kgMass;

assert(segPropWeight.trunkProp == segPropWeight.chestProp...
    + segPropWeight.abdomenProp + segPropWeight.hipProp, 'Torso needs rechecking!')

%% Upper extremity segMass by total Mass of body
segPropWeight.handProp =             0.0060;
bodySegMass.handMass =              segPropWeight.handProp*kgMass;
segPropWeight.forearmProp =          0.0160;
bodySegMass.forearmMass =           segPropWeight.forearmProp*kgMass;
segPropWeight.upperArmProp =         0.0280;
bodySegMass.upperArmMass =          segPropWeight.upperArmProp*kgMass;
segPropWeight.totalArmProp =         0.0500;
bodySegMass.totalArmMass =          segPropWeight.totalArmProp*kgMass;

assert(segPropWeight.totalArmProp == segPropWeight.handProp...
    + segPropWeight.forearmProp + segPropWeight.upperArmProp, 'Upper extremity needs rechecking!')

%% Lower extremity segMass by total Mass of body
segPropWeight.footProp =             0.0145;
bodySegMass.footMass =              segPropWeight.footProp*kgMass;
segPropWeight.legProp =              0.0465;
bodySegMass.legMass =               segPropWeight.legProp*kgMass;
segPropWeight.thighProp =            0.1000;
bodySegMass.thighMass =             segPropWeight.thighProp*kgMass;
segPropWeight.totalLegProp =         0.1610;
bodySegMass.totalLegMass =          segPropWeight.totalLegProp*kgMass;

assert(segPropWeight.totalLegProp == (segPropWeight.footProp...
    + segPropWeight.legProp + segPropWeight.thighProp), 'Lower extremity needs rechecking!')

% assert((segWeight.totalLegWeight - (segWeight.footWeight...
%     + segWeight.legWeight + segWeight.thighWeight)) < 1e-10, 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping

assert(segPropWeight.headProp + segPropWeight.trunkProp + (2.*segPropWeight.totalArmProp)...
    + (2.*segPropWeight.totalLegProp) == 1, 'Total Body Evaluation needs rechecking!')

end

