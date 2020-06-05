function [markerLabels,numMarkers,pre_filter_marker_mar_dim_frame,marker_mar_dim_frame,Force] ... 
    = loadMoCapData(fileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load acquired motion capture data
%load file type of fileName and store into data variable
data = load([fileName '.mat']);

%strrep replaces substring of fileName with consistent naming convention
data = data.(['qtm_' strrep(fileName, '-', '_')]);

%% Initial conditions
Force = [];
order = 4;
cutoff = 7;
numFrames = data.Frames;
moCap_framerate = data.FrameRate;
forceplate_framerate = data.Force.Frequency;

%% Data restructuring
pre_filter_marker_mar_dim_frame = data.Trajectories.Labeled.Data;
% [marker_mar_dim_frame] = butterLowZero(order, cutoff, forceplate_framerate, marker_mar_dim_frameRAW);
markerLabels = data.Trajectories.Labeled.Labels;
numMarkers = data.Trajectories.Labeled.Count;

%% Data filtering
for ii = 2:numMarkers
    select_marker =     pre_filter_marker_mar_dim_frame(ii,:,:);
    squeeze_marker =    squeeze(select_marker);
    for jj = 1:3
%         select_dim =    select_marker(jj,:);
        [select_dim] = butterLowZero(order, cutoff, moCap_framerate, squeeze_marker(jj,:));
        filteredData(jj,:) = select_dim;
    end
    marker_mar_dim_frame(ii,:,:) = filteredData;
%     marker_mar_dim_frame = marker_mar_dim_frame;
end    
    
%% Filter acquired force plate data
%Final force plate data
Force.force_plate1 = data.Force(1).Force;
Force.force_plate2 = data.Force(2).Force;
Force.force_plate3 = data.Force(3).Force;
Force.force_plate4 = data.Force(4).Force;
Force.force_plate5 = data.Force(5).Force;

end

