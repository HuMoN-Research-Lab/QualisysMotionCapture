function [bodySegWeight] = calcSegCOM(mmHeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcSegCOM by proximal or distal location of marker on the human anatomy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WTBD - Acquire location of individual points and input it into code
%% Upper Torso proximal and distal segment weights
%Incorporate marker location function
bodySegWeight = [];
bodySegWeight.proximalHeadCOM =                 1.000*mmHeight;
bodySegWeight.distalHeadCOM =                   0.000*mmHeight;

assert(bodySegWeight.proximalHeadCOM + bodySegWeight.distalHeadCOM == 1.000,...
    'HeadCOM needs rechecking!')

bodySegWeight.proximalChestCOM =                0.820*mmHeight; %thorax
bodySegWeight.distalChestCOM =                  0.180*mmHeight;

assert(bodySegWeight.proximalChestCOM + bodySegWeight.distalChestCOM == 1.000,...
    'ChestCOM needs rechecking!')

bodySegWeight.proximalAbdomenCOM =              0.440*mmHeight; 
bodySegWeight.distalAbdomenCOM =                0.560*mmHeight;

assert(bodySegWeight.proximalAbdomenCOM + bodySegWeight.distalAbdomenCOM == 1.000,...
    'AbdomenCOM needs rechecking!')

bodySegWeight.proximalhipsCOM =                 0.105*mmHeight; %pelvis
bodySegWeight.distalhipsCOM =                   0.895*mmHeight;

assert(bodySegWeight.proximalhipsCOM + bodySegWeight.distalhipsCOM == 1.000,...
    'HipsCOM needs rechecking!')

bodySegWeight.proximalTrunkCOM = 0.495*cmHeight;
bodySegWeight.distalTrunkCOM = 0.505*cmHeight;

assert(bodySegWeight.proximalTrunkCOM + bodySegWeight.distalTrunkCOM == 1.000,...
    'TrunkCOM needs rechecking!')


%% Upper extremity proximal and distal weights

bodySegWeight.proximalHandCOM =                 0.506*mmHeight;
bodySegWeight.distalHandCOM =                   0.494*mmHeight;

assert(bodySegWeight.proximalHandCOM + bodySegWeight.distalHandCOM == 1.000,...
    'HandCOM needs rechecking!')

bodySegWeight.proximalForearmCOM =              0.430*mmHeight;
bodySegWeight.distalForearmCOM =                0.570*mmHeight;

assert(bodySegWeight.proximalForearmCOM + bodySegWeight.distalForearmCOM == 1.000,...
    'ForearmCOM needs rechecking!')

bodySegWeight.proximalUpperArmCOM =             0.436*mmHeight;
bodySegWeight.distalUpperArmCOM =               0.564*mmHeight;

assert(bodySegWeight.proximalUpperArmCOM + bodySegWeight.distalUpperArmCOM == 1.000,...
    'UpperArmCOM needs rechecking!')

bodySegWeight.proximalShoulderCOM =             0.712*mmHeight;
bodySegWeight.distalShoulderCOM =               0.288*mmHeight;

assert(bodySegWeight.proximalShoulderCOM + bodySegWeight.distalShoulderCOM == 1.000,...
    'ShoulderCOM needs rechecking!')

bodySegWeight.proximalTotalArmCOM =       0.470*mmHeight;
bodySegWeight.distalTotalArmCOM =         0.530*mmHeight;

assert(bodySegWeight.proximalTotalArmCOM + bodySegWeight.distalTotalArmCOM == 1.000,...
    'TotalArmCOM needs rechecking!')

%% Lower extremity proximal and distal weights

bodySegWeight.proximalFootCOM =                 0.500*mmHeight;
bodySegWeight.distalFootCOM =                   0.500*mmHeight;

assert(bodySegWeight.proximalFootCOM + bodySegWeight.distalFootCOM == 1.000,...
    'FootCOM needs rechecking!')

bodySegWeight.proximalLegCOM =                  0.433*mmHeight;
bodySegWeight.distalLegCOM =                    0.567*mmHeight;

assert(bodySegWeight.proximalLegCOM + bodySegWeight.distalLegCOM == 1.000,...
    'LegCOM needs rechecking!')

bodySegWeight.proximalThighCOM =                0.433*mmHeight;
bodySegWeight.distalThighCOM =                  0.567*mmHeight;

assert(bodySegWeight.proximalThighCOM + bodySegWeight.distalThighCOM == 1.000,...
    'ThighCOM needs rechecking!')

bodySegWeight.proximalTotalLegCOM =       0.447*mmHeight;
bodySegWeight.distalTotalLegCOM =         0.553*mmHeight;

assert(bodySegWeight.proximalTotalLegCOM + bodySegWeight.distalTotalLegCOM == 1.000,...
    'TotalLegCOM needs rechecking!')

end

