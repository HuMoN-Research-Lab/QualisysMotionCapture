function [numFrames,framerate,markerLabels,numMarkers,marker_mar_dim_frame] ... 
    = loadMoCapData(fileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load acquired motion capture data
% fileName = '2020-02-04_JSM_Walking0001';
% %fileName = '2020-02-04_JSM_Slackline0006';

%load file type of fileName and store into data variable
data  = load([fileName '.mat']);

%strrep replaces substring of fileName with consistent naming convention
data = data.(['qtm_' strrep(fileName, '-', '_')]);

%store force plate, frame number, and frame rate values into vars
%numForcePlates = length(data.Force);
numFrames = data.Frames;
framerate = data.FrameRate;

%stores labeled trajectory data, marker labels, marker numbers into vars
marker_mar_dim_frameRAW = data.Trajectories.Labeled.Data;
markerLabels = data.Trajectories.Labeled.Labels;
numMarkers = data.Trajectories.Labeled.Count;
marker_mar_dim_frame = marker_mar_dim_frameRAW; 

end

