function [handTotalSegMass,forearmTotalSegMass] = bodySegMass(totalMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates totalMass of each body segment based on totalMass (kg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Upper extremity segments by total mass of body
handTotalSegMass = 0.0060*totalMass;
forearmTotalSegMass = 0.0160*totalMass;
upperArmTotalSegMass = 0.0280*totalMass;
upperExtremityTotalSegMass = 0.0500*totalMass;

%COM by segment length for hand,forearm, upper arm (proximal & distal)
proximalHandCOM = 0.506*totalMass;
distalHandCOM = 0.494*totalMass;

proximalForearmCOM = 0.430*totalMass;
distalForearmCOM = 0.570*totalMass;

proximalUpperArmCOM = 0.436*totalMass;
distalUpperArmCOM = 0.564*totalMass;

proximalUpperExtremityCOM = 0.470*totalMass;
distalUpperExtremityCOM = 0.530*totalMass;

%% Lower extremity segment mass by total mass of body
footTotalSegMass = 0.0145;
legTotalSegMass = 0.0465;
thighTotalSegMass = 0.1000;
lowerExtremityTotalSegMass = 0.1610;

%COM by segment length for foot,leg,leg,thigh,lower extremity (proximal & distal)
proximalFootCOM = 0.500*totalMass;
distalFootCOM = 0.500*totalMass;

proximalLegCOM = 0.433*totalMass;
distalLegCOM = 0.567*totalMass;

proximalThighCOM = 0.433*totalMass;
distalThighCOM = 0.567*totalMass;

proximalLowerExtremityCOM = 0.447*totalMass;
distalLowerExtremityCOM = 0.553*totalMass;

%% Upper torso segment mass by total mass of body
headTotalSegMass = 0.0810*totalMass;
shoulderTotalSegMass = 0.0158*totalMass;
thoraxTotalSegMass = 0.2160*totalMass;
abdomenTotalSegMass = 0.1390*totalMass;
pelvisTotalSegMass = 0.1420*totalMass;
trunkTotalSegMass = 0.4970*totalMass;

%COM by segment length for head,shoulder,thorax,abdomen,pelvis,trunk (proximal & distal)
proximalHeadCOM = 1.000*totalMass;
distalHeadCOM = 0*totalMass;

proximalShoulderCOM = 0.712*totalMass;
distalShoulderCOM = 0.288*totalMass;

proximalThoraxCOM = 0.820*totalMass;
distalThoraxCOM = 0.180*totalMass;

proximalAbdomenCOM = 0.440*totalMass;
distalAbdomenCOM = 0.560*totalMass;

proximalPelvisCOM = 0.105*totalMass;
distalPelvisCOM = 0.895*totalMass;

proximalTrunkCOM = 0.495*totalMass;
distalTrunkCOM = 0.505*totalMass;


%% Anthropometry Dempsters Table (segment mass/total mass)
%Dempsters Body Segment Parameters

dempster = [handTotalSegMass proximalHandCOM distalHandCOM;
    forearmTotalSegMass proximalForearmCOM distalForearmCOM;
    upperArmTotalSegMass proximalUpperArmCOM distalUpperArmCOM;
    upperExtremityTotalSegMass proximalUpperExtremityCOM distalUpperExtremityCOM;
    footTotalSegMass proximalFootCOM distalFootCOM;
    legTotalSegMass proximalLegCOM distalLegCOM; 
    thighTotalSegMass proximalThighCOM distalThighCOM;
    lowerExtremityTotalSegMass proximalLowerExtremityCOM distalLowerExtremityCOM;
    headTotalSegMass proximalHeadCOM distalHeadCOM;
    shoulderTotalSegMass proximalShoulderCOM distalShoulderCOM;
    thoraxTotalSegMass proximalThoraxCOM distalThoraxCOM;
    abdomenTotalSegMass proximalAbdomenCOM distalAbdomenCOM;
    pelvisTotalSegMass proximalPelvisCOM distalPelvisCOM;
    trunkTotalSegMass proximalTrunkCOM distalTrunkCOM];
end

