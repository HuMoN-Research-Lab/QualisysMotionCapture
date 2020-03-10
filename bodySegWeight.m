function [bodySegWeight] = bodySegWeight(totalWeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalWeight of each body segment based on users totalWeight
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper torso segWeight by totalWeight of body
headWeight = 0.0810*totalWeight;
bodySegWeight.headWeight = headWeight;
shoulderWeight = 0.0158*totalWeight;
bodySegWeight.shoulderWeight = shoulderWeight;

%trunkWeight calculation
chestWeight = 0.2160*totalWeight; %thoraxWeight
bodySegWeight.thoraxWeight = chestWeight;
abdomenWeight = 0.1390*totalWeight;
bodySegWeight.abdomenWeight = abdomenWeight;
hipWeight = 0.1420*totalWeight; %pelvisWeight
bodySegWeight.pelvisWeight = hipWeight; %pelvisWeight
trunkWeight = 0.4970*totalWeight;
bodySegWeight.trunkWeight = trunkWeight;

if trunkWeight ~= chestWeight+abdomenWeight+hipWeight
    disp('TrunkWeight needs rechecking!');
end

%% Upper extremity segWeight by total Weight of body
handWeight = 0.0060*totalWeight;
bodySegWeight.handWeight = handWeight;
forearmWeight = 0.0160*totalWeight;
bodySegWeight.forearmWeight = forearmWeight;
upperArmWeight = 0.0280*totalWeight;
bodySegWeight.upperArmWeight = upperArmWeight;
upperExtremityWeight = 0.0500*totalWeight;
bodySegWeight.upperExtremityWeight = upperExtremityWeight;

if upperExtremityWeight ~= handWeight+forearmWeight+upperArmWeight
    disp('UpperExtremityWeight needs rechecking!');
end

%% Lower extremity segWeight by total Weight of body
footWeight = 0.0145;
bodySegWeight.footWeight = footWeight;
legWeight = 0.0465;
bodySegWeight.legWeight = legWeight;
thighWeight = 0.1000;
bodySegWeight.thighWeight = thighWeight;
lowerExtremityWeight = 0.1610;
bodySegWeight.lowerExtremityWeight = lowerExtremityWeight;

if lowerExtremityWeight ~= footWeight+legWeight+thighWeight
    disp('LowerExtremityWeight needs rechecking!');
end

end

