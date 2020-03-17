function [bodySegMass] = calcBodySegMass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates totalMass of each body segment based on users totalMass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper torso segMass by totalMass of body
bodySegMass = [];
bodySegMass.headMass =              0.0810*kgMass;
bodySegMass.shoulderMass =          0.0158*kgMass;

%trunkMass calculation
bodySegMass.chestMass =             0.2160*kgMass; %thoraxMass
bodySegMass.abdomenMass =           0.1390*kgMass;
bodySegMass.hipMass =               0.1420*kgMass; %pelvisMass
bodySegMass.trunkMass =             0.4970*kgMass;

assert(bodySegMass.trunkMass == bodySegMass.chestMass...
    + bodySegMass.abdomenMass + bodySegMass.hipMass, 'TrunkMass needs rechecking!')

%%Old Code
% if trunkMass ~= chestMass+abdomenMass+hipMass
%     disp('TrunkMass needs rechecking!');
% end

%% Upper extremity segMass by total Mass of body
bodySegMass.handMass =              0.0060*kgMass;
bodySegMass.forearmMass =           0.0160*kgMass;
bodySegMass.upperArmMass =          0.0280*kgMass;
bodySegMass.upperExtremityMass =    0.0500*kgMass;

assert(bodySegMass.upperExtremityMass == bodySegMass.handMass...
    + bodySegMass.forearmMass + bodySegMass.upperArmMass, 'UpperExtremityMass needs rechecking!')

%%Old Code
% if upperExtremityMass ~= handMass+forearmMass+upperArmMass
%     disp('UpperExtremityMass needs rechecking!');
% end


%% Lower extremity segMass by total Mass of body
bodySegMass.footMass =              0.0145*kgMass;
bodySegMass.legMass =               0.0465*kgMass;
bodySegMass.thighMass =             0.1000*kgMass;
bodySegMass.lowerExtremityMass =    0.1610*kgMass;

% assert(bodySegMass.lowerExtremityMass == bodySegMass.footMass...
%     + bodySegMass.legMass + bodySegMass.thighMass, 'LowerExtremityMass needs rechecking!')

%%Old Code
% if lowerExtremityMass ~= footMass+legMass+thighMass
%     disp('LowerExtremityMass needs rechecking!');
% end


end

