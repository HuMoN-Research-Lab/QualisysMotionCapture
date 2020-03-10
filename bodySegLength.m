function [bodySegLength] = bodySegLength(totalHeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates length of each body segment based on totalHeight (cm)
%bodyHeight functions prepared via Drillis and Contini (1966)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper extremity segment by total height
handTotalLength = 0.108*totalHeight;
bodySegLength.handTotalLength = handTotalLength;
forearmTotalLength = 0.146*totalHeight;
bodySegLength.forearmTotalLength = forearmTotalLength;
upperArmTotalLength = 0.186*totalHeight;
bodySegLength.armTotalLength = upperArmTotalLength;
shoulderTotalLength = 0.1295*totalHeight;
bodySegLength.shoulderTotalLength = shoulderTotalLength;

%% Lower extremity segment length
footTotalLength = 0.152*totalHeight;
bodySegLength.footTotalLength = footTotalLength;
footTotalBreadth = 0.055*totalHeight;
bodySegLength.footTotalBreadth = footTotalBreadth;
ankleTotalHeight = 0.039*totalHeight;
bodySegLength.ankleTotalHeight = ankleTotalHeight;
legTotalLength = 0.285*totalHeight - ankleTotalHeight;
bodySegLength.legTotalLength = legTotalLength;
thighTotalLength = 0.530*totalHeight - legTotalLength;
bodySegLength.thighTotalLength = thighTotalLength;
hipsTotalLength = 0.191*totalHeight;
bodySegLength.hipsTotalLength = hipsTotalLength;

%% Upper torso segment length
headTotalLength = 0.130*totalHeight;
bodySegLength.headTotalLength = headTotalLength;
chestTotalWidth = 0.174*totalHeight;
bodySegLength.ribsTotalWidth = chestTotalWidth;

% %COM by segment length for head,shoulder,thorax,abdomen,pelvis,trunk (proximal & distal)
% proximalHeadCOM = 1.000*totalWeight;
% bodySegWeight.proximalHeadCOM = proximalHeadCOM;
% distalHeadCOM = 0*totalWeight;
% bodySegWeight.distalHeadCOM = distalHeadCOM; 
% 
% if proximalHeadCOM+distalHeadCOM ~= 1
%     disp('HeadCOM needs rechecking!');
% end
% 
% proximalShoulderCOM = 0.712*totalWeight;
% bodySegWeight.proximalShoulderCOM = proximalShoulderCOM;
% distalShoulderCOM = 0.288*totalWeight;
% bodySegWeight.distalShoulderCOM = distalShoulderCOM;
% 
% if proximalShoulderCOM+distalShoulderCOM ~= 1
%     disp('ShoulderCOM needs rechecking!');
% end
% 
% proximalThoraxCOM = 0.820*totalWeight;
% bodySegWeight.proximalThoraxCOM = proximalThoraxCOM;
% distalThoraxCOM = 0.180*totalWeight;
% bodySegWeight.distalThoraxCOM = distalThoraxCOM;
% 
% if proximalThoraxCOM+distalThoraxCOM ~= 1
%     disp('ThoraxCOM needs rechecking!');
% end
% 
% proximalAbdomenCOM = 0.440*totalWeight;
% bodySegWeight.proximalAbdomenCOM = proximalAbdomenCOM; 
% distalAbdomenCOM = 0.560*totalWeight;
% bodySegWeight.distalAbdomenCOM = distalAbdomenCOM;
% 
% if proximalAbdomenCOM+distalAbdomenCOM ~= 1
%     disp('AbdomenCOM needs rechecking!');
% end
% 
% proximalPelvisCOM = 0.105*totalWeight;
% bodySegWeight.proximalPelvisCOM = proximalPelvisCOM;
% distalPelvisCOM = 0.895*totalWeight;
% bodySegWeight.distalPelvisCOM = distalPelvisCOM;
% 
% if proximalPelvisCOM+distalPelvisCOM ~= 1
%     disp('PelvisCOM needs rechecking!');
% end
% 
% proximalTrunkCOM = 0.495*totalWeight;
% bodySegWeight.proximalTrunkCOM = proximalTrunkCOM;
% distalTrunkCOM = 0.505*totalWeight;
% bodySegWeight.distalTrunkCOM = distalTrunkCOM;
% 
% if proximalTrunkCOM+distalTrunkCOM ~= 1
%     disp('TrunkCOM needs rechecking!');
% end

% %COM by segment length for hand,forearm, upper arm (proximal & distal)
% proximalHandCOM = 0.506*totalWeight;
% bodySegWeight.proximalHandCOM = proximalHandCOM;
% distalHandCOM = 0.494*totalWeight;
% bodySegWeight.distalHandCOM = distalHandCOM;
% 
% if proximalHandCOM+distalHandCOM ~= 1
%     disp('HandCOM needs rechecking!');
% end
% 
% proximalForearmCOM = 0.430*totalWeight;
% bodySegWeight.proximalForearmCOM = proximalForearmCOM;
% distalForearmCOM = 0.570*totalWeight;
% bodySegWeight.distalForearmCOM = distalForearmCOM;
% 
% if proximalForearmCOM+distalForearmCOM ~= 1
%     disp('ForearmCOM needs rechecking!');
% end
% 
% proximalUpperArmCOM = 0.436*totalWeight;
% bodySegWeight.proximalUpperArmCOM = proximalUpperArmCOM;
% distalUpperArmCOM = 0.564*totalWeight;
% bodySegWeight.distalUpperArmCOM = distalUpperArmCOM;
% 
% if proximalUpperArmCOM+distalUpperArmCOM ~= 1
%     disp('UpperArmCOM needs rechecking!');
% end
% 
% proximalUpperExtremityCOM = 0.470*totalWeight;
% bodySegWeight.proximalUpperExtremityCOM = proximalUpperExtremityCOM;
% distalUpperExtremityCOM = 0.530*totalWeight;
% bodySegWeight.distalUpperExtremityCOM = distalUpperExtremityCOM;
% 
% if proximalUpperExtremityCOM+distalUpperExtremityCOM ~= 1
%     disp('UpperExtremityCOM needs rechecking!');
% end

% %COM by segment length for foot,leg,leg,thigh,lower extremity (proximal & distal)
% proximalFootCOM = 0.500*totalWeight;
% bodySegWeight.proximalFootCOM = proximalFootCOM;
% distalFootCOM = 0.500*totalWeight;
% bodySegWeight.distalFootCOM = distalFootCOM;
% 
% if proximalFootCOM+distalFootCOM ~= 1
%     disp('FootCOM needs rechecking!');
% end
% 
% proximalLegCOM = 0.433*totalWeight;
% bodySegWeight.proximalLegCOM = proximalLegCOM;
% distalLegCOM = 0.567*totalWeight;
% bodySegWeight.distalLegCOM = distalLegCOM;
% 
% if proximalLegCOM+distalLegCOM ~= 1
%     disp('LegCOM needs rechecking!');
% end
% 
% proximalThighCOM = 0.433*totalWeight;
% bodySegWeight.proximalThighCOM = proximalThighCOM;
% distalThighCOM = 0.567*totalWeight;
% bodySegWeight.distalThighCOM = distalThighCOM;
% 
% if proximalThighCOM+distalThighCOM ~= 1
%     disp('ThighCOM needs rechecking!');
% end
% 
% proximalLowerExtremityCOM = 0.447*totalWeight;
% bodySegWeight.proximalLowerExtremityCOM = proximalLowerExtremityCOM;
% distalLowerExtremityCOM = 0.553*totalWeight;
% bodySegWeight.distalLowerExtremityCOM = distalLowerExtremityCOM;
% 
% if proximalLowerExtremityCOM+distalLowerExtremityCOM ~= 1
%     disp('LowerExtremity needs rechecking!');
% end






%% Vaughan Equations for Body Segmentation
%length of foot and malleolus height need to be found for EQ's

%Reg EQ for Foot about Flexion-Extension Axis
% inertiaFootFlexionExtension = 0.00023*totalMass...
%     (4*malleolusHeight^2+3*lengthFoot^2)+0.00022)

%Reg EQ for Foot about Abduction-Adduction Axis

%Reg EQ for Foot about Internal-External rotation

end

