function [bodySegMass,propWeight] = calcBodySegMass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalMass of each body segment based on users overall kgMass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Torso segMass by totalMass of body
bodySegMass = [];
propWeight = [];

%Head propWeight
propWeight.headWeight =             0.0810; %headMass and neckMass 
bodySegMass.headMass =              propWeight.headWeight*kgMass;

%Shoulder propWeight
propWeight.shoulderWeight =         0.0158;
bodySegMass.shoulderMass =          0.0158*kgMass;

%trunkMass calculation
propWeight.chestWeight =            0.2160; %thoraxMass
bodySegMass.chestMass =             propWeight.chestWeight*kgMass; 
propWeight.abdomenWeight =          0.1390;
bodySegMass.abdomenMass =           propWeight.abdomenWeight*kgMass;
propWeight.hipWeight =              0.1420; %pelvisMass
bodySegMass.hipMass =               propWeight.hipWeight*kgMass; 
propWeight.trunkWeight =            0.4970;
bodySegMass.trunkMass =             propWeight.trunkWeight*kgMass;

assert(propWeight.trunkWeight == propWeight.chestWeight...
    + propWeight.abdomenWeight + propWeight.hipWeight, 'Torso needs rechecking!')

%% Upper extremity segMass by total Mass of body
propWeight.handWeight =             0.0060;
bodySegMass.handMass =              propWeight.handWeight*kgMass;
propWeight.forearmWeight =          0.0160;
bodySegMass.forearmMass =           propWeight.forearmWeight*kgMass;
propWeight.upperArmWeight =         0.0280;
bodySegMass.upperArmMass =          propWeight.upperArmWeight*kgMass;
propWeight.totalArmWeight =         0.0500;
bodySegMass.totalArmMass =          propWeight.totalArmWeight*kgMass;

assert(propWeight.totalArmWeight == propWeight.handWeight...
    + propWeight.forearmWeight + propWeight.upperArmWeight, 'Upper extremity needs rechecking!')

%% Lower extremity segMass by total Mass of body
propWeight.footWeight =             0.0145;
bodySegMass.footMass =              propWeight.footWeight*kgMass;
propWeight.legWeight =              0.0465;
bodySegMass.legMass =               propWeight.legWeight*kgMass;
propWeight.thighWeight =            0.1000;
bodySegMass.thighMass =             propWeight.thighWeight*kgMass;
propWeight.totalLegWeight =         0.1610;
bodySegMass.totalLegMass =          propWeight.totalLegWeight*kgMass;

assert(propWeight.totalLegWeight == (propWeight.footWeight...
    + propWeight.legWeight + propWeight.thighWeight), 'Lower extremity needs rechecking!')

% assert((segWeight.totalLegWeight - (segWeight.footWeight...
%     + segWeight.legWeight + segWeight.thighWeight)) < 1e-10, 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping

assert(propWeight.headWeight + propWeight.trunkWeight + (2.*propWeight.totalArmWeight)...
    + (2.*propWeight.totalLegWeight) == 1, 'Total Body Evaluation needs rechecking!')

end

