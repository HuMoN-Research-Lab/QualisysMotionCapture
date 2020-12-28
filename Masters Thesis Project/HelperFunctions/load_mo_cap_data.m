function [marker_labels,marker_mar_dim_frame,num_frames] = load_mo_cap_data(file_name,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loads data from .mat Qualisys motion capture file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load acquired motion capture data
% file_name loaded then extracted using eval func into struct data
load(file_name);
data = eval(strcat('Matheus_ThesisFW001_Trial',num2str(trial_num)));

%strrep replaces substring of fileName with consistent naming convention
%data = data.(['qtm_' strrep(file_name, '-', '_')]);

%% Initial conditions for data analysis
Force =     [];
order =     4;
cutoff =    7;
num_frames = data.Frames;
moCap_frame_rate = data.FrameRate;
%forceplate_framerate = data.Force.Frequency;

%% Data restructuring
pre_filter_marker_mar_dim_frame = data.Trajectories.Labeled.Data(:,1:3,:);
marker_labels = data.Trajectories.Labeled.Labels;
numMarkers = length(marker_labels); % ids num of markers used

%% Identify missing data in trial data
[pre_filter_marker_mar_dim_frame] = loc_missing_data(pre_filter_marker_mar_dim_frame,marker_labels,numMarkers);

%% Data filtering
% butterworth filter used to filter raw data from file_name
for ii = 1:numMarkers
    select_marker =             pre_filter_marker_mar_dim_frame(ii,:,:);
    squeeze_marker =            squeeze(select_marker);
    for jj = 1:3
        [select_dim] =          butterLowZero(order, cutoff, moCap_frame_rate, squeeze_marker(jj,:));
        filtered_data(jj,:) =    select_dim;
    end
    marker_mar_dim_frame(ii,:,:) = filtered_data;
end    
    
%% Restructuring of filtered force plate data
% Force plate frame rate (1200Hz) synced with MoCap system (300Hz)
if length(data.Force(1).Force) ~= length(filtered_data)
    raw_force1 = data.Force(1).Force;
    Force.force_plate1(1,:) = raw_force1(1,1:4:end);
    Force.force_plate1(2,:) = raw_force1(2,1:4:end);
    Force.force_plate1(3,:) = raw_force1(3,1:4:end);
end

if length(data.Force(2).Force) ~= length(filtered_data)
    raw_force2 = data.Force(2).Force;
    Force.force_plate2(1,:) = raw_force2(1,1:4:end);
    Force.force_plate2(2,:) = raw_force2(2,1:4:end);
    Force.force_plate2(3,:) = raw_force2(3,1:4:end);
end

if length(data.Force(3).Force) ~= length(filtered_data)
    raw_force3 = data.Force(3).Force;
    Force.force_plate3(1,:) = raw_force3(1,1:4:end);
    Force.force_plate3(2,:) = raw_force3(2,1:4:end);
    Force.force_plate3(3,:) = raw_force3(3,1:4:end);
end

if length(data.Force(4).Force) ~= length(filtered_data)
    raw_force4 = data.Force(4).Force;
    Force.force_plate4(1,:) = raw_force4(1,1:4:end);
    Force.force_plate4(2,:) = raw_force4(2,1:4:end);
    Force.force_plate4(3,:) = raw_force4(3,1:4:end);
end

if length(data.Force(5).Force) ~= length(filtered_data)
    raw_force5 = data.Force(5).Force;
    Force.force_plate5(1,:) = raw_force5(1,1:4:end);
    Force.force_plate5(2,:) = raw_force5(2,1:4:end);
    Force.force_plate5(3,:) = raw_force5(3,1:4:end);
end

%% Force plate cartesian locations
Force.force_plate1_loc = data.Force(1).ForcePlateLocation;
Force.force_plate2_loc = data.Force(2).ForcePlateLocation;
Force.force_plate3_loc = data.Force(3).ForcePlateLocation;
Force.force_plate4_loc = data.Force(4).ForcePlateLocation;
Force.force_plate5_loc = data.Force(5).ForcePlateLocation;

%% Restructuring of filtered COP force plate data
% Force plate frame rate (1200Hz) synced with MoCap system (300Hz)
if length(data.Force(1).COP) ~= length(filtered_data)
    raw_COP1 = data.Force(1).COP;
    Force.COP_plate1(1,:) = raw_COP1(1,1:4:end);
    Force.COP_plate1(2,:) = raw_COP1(2,1:4:end);
    Force.COP_plate1(3,:) = raw_COP1(3,1:4:end);
end

if length(data.Force(2).COP) ~= length(filtered_data)
    raw_COP2 = data.Force(2).COP;
    Force.COP_plate2(1,:) = raw_COP2(1,1:4:end);
    Force.COP_plate2(2,:) = raw_COP2(2,1:4:end);
    Force.COP_plate2(3,:) = raw_COP2(3,1:4:end);
end

if length(data.Force(3).COP) ~= length(filtered_data)
    raw_COP3 = data.Force(3).COP;
    Force.COP_plate3(1,:) = raw_COP3(1,1:4:end);
    Force.COP_plate3(2,:) = raw_COP3(2,1:4:end);
    Force.COP_plate3(3,:) = raw_COP3(3,1:4:end);
end

if length(data.Force(4).COP) ~= length(filtered_data)
    raw_COP4 = data.Force(4).COP;
    Force.COP_plate4(1,:) = raw_COP4(1,1:4:end);
    Force.COP_plate4(2,:) = raw_COP4(2,1:4:end);
    Force.COP_plate4(3,:) = raw_COP4(3,1:4:end);
end

if length(data.Force(5).COP) ~= length(filtered_data)
    raw_COP5 = data.Force(5).COP;
    Force.COP_plate5(1,:) = raw_COP5(1,1:4:end);
    Force.COP_plate5(2,:) = raw_COP5(2,1:4:end);
    Force.COP_plate5(3,:) = raw_COP5(3,1:4:end);
end
end

