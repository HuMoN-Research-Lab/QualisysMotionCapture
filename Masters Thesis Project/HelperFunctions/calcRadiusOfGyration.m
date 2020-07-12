function [radGyra] = calcRadiusOfGyration(bodySegLength)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcRadiusOfGyration calcs radius of gyration for body seg
%Parameters from Dempsters Body Segment Parameters
%Page 55 from Research Methods in Biomechanics by Gordon and Robertson
%(2014)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Establishing output parameters
%radiusGyration = [];
radGyra = [];
density = [];

showTable = false;

%% Head, arms, and trunk (HAT) radius of gyration COG, proximal, distal
%Includes: Thorax, Abdomen, Pelvis, and Head
HATCOG =                            0.903;
HATProximal =                       1.456;
HATDistal =                         0.00;

%% Thigh radius of gyration COG, proximal, and distal
thighCOG =              0.323;
thighProximal =         0.540;
thighDistal =           0.653;

radGyra.LThighCOG =         bodySegLength.LThigh_length * thighCOG;
radGyra.RThighCOG =         bodySegLength.RThigh_length * thighCOG;
radGyra.LThighProximal = 	bodySegLength.LThigh_length * thighProximal;
radGyra.RThighProximal = 	bodySegLength.RThigh_length * thighProximal;
radGyra.LThighDistal =      bodySegLength.LThigh_length * thighDistal;
radGyra.RThighDistal =      bodySegLength.RThigh_length * thighDistal;

% density.thigh =        1.05;

%% Leg radius of gyration COG, proximal, and distal
legCOG =                0.302;
legProximal =           0.528;
legDistal =             0.643;

radGyra.LLegCOG =           bodySegLength.LShank_length * legCOG;
radGyra.RLegCOG =           bodySegLength.RShank_length * legCOG;
radGyra.LLegProximal =      bodySegLength.LShank_length * legProximal;
radGyra.RLegProximal =      bodySegLength.RShank_length * legProximal;
radGyra.LLegDistal =        bodySegLength.LShank_length * legDistal;
radGyra.RLegDistal =        bodySegLength.RShank_length * legDistal;

% density.leg =           1.09;

%% Foot radius of gyration COG, proximal, distal and density
footCOG =               0.475;
footProximal =          0.690;
footDistal =            0.690;

radGyra.LFootCOG =           bodySegLength.LFoot_length * footCOG;
radGyra.RFootCOG =           bodySegLength.RFoot_length * footCOG;
radGyra.LFootProximal =      bodySegLength.LFoot_length * footProximal;
radGyra.RFootProximal =      bodySegLength.RFoot_length * footProximal;
radGyra.LFootDistal =        bodySegLength.LFoot_length * footDistal;
radGyra.RFootDistal =        bodySegLength.RFoot_length * footDistal;

% density.foot =          1.10;

%% Visual representation of table
segNames = {'Foot';'Leg';'Thigh'};
    
% 'Head and neck';'Shoulder Mass';'Thorax';'Abdomen';'Pelvis';...
%     'Trunk';'Hand';'Forearm';'Upper arm';'Total arm';'Foot';'Leg';'Thigh';'Total Leg';};
COG =       [footCOG;legCOG;thighCOG];
Proximal =  [footProximal;legProximal;thighProximal];
Distal =    [footDistal;legDistal;thighDistal];

if showTable == true
    T = table(COG,Proximal,Distal,'RowNames',segNames)
end

end
% %% Head radius of gyration COG, proximal, distal
% %Includes: Head and Neck
% headCOG =                           0.495;
% radGyra.headCOG =             bodySegMass.headMass .* ...
%                                     (bodySegLength.headTotalLength .* headCOG)^2;
%                                 
% headProximal =                      0.116;
% radGyra.headProximal =        bodySegMass.headMass .* ...
%                                     (bodySegLength.headTotalLength .* headProximal)^2;
%                                 
% headDistal =                        0.00;
% radGyra.headDistal =          bodySegMass.headMass .* ...
%                                     (bodySegLength.headTotalLength .* headDistal)^2;
%                                 
% density.head =                      1.11;
% 
% %% Trunk and head radius of gyration COG, proximal, distal
% %Includes: Thorax, Abdomen, Pelvis, and Head
% trunk_HeadCOG =                     0.503;
% radGyra.trunk_HeadCOG =       bodySegMass.trunkMass .* ...
%                                     (bodySegLength.trunkTotalLength .* trunk_HeadCOG)^2;
%                                 
% trunk_HeadProximal =                0.830;
% radGyra.trunk_HeadProximal =  bodySegMass.trunkMass .* ...
%                                     (bodySegLength.trunkTotalLength .* trunk_HeadProximal)^2;
%                                 
% trunk_HeadDistal =                  0.607;
% radGyra.trunk_HeadDistal =    bodySegMass.trunkMass .* ...
%                                     (bodySegLength.trunkTotalLength .* trunk_HeadDistal)^2;
%                                 
% density.trunk =                     1.03;
% 
% %% UpperArm radius of gyration COG, proximal, distal and density
% upperArmCOG =                       0.322;
% radGyra.upperArmCOG =         bodySegMass.upperArmMass .* ...
%                                     (bodySegLength.upperArmTotalLength .* upperArmCOG)^2;
%                                 
% upperArmProximal =                  0.542;
% radGyra.upperArmProximal =    bodySegMass.upperArmMass .* ...
%                                     (bodySegLength.upperArmTotalLength .* upperArmProximal)^2;
%                                 
% upperArmDistal =                    0.645;
% radGyra.upperArmDistal =      bodySegMass.upperArmMass .* ...
%                                     (bodySegLength.upperArmTotalLength .* upperArmDistal)^2;
%                                 
% density.upperArm =                  1.07;
% 
% %% Forearm radius of gyration COG, proximal, distal and density
% forearmCOG =                        0.303;
% radGyra.forearmCOG =          bodySegMass.forearmMass .* ...
%                                     (bodySegLength.forearmTotalLength .* forearmCOG)^2;
%                                 
% forearmProximal =                   0.526;
% radGyra.forearmProximal =     bodySegMass.forearmMass .* ...
%                                     (bodySegLength.forearmTotalLength .* forearmProximal)^2;
%                                 
% forearmDistal =                     0.647;
% radGyra.forearmDistal =       bodySegMass.forearmMass .* ...
%                                     (bodySegLength.forearmTotalLength .* forearmDistal)^2;
% 
% density.forearm =                   1.13;
% 
% %% Hand radius of gyration COG, proximal, distal and density
% handCOG =                           0.297;
% radGyra.forearmProximal =     bodySegMass.handMass .* ...
%                                     (bodySegLength.handTotalLength .* handCOG)^2;
% 
% handProximal =                      0.587;
% radGyra.handProximal =        bodySegMass.handMass .* ...
%                                     (bodySegLength.handTotalLength .* handProximal)^2;
% 
% handDistal =                        0.577;
% radGyra.handDistal =          bodySegMass.handMass .* ...
%                                     (bodySegLength.handTotalLength .* handDistal)^2;
% 
% density.hand =                      1.16;

