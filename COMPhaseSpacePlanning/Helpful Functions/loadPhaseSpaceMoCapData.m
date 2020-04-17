function [data,startFrames,numFrames,framerate,markerLabels,marker_mar_dim_frame,comXYZ] ... 
    = loadPhaseSpaceMoCapData(fileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadPhaseSpaceMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load file based on fileName
data = load([fileName '.mat']);

%% Extract variables from data and put into struct

startFrames = data.startFrame;
% endFrames = data.endFrame;
numFrames = data.endFrame;  % - startFrames;
framerate = data.c3dData.framerate;
markerLabels = (data.c3dData.markerNames).';
marker_mar_dim_frame = permute(data.c3d_fr_mar_dim,[2,3,1]);     %major data set
comXYZ = permute(data.comXYZ, [2,1]);   %load com of points

% unknownID = 8;
% unknownID = squeeze(marker_mar_dim_frame(unknownID, 1:3, :)); %(nanmean


%% Modifications to be done 
% function [collectedData] ... 
%     = loadPhaseSpaceMoCapData(fileName)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %loadPhaseSpaceMoCapData outputs various variables from the file name 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% Load file based on fileName
% collectedData.data = load([fileName '.mat']);
% 
% %% Extract variables from data and put into struct
% 
% collectedData.startFrames = data.startFrame;
% % endFrames = data.endFrame;
% collectedData.numFrames = data.endFrame;  % - startFrames;
% collectedData.framerate = data.c3dData.framerate;
% collectedData.markerLabels = (data.c3dData.markerNames).';
% collectedData.marker_mar_dim_frame = permute(data.c3d_fr_mar_dim,[2,3,1]);     %major data set
% collectedData.comXYZ = permute(data.comXYZ, [2,1]);   %load com of points

end
