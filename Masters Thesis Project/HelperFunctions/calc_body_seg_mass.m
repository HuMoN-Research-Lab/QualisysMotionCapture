function [bodySegWeight,propSegWeight] = calc_body_seg_mass(kgMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates total weight of body segment based on subject overall kgMass
%Prepared based on Miller & Nelson and Lea & Febiger
%Pages 63-64 in David A. Winters book
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establishing output parameters
propSegWeight = [];
bodySegWeight = [];
showTable = false;

%% Torso segMass by totalMass of body
%Head propWeight
propSegWeight.headProp =             0.0810; %headMass and neckMass 
bodySegWeight.headMass =             propSegWeight.headProp*kgMass;

%Shoulder propWeight
propSegWeight.shoulderProp =         0.0158;
bodySegWeight.shoulderMass =         0.0158*kgMass;

%HAT propWeight
propSegWeight.HATProp =              0.678;
bodySegWeight.HATMass =              0.678*kgMass;

%trunkMass calculation
propSegWeight.chestProp =            0.2160; %thoraxMass
bodySegWeight.chestMass =            propSegWeight.chestProp*kgMass; 

propSegWeight.abdomenProp =          0.1390;
bodySegWeight.abdomenMass =          propSegWeight.abdomenProp*kgMass;

propSegWeight.hipProp =              0.1420; %pelvisMass
bodySegWeight.hipMass =              propSegWeight.hipProp*kgMass; 

propSegWeight.trunkProp =            0.4970;
bodySegWeight.trunkMass =            propSegWeight.trunkProp*kgMass;

assert(propSegWeight.trunkProp == propSegWeight.chestProp...
    + propSegWeight.abdomenProp + propSegWeight.hipProp, 'Torso needs rechecking!')

%% Upper extremity segMass by total Mass of body
propSegWeight.handProp =             0.0060;
bodySegWeight.handMass =             propSegWeight.handProp*kgMass;

propSegWeight.forearmProp =          0.0160;
bodySegWeight.forearmMass =          propSegWeight.forearmProp*kgMass;

propSegWeight.upperArmProp =         0.0280;
bodySegWeight.upperArmMass =         propSegWeight.upperArmProp*kgMass;

propSegWeight.totalArmProp =         0.0500;
bodySegWeight.totalArmMass =         propSegWeight.totalArmProp*kgMass;

assert(propSegWeight.totalArmProp == propSegWeight.handProp...
    + propSegWeight.forearmProp + propSegWeight.upperArmProp, 'Upper extremity needs rechecking!')

%% Lower extremity segMass by total Mass of body
propSegWeight.footProp =             0.0145;
bodySegWeight.footMass =             propSegWeight.footProp*kgMass;

propSegWeight.legProp =              0.0465;
bodySegWeight.legMass =              propSegWeight.legProp*kgMass;

propSegWeight.thighProp =            0.1000;
bodySegWeight.thighMass =            propSegWeight.thighProp*kgMass;

propSegWeight.totalLegProp =         0.1610;
bodySegWeight.totalLegMass =         propSegWeight.totalLegProp*kgMass;

assert(propSegWeight.totalLegProp == (propSegWeight.footProp...
    + propSegWeight.legProp + propSegWeight.thighProp), 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping
assert(propSegWeight.headProp + propSegWeight.trunkProp + (2.*propSegWeight.totalArmProp)...
    + (2.*propSegWeight.totalLegProp) == 1, 'Total Body Evaluation needs rechecking!')

%% Visual representation of table
segNames = {'Head and neck';'Shoulder Mass';'Thorax';'Abdomen';'Pelvis';...
    'Trunk';'Hand';'Forearm';'Upper arm';'Total arm';'Foot';'Leg';'Thigh';'Total Leg';};

segWeight = [propSegWeight.headProp;propSegWeight.shoulderProp;...
    propSegWeight.chestProp;propSegWeight.abdomenProp;propSegWeight.hipProp;...
    propSegWeight.trunkProp;propSegWeight.handProp;propSegWeight.forearmProp;...
    propSegWeight.upperArmProp;propSegWeight.totalArmProp;propSegWeight.footProp;...
    propSegWeight.legProp;propSegWeight.thighProp;propSegWeight.totalLegProp];

if showTable == true
    T = table(segWeight,'RowNames',segNames)
end
%unsure how to make sure that 0 values are cut off

end

