%% Master Script for Joint Center Calc for individual trials
clc
clear all
close all
if ispc %JSM PC
    code_path = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    data_path = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\Qualisys_MotionCapture\RevisedWalkingData';
elseif ismac %MT Mac
    code_path = '/Users/MT/Documents/GitHub/QualisysMotionCapture';
    data_path = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Qualisys_MotionCapture'; %/RevisedWalkingData';
end

cd(code_path)
addpath(genpath(cd))
addpath(data_path)

%% Load Qualisys MoCap Data
file_name = '2020-03-04_JSM_TPose';
% file_name = '02_21_2020_Walking_Calibration';
use_MarkerClusters = true;
% if file_name == '2020-03-04_JSM_TPose'
%     use_MarkerClusters = true;
% end
    
load('externalData.mat');
% load('Walking_skeleton_data.mat');
[markerLabels,marker_mar_dim_frame,Force,frame_rate] = loadMoCapData(file_name);

%% Load Qualisys skeleton data
% file_name = '2020-03-04_JSM_TPose_s_Jon.tsv';
% % file_name = '02_21_2020_Walking_Calibration_s_JSM.tsv';
% skeleton_file = fullfile(data_path,file_name);
% [skeleton_mar_dim_frame,skeleton_seg_names] = import_tsv_file(skeleton_file,frame_rate);
% save('Walking_skeleton_data.mat','skeleton_mar_dim_frame');
% save('skeleton_seg_names.mat','skeleton_seg_names');

%% Index markers and segCenters using MoCap data
load('Walking_skeleton_data.mat');
load('skeleton_seg_names.mat');
[segCenter,skeleton] = indexMars_Segs(marker_mar_dim_frame,markerLabels,skeleton_mar_dim_frame,skeleton_seg_names,trial_start_end,use_MarkerClusters);

%% Function optimizes joint center location
[jointCenters] = jointCenterOpt(segCenter,skeleton,use_MarkerClusters);
