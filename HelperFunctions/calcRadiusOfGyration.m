function [momentInertia,density] = calcRadiusOfGyration(bodySegMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcRadiusOfGyration function calculates radius of gyration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Establishing output parameters
radiusGyration = [];
density = [];

%% Head radius of gyration COG, proximal, distal
%Includes: Head and Neck
headCOG = 0.495;
momentInertia.headCOG = bodySegMass.headMass .* ...
                        (bodySegLength.headTotalLength .* headCOG)^2;
headProximal = 0.116;
momentInertia.headProximal = bodySegMass.headMass .* ...
                        (bodySegLength.headTotalLength .* headProximal)^2;
headDistal = 0.00;
momentInertia.headDistal = bodySegMass.headMass .* ...
                        (bodySegLength.headTotalLength .* headDistal)^2;
density.head = 1.11;

%% Trunk and head radius of gyration COG, proximal, distal
%Includes: Thorax, Abdomen, Pelvis, and Head
upperBodyCOG = 0.503;
momentInertia.upperBodyCOG = bodySegMass.trunkMass .* ...
                        (bodySegLength.chestTotalWidth .* upperBodyCOG)^2;
upperBodyProximal = 0.830;
momentInertia.upperBodyProximal = bodySegMass.trunkMass .* ...
                        (bodySegLength.chestTotalWidth .* upperBodyProximal)^2;
upperBodyDistal = 0.607;
momentInertia.upperBodyDistal = bodySegMass.trunkMass .* ...
                        (bodySegLength.chestTotalWidth .* upperBodyDistal)^2;
density.trunk = 1.03;

%% Head, arms, and trunk (HAT) radius of gyration COG, proximal, distal
%Includes: Thorax, Abdomen, Pelvis, and Head
radiusGyration.HATCOG = 0.496;
momentInertia.HATCOG = bodySegMass.trunkMass .* ...
                        (bodySegLength.chestTotalWidth .* HATCOG)^2;
radiusGyration.HATProximal = 0.798;
radiusGyration.HATDistal = 0.621;

%% UpperArm radius of gyration COG, proximal, distal and density
radiusGyration.UpperArmCOG = 0.322;
radiusGyration.UpperArmProximal = 0.542;
radiusGyration.UpperArmDistal = 0.645;
density.UpperArm = 1.07;

%% Forearm radius of gyration COG, proximal, distal and density
radiusGyration.ForearmCOG = 0.303;
radiusGyration.ForearmProximal = 0.526;
radiusGyration.ForearmDistal = 0.647;
density.Forearm = 1.13;

%% Hand radius of gyration COG, proximal, distal and density
radiusGyration.HandCOG = 0.297;
radiusGyration.HandProximal = 0.587;
radiusGyration.HandDistal = 0.577;
density.Hand = 1.16;

%% Thigh radius of gyration COG, proximal, distal and density
radiusGyration.ThighCOG = 0.323;
radiusGyration.ThighProximal = 0.540;
radiusGyration.ThighDistal = 0.653;
density.Thigh = 1.05;

%% Leg radius of gyration COG, proximal, distal and density
radiusGyration.LegCOG = 0.302;
radiusGyration.LegProximal = 0.528;
radiusGyration.LegDistal = 0.643;
density.Leg = 1.09;

%% Foot radius of gyration COG, proximal, distal and density
radiusGyration.FootCOG = 0.475;
radiusGyration.FootProximal = 0.690;
radiusGyration.FootDistal = 0.690;
density.Foot = 1.10;

