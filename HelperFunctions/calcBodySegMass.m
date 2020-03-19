function [bodySegMass,segWeight] = calcBodySegMass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalMass of each body segment based on users totalMass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Torso segMass by totalMass of body
bodySegMass = [];
segWeight = [];

%headMass calculation
segWeight.headWeight =              0.0810; %headMass and neckMass 
bodySegMass.headMass =              segWeight.headWeight*kgMass;

%trunkMass calculation
segWeight.chestWeight =             0.2160; %thoraxMass
bodySegMass.chestMass =             segWeight.chestWeight*kgMass; 
segWeight.abdomenWeight =           0.1390;
bodySegMass.abdomenMass =           segWeight.abdomenWeight*kgMass;
segWeight.hipWeight =               0.1420; %pelvisMass
bodySegMass.hipMass =               segWeight.hipWeight*kgMass; 
segWeight.trunkWeight =             0.4970;
bodySegMass.trunkMass =             segWeight.trunkWeight*kgMass;

assert(segWeight.trunkWeight == segWeight.chestWeight...
    + segWeight.abdomenWeight + segWeight.hipWeight, 'Torso needs rechecking!')

%% Upper extremity segMass by total Mass of body
segWeight.handWeight =              0.0060;
bodySegMass.handMass =              segWeight.handWeight*kgMass;
segWeight.forearmWeight =           0.0160;
bodySegMass.forearmMass =           segWeight.forearmWeight*kgMass;
segWeight.upperArmWeight =          0.0280;
bodySegMass.upperArmMass =          segWeight.upperArmWeight*kgMass;
segWeight.totalArmWeight =          0.0500;
bodySegMass.totalArmMass =          segWeight.totalArmWeight*kgMass;

%disregarded for calc 
%bodySegMass.shoulderMass =          0.0158*kgMass;

assert(segWeight.totalArmWeight == segWeight.handWeight...
    + segWeight.forearmWeight + segWeight.upperArmWeight, 'Upper extremity needs rechecking!')

%% Lower extremity segMass by total Mass of body
segWeight.footWeight =              0.0145;
bodySegMass.footMass =              segWeight.footWeight*kgMass;
segWeight.legWeight =               0.0465;
bodySegMass.legMass =               segWeight.legWeight*kgMass;
segWeight.thighWeight =             0.1000;
bodySegMass.thighMass =             segWeight.thighWeight*kgMass;
segWeight.totalLegWeight =          0.1610;
bodySegMass.totalLegMass =          segWeight.totalLegWeight*kgMass;

assert(segWeight.totalLegWeight == (segWeight.footWeight...
    + segWeight.legWeight + segWeight.thighWeight), 'Lower extremity needs rechecking!')

% assert((segWeight.totalLegWeight - (segWeight.footWeight...
%     + segWeight.legWeight + segWeight.thighWeight)) < 1e-10, 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping

bodySegMass.TotalMass = (segWeight.headWeight + segWeight.trunkWeight...
    + (2.*segWeight.totalArmWeight) + (2.*segWeight.totalLegWeight))/kgMass;

assert(segWeight.headWeight + segWeight.trunkWeight + (2.*segWeight.totalArmWeight)...
    + (2.*segWeight.totalLegWeight) == 1, 'Total Body Evaluation needs rechecking!')

end

