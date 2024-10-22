function [body_seg_weight,prop_seg_weight] = calc_body_seg_mass(kg_mass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculates total weight of body segment based on subject overall kgMass
%Prepared based on Miller & Nelson and Lea & Febiger
%Pages 63-64 in David A. Winters book
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Output parameters
prop_seg_weight = [];
body_seg_weight = [];
show_table = false; %Shows table values for verification purposes

%% Torso seg_mass by total_mass of body
% Head prop_weight
prop_seg_weight.head_prop =             0.0810; %head_mass and neck_mass 
body_seg_weight.head_mass =             prop_seg_weight.head_prop*kg_mass;

% Shoulder prop_weight
prop_seg_weight.shoulder_prop =         0.0158;
body_seg_weight.shoulder_mass =         0.0158*kg_mass;

% HAT prop_weight
prop_seg_weight.HAT_prop =              0.678;
body_seg_weight.HAT_mass =              0.678*kg_mass;

% trunk_mass calculation
prop_seg_weight.chest_prop =            0.2160; %thorax_mass
body_seg_weight.chest_mass =            prop_seg_weight.chest_prop*kg_mass; 

prop_seg_weight.abdomen_prop =          0.1390;
body_seg_weight.abdomen_mass =          prop_seg_weight.abdomen_prop*kg_mass;

prop_seg_weight.hip_prop =              0.1420; %pelvis_mass
body_seg_weight.hip_mass =              prop_seg_weight.hip_prop*kg_mass; 

prop_seg_weight.trunk_prop =            0.4970;
body_seg_weight.trunk_mass =            prop_seg_weight.trunk_prop*kg_mass;

assert(prop_seg_weight.trunk_prop == prop_seg_weight.chest_prop...
    + prop_seg_weight.abdomen_prop + prop_seg_weight.hip_prop, 'Torso needs rechecking!')

%% Upper extremity seg_mass by total_mass of body
% Hand prop_weight
prop_seg_weight.hand_prop =             0.0060;
body_seg_weight.hand_mass =             prop_seg_weight.hand_prop*kg_mass;

% Forearm prop_weight
prop_seg_weight.forearm_prop =          0.0160;
body_seg_weight.forearm_mass =          prop_seg_weight.forearm_prop*kg_mass;

% Upper arm prop_weight
prop_seg_weight.upper_arm_prop =        0.0280;
body_seg_weight.upper_arm_mass =        prop_seg_weight.upper_arm_prop*kg_mass;

% Total arm prop_weight
prop_seg_weight.total_arm_prop =        0.0500;
body_seg_weight.total_arm_mass =        prop_seg_weight.total_arm_prop*kg_mass;

% Error checking tool for verifying total_arm_prop values
assert(prop_seg_weight.total_arm_prop == prop_seg_weight.hand_prop...
    + prop_seg_weight.forearm_prop + prop_seg_weight.upper_arm_prop, 'Upper extremity needs rechecking!')

%% Lower extremity seg_mass by total_mass of body
% Foot prop_weight
prop_seg_weight.foot_prop =             0.0145;
body_seg_weight.foot_mass =             prop_seg_weight.foot_prop*kg_mass;

% Leg prop_weight
prop_seg_weight.leg_prop =              0.0465;
body_seg_weight.leg_mass =              prop_seg_weight.leg_prop*kg_mass;

% Thigh prop_weight
prop_seg_weight.thigh_prop =            0.1000;
body_seg_weight.thigh_mass =            prop_seg_weight.thigh_prop*kg_mass;

% Total leg prop_weight
prop_seg_weight.total_leg_prop =         0.1610;
body_seg_weight.total_leg_mass =         prop_seg_weight.total_leg_prop*kg_mass;

% Error checking tool for verifying total_leg_prop values
assert(prop_seg_weight.total_leg_prop == (prop_seg_weight.foot_prop...
    + prop_seg_weight.leg_prop + prop_seg_weight.thigh_prop), 'Lower extremity needs rechecking!')

%% Total Body Evaluation by grouping
% Error checking tool for verifying total_body_prop values
assert(prop_seg_weight.head_prop + prop_seg_weight.trunk_prop + (2.*prop_seg_weight.total_arm_prop)...
    + (2.*prop_seg_weight.total_leg_prop) == 1, 'Total Body Evaluation needs rechecking!')

%% Visual representation of table
% Tool for troubleshooting table values
segNames = {'Head and neck';'Shoulder Mass';'Thorax';'Abdomen';'Pelvis';...
    'Trunk';'Hand';'Forearm';'Upper arm';'Total arm';'Foot';'Leg';'Thigh';'Total Leg';};

segWeight = [prop_seg_weight.head_prop;prop_seg_weight.shoulder_prop;...
    prop_seg_weight.chest_prop;prop_seg_weight.abdomen_prop;prop_seg_weight.hip_prop;...
    prop_seg_weight.trunk_prop;prop_seg_weight.hand_prop;prop_seg_weight.forearm_prop;...
    prop_seg_weight.upper_arm_prop;prop_seg_weight.total_arm_prop;prop_seg_weight.foot_prop;...
    prop_seg_weight.leg_prop;prop_seg_weight.thigh_prop;prop_seg_weight.total_leg_prop];

%Condition that shows or hides table
if show_table == true
    T = table(segWeight,'RowNames',segNames)
end

end

