function [markerLabels,marker_mar_dim_frame,Force,moCap_frame_rate] = loadMoCapData(file_name)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load acquired motion capture data
%load file type of fileName and store into data variable
data = load([file_name '.mat']);

%strrep replaces substring of fileName with consistent naming convention
%data = data.(['qtm_' strrep(file_name, '-', '_')]);

%% Initial conditions
Force =     [];
order =     4;
cutoff =    7;
numFrames = data.Matheus_ThesisFW0011_Trial_1.Frames;
moCap_frame_rate = data.Matheus_ThesisFW0011_Trial_1.FrameRate;
forceplate_framerate = data.Matheus_ThesisFW0011_Trial_1.Force.Frequency;

%% Data restructuring
pre_filter_marker_mar_dim_frame = data.Matheus_ThesisFW0011_Trial_1.Trajectories.Labeled.Data(:,1:3,:);
% [marker_mar_dim_frame] = butterLowZero(order, cutoff, forceplate_framerate, marker_mar_dim_frameRAW);
markerLabels = data.Matheus_ThesisFW0011_Trial_1.Trajectories.Labeled.Labels;
numMarkers = length(markerLabels);

%Function here should ID which marker has a discrepancy in it. Upon doing
%so the markers data would be filled with the fillmissing function

%% Identify missing data in trial data
[pre_filter_marker_mar_dim_frame] = locMissingData(pre_filter_marker_mar_dim_frame,markerLabels,numMarkers);

%% Data filtering
for ii = 1:numMarkers
    select_marker =             pre_filter_marker_mar_dim_frame(ii,:,:);
    squeeze_marker =            squeeze(select_marker);
    for jj = 1:3
%         select_dim =    select_marker(jj,:);
        [select_dim] =          butterLowZero(order, cutoff, moCap_frame_rate, squeeze_marker(jj,:));
        filteredData(jj,:) =    select_dim;
    end
    marker_mar_dim_frame(ii,:,:) = filteredData;
%     marker_mar_dim_frame = marker_mar_dim_frame;
end    
    
%% Filter acquired force plate data
%Final force plate data

if length(data.Matheus_ThesisFW0011_Trial_1.Force(1).Force) ~= length(filteredData)
    raw_force1 = data.Matheus_ThesisFW0011_Trial_1.Force(1).Force;
    Force.force_plate1(1,:) = raw_force1(1,1:4:end);
    Force.force_plate1(2,:) = raw_force1(2,1:4:end);
    Force.force_plate1(3,:) = raw_force1(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(2).Force) ~= length(filteredData)
    raw_force2 = data.Matheus_ThesisFW0011_Trial_1.Force(2).Force;
    Force.force_plate2(1,:) = raw_force2(1,1:4:end);
    Force.force_plate2(2,:) = raw_force2(2,1:4:end);
    Force.force_plate2(3,:) = raw_force2(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(3).Force) ~= length(filteredData)
    raw_force3 = data.Matheus_ThesisFW0011_Trial_1.Force(3).Force;
    Force.force_plate3(1,:) = raw_force3(1,1:4:end);
    Force.force_plate3(2,:) = raw_force3(2,1:4:end);
    Force.force_plate3(3,:) = raw_force3(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(4).Force) ~= length(filteredData)
    raw_force4 = data.Matheus_ThesisFW0011_Trial_1.Force(4).Force;
    Force.force_plate4(1,:) = raw_force4(1,1:4:end);
    Force.force_plate4(2,:) = raw_force4(2,1:4:end);
    Force.force_plate4(3,:) = raw_force4(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(5).Force) ~= length(filteredData)
    raw_force5 = data.Matheus_ThesisFW0011_Trial_1.Force(5).Force;
    Force.force_plate5(1,:) = raw_force5(1,1:4:end);
    Force.force_plate5(2,:) = raw_force5(2,1:4:end);
    Force.force_plate5(3,:) = raw_force5(3,1:4:end);
end

%% Force plate cartisian locations
Force.force_plate1_loc = data.Matheus_ThesisFW0011_Trial_1.Force(1).ForcePlateLocation;
Force.force_plate2_loc = data.Matheus_ThesisFW0011_Trial_1.Force(2).ForcePlateLocation;
Force.force_plate3_loc = data.Matheus_ThesisFW0011_Trial_1.Force(3).ForcePlateLocation;
Force.force_plate4_loc = data.Matheus_ThesisFW0011_Trial_1.Force(4).ForcePlateLocation;
Force.force_plate5_loc = data.Matheus_ThesisFW0011_Trial_1.Force(5).ForcePlateLocation;

%% Filter acquired COP force plate data
%Final COP force plate data

if length(data.Matheus_ThesisFW0011_Trial_1.Force(1).COP) ~= length(filteredData)
    raw_COP1 = data.Matheus_ThesisFW0011_Trial_1.Force(1).COP;
    Force.COP_plate1(1,:) = raw_COP1(1,1:4:end);
    Force.COP_plate1(2,:) = raw_COP1(2,1:4:end);
    Force.COP_plate1(3,:) = raw_COP1(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(2).COP) ~= length(filteredData)
    raw_COP2 = data.Matheus_ThesisFW0011_Trial_1.Force(2).COP;
    Force.COP_plate2(1,:) = raw_COP2(1,1:4:end);
    Force.COP_plate2(2,:) = raw_COP2(2,1:4:end);
    Force.COP_plate2(3,:) = raw_COP2(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(3).COP) ~= length(filteredData)
    raw_COP3 = data.Matheus_ThesisFW0011_Trial_1.Force(3).COP;
    Force.COP_plate3(1,:) = raw_COP3(1,1:4:end);
    Force.COP_plate3(2,:) = raw_COP3(2,1:4:end);
    Force.COP_plate3(3,:) = raw_COP3(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(4).COP) ~= length(filteredData)
    raw_COP4 = data.Matheus_ThesisFW0011_Trial_1.Force(4).COP;
    Force.COP_plate4(1,:) = raw_COP4(1,1:4:end);
    Force.COP_plate4(2,:) = raw_COP4(2,1:4:end);
    Force.COP_plate4(3,:) = raw_COP4(3,1:4:end);
end

if length(data.Matheus_ThesisFW0011_Trial_1.Force(5).COP) ~= length(filteredData)
    raw_COP5 = data.Matheus_ThesisFW0011_Trial_1.Force(5).COP;
    Force.COP_plate5(1,:) = raw_COP5(1,1:4:end);
    Force.COP_plate5(2,:) = raw_COP5(2,1:4:end);
    Force.COP_plate5(3,:) = raw_COP5(3,1:4:end);
end
end

