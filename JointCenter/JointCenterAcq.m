%% Master Script for Joint Center Calc for individual trials
clc
clear all
close all
if ispc %JSM PC
    code_path = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    data_path = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\Qualisys_MotionCapture\RevisedWalkingData';
elseif ismac %MT Mac
    code_path = '/Users/MT/Documents/GitHub/QualisysMotionCapture';
    data_path = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Qualisys_MotionCapture/RevisedWalkingData'; %/Qualisys_MotionCapture'
end

cd(code_path)
addpath(genpath(cd))
addpath(data_path)

%% Load Qualisys skeleton data
% skeleton_file = fullfile(data_path,'2020-03-04_JSM_TPose_s_Jon.tsv');
% [skeleton] = import_tsv_file(skeleton_file);
% save('TPose_skeleton_data.mat','skeleton');
%Acquire data from walking calibration test

%% Load Qualisys MoCap Data
% tsv_skeleton_file = '2020-03-04_JSM_TPose_s_Jon';
file_name = '02_21_2020_Walking_Calibration';
% fileName = '2020-03-04_JSM_TPose';
load('externalData.mat');
[markerLabels,marker_mar_dim_frame,Force] = loadMoCapData(file_name);

%% Index markers and segCenters using MoCap data
[segCenter] = indexMars_Segs(marker_mar_dim_frame,markerLabels,trial_start_end);

%% Function optimizes joint center location
[jointCenters] = jointCenterOpt(segCenter);
