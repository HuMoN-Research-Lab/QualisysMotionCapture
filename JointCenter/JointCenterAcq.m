%% Master Script for Joint Center Calc for individual trials
clc
clear all
close all
if ispc %JSM PC
    codePath = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    dataPath = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\Qualisys_MotionCapture\RevisedWalkingData';
elseif ismac %MT Mac
    codePath = '/Users/MT/Documents/GitHub/QualisysMotionCapture';
    dataPath = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Qualisys_MotionCapture/RevisedWalkingData'; %/Qualisys_MotionCapture'
end

cd(codePath)
addpath(genpath(cd))
addpath(dataPath)

%% Load acquired Qualisys MoCap Data
fileName = '02_21_2020_Walking_Calibration';
% fileName = '2020-03-04_JSM_TPose';
load('externalData.mat');
[markerLabels,marker_mar_dim_frame,Force] = loadMoCapData(fileName);

%% Index markers and segCenters using MoCap data
[segCenter] = indexMars_Segs(marker_mar_dim_frame,markerLabels,trial_start_end);

%% Function optimizes joint center location
[jointCenters] = jointCenterOpt(segCenter);
