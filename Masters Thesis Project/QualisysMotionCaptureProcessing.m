%% MATLAB Motion Capture Data Acquisition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Master Script for Analyzing Qualisys Motion Capture Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Google Drive File Stream required to connect to data_path

clc
clear all
close all
if ispc
    code_path = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    data_path = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\Qualisys_MotionCapture\RevisedWalkingData';
elseif ismac % data_path used in conjunction w/ master script
    code_path = '/Users/MT/Documents/GitHub/QualisysMotionCapture/Masters Thesis Project';
    data_path = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Matheus_Qualisys_Walking_Trials/Thesis_Trials/mat_files';
end

%Change and add necessary paths to MATLAB workflow
cd(code_path)
addpath(genpath(cd))
addpath(data_path)

%% Experiment Info 
cond1 = 1:47; % Trials 1-48 were free walking (FW) trials
cond2 = 49:100; % Trials 49-100 were landmark (LM) trials
trial_cond = cond1; %req for formatting trial results

for trial_num = trial_cond
    %% Initial conditions of data set
    % Required units: bodyMass(kg), height(mm)
    user_profile = readtable('userProfile.xlsx','readrownames',true); % user profile stored in .xlsx file
    [mm_height,kg_mass] = find_user(user_profile,'MFBT');
    
    %% Load Qualisys MoCap Data
    % file_name(s) iteratively modified and loaded into workflow
    if trial_cond == cond1
        file_name = strcat('Matheus_ThesisFW001_Trial',num2str(trial_num),'.mat');
    elseif trial_cond == cond2
        file_name = strcat('Matheus_Thesis_LM001_Trial',num2str(trial_num),'.mat');
    end
    [marker_labels,marker_mar_dim_frame,num_frames] = load_mo_cap_data(file_name,trial_num);
    
    %% calcBodySegMass function
    % Function outputs mass for individual body segs
    [body_seg_weight,prop_seg_weight] = calc_body_seg_mass(kg_mass);
    
    %% calcSegCOM function
    % Function outputs seg_center considering marker location
    [seg_center] = calc_seg_COM(marker_mar_dim_frame,marker_labels);
    
    %% calcSegWeightCOM function
    % Function outputs totalCOM depending on seg weight
    [total_body_COMXYZ] = calc_seg_weight_COM(seg_center,prop_seg_weight);
    
    %% locEmptySegFrames function
    % Function outputs marker frames evaluation
    [empty_frames] = loc_empty_seg_frames(seg_center,total_body_COMXYZ);
    
    %% calcCOMXYZ_Vel_Acc_Jerk function
    %function outputs vel,acc, and jerk values for totalCOM
    [trial_start_end,vel_start_end,acc_start_end,jerk_start_end,all_markers] = calc_COMXYZ_vel_acc_jerk(total_body_COMXYZ,num_frames,marker_mar_dim_frame,marker_labels);
    
%     %% Calibrates seg_center data using trial start and end frames
%     [seg_center_cal] = index_seg_center(seg_center,trial_start_end,marker_mar_dim_frame,marker_labels);
%     
%     %% Calibrates force data using trial start and end frames
%     [Force_cal] = index_force(Force,trial_start_end);
    
    %% Calculates marker vel,acc,and jerk for trials
    [head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot] = calc_mar_vel_acc_jerk(seg_center,trial_start_end);
    
    %% Plot head, chest, hip, and feet
    %Create function that plots marker in x,y,z
%     plot_mar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trial_num,vel_start_end,acc_start_end,jerk_start_end);
    
    %% Identify heel strike and toe off in gait cycle
    [LFoot_HS,LFoot_TO,RFoot_HS,RFoot_TO] = locate_TO_HS(LFoot,RFoot,trial_num);
    
    %% Index steps through kinematic chain
    all_HS = sort([LFoot_HS RFoot_HS]);
    [avg_num_steps,head_steps,chest_steps,hip_steps,LThigh_steps,RThigh_steps,LLeg_steps,RLeg_steps,LFoot_steps,RFoot_steps] = kin_chain_steps(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS,trial_num);
    
%     traj_kin_chain(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS,trial_num);
    
    %% Extract traj values per trial
    head_trials_vel_traj{trial_num} =      head.marVely;
    head_trials_acc_traj{trial_num} =      head.marAccy;
    head_trials_jerk_traj{trial_num} =     head.marJerky;
    
    chest_trials_vel_traj{trial_num} =     chest.marVely;
    chest_trials_acc_traj{trial_num} =     chest.marAccy;
    chest_trials_jerk_traj{trial_num} =    chest.marJerky;
    
    hip_trials_vel_traj{trial_num} =       hip.marVely;
    hip_trials_acc_traj{trial_num} =       hip.marAccy;
    hip_trials_jerk_traj{trial_num} =      hip.marJerky;
    
    % Thigh values
    LThigh_trials_vel_traj{trial_num} =    LThigh.marVely;
    LThigh_trials_acc_traj{trial_num} =    LThigh.marAccy;
    LThigh_trials_jerk_traj{trial_num} =   LThigh.marJerky;
    RThigh_trials_vel_traj{trial_num} =    RThigh.marVely;
    LThigh_trials_acc_traj{trial_num} =    RThigh.marAccy;
    RThigh_trials_jerk_traj{trial_num} =   RThigh.marJerky;
    
    % Leg values
    LLeg_trials_vel_traj{trial_num} =      LLeg.marVely;
    LLeg_trials_acc_traj{trial_num} =      LLeg.marAccy;
    LLeg_trials_jerk_traj{trial_num} =     LLeg.marJerky;
    RLeg_trials_vel_traj{trial_num} =      RLeg.marVely;
    RLeg_trials_acc_traj{trial_num} =      RLeg.marAccy;
    RLeg_trials_jerk_traj{trial_num} =     RLeg.marJerky;
    
    % Foot values
    LFoot_trials_vel_traj{trial_num} =     LFoot.marVely;
    LFoot_trials_acc_traj{trial_num} =     LFoot.marAccy;
    LFoot_trials_jerk_traj{trial_num} =    LFoot.marJerky;
    LFoot_trials_vel_traj{trial_num} =     RFoot.marVely;
    LFoot_trials_acc_traj{trial_num} =     RFoot.marAccy;
    LFoot_trials_jerk_traj{trial_num} =    RFoot.marJerky;
    
    %% Extract steps_acc and steps_acc values from trials
    trial_avg_num_steps(trial_num) = avg_num_steps;
    
    head_trials_steps_vel(trial_num) =      head_steps(1);
    head_trials_steps_acc(trial_num) =      head_steps(2);
    head_trials_steps_jerk(trial_num) =     head_steps(3);
    
    chest_trials_steps_vel(trial_num) =     chest_steps(1);
    chest_trials_steps_acc(trial_num) =     chest_steps(2);
    chest_trials_steps_jerk(trial_num) =    chest_steps(3);
    
    hip_trials_steps_vel(trial_num) =       hip_steps(1);
    hip_trials_steps_acc(trial_num) =       hip_steps(2);
    hip_trials_steps_jerk(trial_num) =      hip_steps(3);
    
    % Thigh values
    LThigh_trials_steps_vel(trial_num) =    LThigh_steps(1);
    LThigh_trials_steps_acc(trial_num) =    LThigh_steps(2);
    LThigh_trials_steps_jerk(trial_num) =   LThigh_steps(3);
    RThigh_trials_steps_vel(trial_num) =    RThigh_steps(1);
    RThigh_trials_steps_acc(trial_num) =    RThigh_steps(2);
    RThigh_trials_steps_jerk(trial_num) =   RThigh_steps(3);
    
    % Leg values
    LLeg_trials_steps_vel(trial_num) =      LLeg_steps(1);
    LLeg_trials_steps_acc(trial_num) =      LLeg_steps(2);
    LLeg_trials_steps_jerk(trial_num) =     LLeg_steps(3);
    RLeg_trials_steps_vel(trial_num) =      RLeg_steps(1);
    RLeg_trials_steps_acc(trial_num) =      RLeg_steps(2);
    RLeg_trials_steps_jerk(trial_num) =     RLeg_steps(3);
    
    % Foot values
    LFoot_trials_steps_vel(trial_num) =     LFoot_steps(1);
    LFoot_trials_steps_acc(trial_num) =     LFoot_steps(2);
    LFoot_trials_steps_jerk(trial_num) =    LFoot_steps(3);
    RFoot_trials_steps_vel(trial_num) =     RFoot_steps(1);
    RFoot_trials_steps_acc(trial_num) =     RFoot_steps(2);
    RFoot_trials_steps_jerk(trial_num) =    RFoot_steps(3);
    
end

%% Experiment Data Processing
%plot_trial_steps_acc(head_trials_steps_acc,chest_trials_steps_acc,hip_trials_steps_acc,LThigh_trials_steps_acc,RThigh_trials_steps_acc,LLeg_trials_steps_acc,RLeg_trials_steps_acc,LFoot_trials_steps_acc,RFoot_trials_steps_acc,trial_num);

%% Experiment Qualifications
% [head_stats,chest_stats,hip_stats,Thigh_stats,Leg_stats,Foot_stats] = stats_eval_acc_exp(head_trials_steps_acc,chest_trials_steps_acc,hip_trials_steps_acc,LThigh_trials_steps_acc,RThigh_trials_steps_acc,LLeg_trials_steps_acc,RLeg_trials_steps_acc,LFoot_trials_steps_acc,RFoot_trials_steps_acc,trial_num);
% %Take the y position of seg_centers and put them into funcs
% [dataByStepNorm,dataByStepRaw] = splitBySteps(LFoot_trials_acc_traj,all_HS);
% 
% %Use this function to plot the trajectories
% [patchHandle, lineHandle] = shadedErrorBar(xvals, yvals, err);
% % Ploting swooshes without gradient: figure; plot(norm')
% %  example: [patchHandle, lineHandle] = shadedErrorBar(mean(dataByStepNorm),std(dataByStepNorm))
% % change plots characteristics: patchHandle.FaceColor = 'b' , lineHandle.Color = 'k'
% % separate avg acceleration for different segments into quarters


stats_eval_jerk_exp(head_trials_steps_jerk,chest_trials_steps_jerk,hip_trials_steps_jerk,LThigh_trials_steps_jerk,RThigh_trials_steps_jerk,LLeg_trials_steps_jerk,RLeg_trials_steps_jerk,LFoot_trials_steps_jerk,RFoot_trials_steps_jerk,trial_num);

% Analysis of overall experiment
all_trials_steps =      sum(trial_avg_num_steps);
avg_all_trials_steps =  mean(trial_avg_num_steps);
std_all_trials_steps =  std(trial_avg_num_steps);

%% Motion capture data plot
%Miscellaneous numbering of figures important for future reference
f = figure(45000);
%facilitates output of figures across multiple mediums
f.Units = 'normalized';
f.Position = [-0.0042 0.4306 0.9401 0.4741];

%Create video with frames
stepA = VideoWriter('Experiment_Trial_47_Rev02.mp4');
open(stepA);

%for frames 1:numFrames at interval of 10
for fr = 1:10:(num_frames-2)
    %Clear current frame
    clf

    %Plot all markers in x,y, and z
    plot3(marker_mar_dim_frame(:, 1, fr),...
        marker_mar_dim_frame(:, 2, fr),...
        marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    %Hold on for next set of plotting instructions
    hold on
    
    %% Total Body COM in 3D
    %plot of total anatomical COM
    plot3(total_body_COMXYZ(1,fr),...
        total_body_COMXYZ(2,fr),...
        total_body_COMXYZ(3,fr),'p','DisplayName','TotalXYZ');
    hold on

    %% Seg_Center plotting
    %Head and Neck Markers
    plot3(seg_center.headCenter_mar_dim_frame(1,fr),...
        seg_center.headCenter_mar_dim_frame(2,fr),...
        seg_center.headCenter_mar_dim_frame(3,fr),'g.') %,'DisplayName','HeadXYZ');
     
    %Shoulder Markers
    plot3(seg_center.LShoulderCenter_mar_dim_frame(1,fr),...
        seg_center.LShoulderCenter_mar_dim_frame(2,fr),...
        seg_center.LShoulderCenter_mar_dim_frame(3,fr),'g.') %'p','MarkerFaceColor','k') %,'DisplayName','LShoulderXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
    plot3(seg_center.RShoulderCenter_mar_dim_frame(1,fr),...
        seg_center.RShoulderCenter_mar_dim_frame(2,fr),...
        seg_center.RShoulderCenter_mar_dim_frame(3,fr),'g.') %'p','MarkerFaceColor','k')%,'DisplayName','RShoulderXYZ');
    
    %Chest Markers
    plot3(seg_center.chestCenter_mar_dim_frame(1,fr),...
        seg_center.chestCenter_mar_dim_frame(2,fr),...
        seg_center.chestCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','ChestXYZ');
    
    %Arm Markers
    plot3(seg_center.LUpperArmCenter_mar_dim_frame(1,fr),...
        seg_center.LUpperArmCenter_mar_dim_frame(2,fr),...
        seg_center.LUpperArmCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LUpperArmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(seg_center.RUpperArmCenter_mar_dim_frame(1,fr),...
        seg_center.RUpperArmCenter_mar_dim_frame(2,fr),...
        seg_center.RUpperArmCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RUpperArmXYZ');
     
    %Forearm Markers
    plot3(seg_center.LForearmCenter_mar_dim_frame(1,fr),...
        seg_center.LForearmCenter_mar_dim_frame(2,fr),...
        seg_center.LForearmCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LForearmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(seg_center.RForearmCenter_mar_dim_frame(1,fr),...
        seg_center.RForearmCenter_mar_dim_frame(2,fr),...
        seg_center.RForearmCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RForearmXYZ');

    %Hand Markers
    plot3(seg_center.LHandCenter_mar_dim_frame(1,fr),...
        seg_center.LHandCenter_mar_dim_frame(2,fr),...
        seg_center.LHandCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LHandXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(seg_center.RHandCenter_mar_dim_frame(1,fr),...
        seg_center.RHandCenter_mar_dim_frame(2,fr),...
        seg_center.RHandCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RHandXYZ');
    
    %Hip Markers
    plot3(seg_center.hipCenter_mar_dim_frame(1,fr),...
        seg_center.hipCenter_mar_dim_frame(2,fr),...
        seg_center.hipCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','HipXYZ');
    
    %Thigh Markers
    plot3(seg_center.LThighCenter_mar_dim_frame(1,fr),...
        seg_center.LThighCenter_mar_dim_frame(2,fr),...
        seg_center.LThighCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LThighXYZ');
    plot3(seg_center.RThighCenter_mar_dim_frame(1,fr),...
        seg_center.RThighCenter_mar_dim_frame(2,fr),...
        seg_center.RThighCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RThighXYZ');
    
    %Leg Markers
    plot3(seg_center.LLegCenter_mar_dim_frame(1,fr),...
        seg_center.LLegCenter_mar_dim_frame(2,fr),...
        seg_center.LLegCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LLegXYZ');
    plot3(seg_center.RLegCenter_mar_dim_frame(1,fr),...
        seg_center.RLegCenter_mar_dim_frame(2,fr),...
        seg_center.RLegCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RLegXYZ');
     
    %Foot Markers
    plot3(seg_center.LFootCenter_mar_dim_frame(1,fr),...
        seg_center.LFootCenter_mar_dim_frame(2,fr),...
        seg_center.LFootCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','LFootXYZ');
    plot3(seg_center.RFootCenter_mar_dim_frame(1,fr),...
        seg_center.RFootCenter_mar_dim_frame(2,fr),...
        seg_center.RFootCenter_mar_dim_frame(3,fr),'g.') %'p','DisplayName','RFootXYZ');      
    
    %% COM for the all body segments in 3D
    %Plot of middle of human skeleton
%         plot3([seg_center.headCenter_mar_dim_frame(1,fr);seg_center.chestCenter_mar_dim_frame(1,fr);seg_center.hipCenter_mar_dim_frame(1,fr)],...
%             [seg_center.headCenter_mar_dim_frame(2,fr);seg_center.chestCenter_mar_dim_frame(2,fr);seg_center.hipCenter_mar_dim_frame(2,fr)],...
%             [seg_center.headCenter_mar_dim_frame(3,fr);seg_center.chestCenter_mar_dim_frame(3,fr);seg_center.hipCenter_mar_dim_frame(3,fr)],'-k','LineWidth',2)
        plot3([seg_center.headCenter_mar_dim_frame(1,fr);seg_center.chestCenter_mar_dim_frame(1,fr);seg_center.torsoCenter_mar_dim_frame(1,fr);seg_center.hipCenter_mar_dim_frame(1,fr)],...
            [seg_center.headCenter_mar_dim_frame(2,fr);seg_center.chestCenter_mar_dim_frame(2,fr);seg_center.torsoCenter_mar_dim_frame(2,fr);seg_center.hipCenter_mar_dim_frame(2,fr)],...
            [seg_center.headCenter_mar_dim_frame(3,fr);seg_center.chestCenter_mar_dim_frame(3,fr);seg_center.torsoCenter_mar_dim_frame(3,fr);seg_center.hipCenter_mar_dim_frame(3,fr)],'-k','LineWidth',1)        
        hold on
        
        %Right Hip
        plot3([seg_center.hipCenter_mar_dim_frame(1,fr);seg_center.LHipCenter_mar_dim_frame(1,fr)],...
            [seg_center.hipCenter_mar_dim_frame(2,fr);seg_center.LHipCenter_mar_dim_frame(2,fr)],...
            [seg_center.hipCenter_mar_dim_frame(3,fr);seg_center.LHipCenter_mar_dim_frame(3,fr)],'-k','LineWidth',1)
        %Right Hip
        plot3([seg_center.hipCenter_mar_dim_frame(1,fr);seg_center.RHipCenter_mar_dim_frame(1,fr)],...
            [seg_center.hipCenter_mar_dim_frame(2,fr);seg_center.RHipCenter_mar_dim_frame(2,fr)],...
            [seg_center.hipCenter_mar_dim_frame(3,fr);seg_center.RHipCenter_mar_dim_frame(3,fr)],'-k','LineWidth',1)
        
        %Left limb
        plot3([seg_center.neckCenter_mar_dim_frame(1,fr);seg_center.LShoulderCenter_mar_dim_frame(1,fr);seg_center.LUpperArmCenter_mar_dim_frame(1,fr);all_markers.LElbow(1,fr);seg_center.LForearmCenter_mar_dim_frame(1,fr);all_markers.LWristOut(1,fr)],...
            [seg_center.neckCenter_mar_dim_frame(2,fr);seg_center.LShoulderCenter_mar_dim_frame(2,fr);seg_center.LUpperArmCenter_mar_dim_frame(2,fr);all_markers.LElbow(2,fr);seg_center.LForearmCenter_mar_dim_frame(2,fr);all_markers.LWristOut(2,fr)],...
            [seg_center.neckCenter_mar_dim_frame(3,fr);seg_center.LShoulderCenter_mar_dim_frame(3,fr);seg_center.LUpperArmCenter_mar_dim_frame(3,fr);all_markers.LElbow(3,fr);seg_center.LForearmCenter_mar_dim_frame(3,fr);all_markers.LWristOut(3,fr)],'-b','LineWidth',1)
        %Right limb
        plot3([seg_center.neckCenter_mar_dim_frame(1,fr);seg_center.RShoulderCenter_mar_dim_frame(1,fr);seg_center.RUpperArmCenter_mar_dim_frame(1,fr);all_markers.RElbow(1,fr);seg_center.RForearmCenter_mar_dim_frame(1,fr);all_markers.RWristOut(1,fr)],...
            [seg_center.neckCenter_mar_dim_frame(2,fr);seg_center.RShoulderCenter_mar_dim_frame(2,fr);seg_center.RUpperArmCenter_mar_dim_frame(2,fr);all_markers.RElbow(2,fr);seg_center.RForearmCenter_mar_dim_frame(2,fr);all_markers.RWristOut(2,fr)],...
            [seg_center.neckCenter_mar_dim_frame(3,fr);seg_center.RShoulderCenter_mar_dim_frame(3,fr);seg_center.RUpperArmCenter_mar_dim_frame(3,fr);all_markers.RElbow(3,fr);seg_center.RForearmCenter_mar_dim_frame(3,fr);all_markers.RWristOut(3,fr)],'-r','LineWidth',1)
        
        %Plot of right side of human skeleton
        plot3([seg_center.RHipCenter_mar_dim_frame(1,fr);all_markers.RKnee(1,fr);all_markers.RAnkle(1,fr);all_markers.RForefoot(1,fr);all_markers.RToeTip(1,fr)],...
            [seg_center.RHipCenter_mar_dim_frame(2,fr);all_markers.RKnee(2,fr);all_markers.RAnkle(2,fr);all_markers.RForefoot(2,fr);all_markers.RToeTip(2,fr)],...
            [seg_center.RHipCenter_mar_dim_frame(3,fr);all_markers.RKnee(3,fr);all_markers.RAnkle(3,fr);all_markers.RForefoot(3,fr);all_markers.RToeTip(3,fr)],'-r','LineWidth',1)
        %Plot of left side of human skeleton
        plot3([seg_center.LHipCenter_mar_dim_frame(1,fr);all_markers.LKnee(1,fr);all_markers.LAnkle(1,fr);all_markers.LForefoot(1,fr);all_markers.LToeTip(1,fr)],...
            [seg_center.LHipCenter_mar_dim_frame(2,fr);all_markers.LKnee(2,fr);all_markers.LAnkle(2,fr);all_markers.LForefoot(2,fr);all_markers.LToeTip(2,fr)],...
            [seg_center.LHipCenter_mar_dim_frame(3,fr);all_markers.LKnee(3,fr);all_markers.LAnkle(3,fr);all_markers.LForefoot(3,fr);all_markers.LToeTip(3,fr)],'-b','LineWidth',1)
        
        %Upper markers
        plot3(all_markers.HeadL(1,fr),all_markers.HeadL(2,fr),all_markers.HeadL(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.HeadTop(1,fr),all_markers.HeadTop(2,fr),all_markers.HeadTop(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.HeadR(1,fr),all_markers.HeadR(2,fr),all_markers.HeadR(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.HeadFront(1,fr),all_markers.HeadFront(2,fr),all_markers.HeadFront(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.SpineTop(1,fr),all_markers.SpineTop(2,fr),all_markers.SpineTop(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.BackL(1,fr),all_markers.BackL(2,fr),all_markers.BackL(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.BackR(1,fr),all_markers.BackR(2,fr),all_markers.BackR(3,fr),'k.','MarkerSize',5)
        
        %LUpper Markers
        plot3(all_markers.LShoulderTop(1,fr),all_markers.LShoulderTop(2,fr),all_markers.LShoulderTop(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LShoulderBack(1,fr),all_markers.LShoulderBack(2,fr),all_markers.LShoulderBack(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LArm(1,fr),all_markers.LArm(2,fr),all_markers.LArm(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LElbow(1,fr),all_markers.LElbow(2,fr),all_markers.LElbow(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LWristOut(1,fr),all_markers.LWristOut(2,fr),all_markers.LWristOut(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LWristIn(1,fr),all_markers.LWristIn(2,fr),all_markers.LWristIn(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.LHandOut(1,fr),all_markers.LHandOut(2,fr),all_markers.LHandOut(3,fr),'k.','MarkerSize',5)
        
        %RUpper Markers
        plot3(all_markers.RShoulderTop(1,fr),all_markers.RShoulderTop(2,fr),all_markers.RShoulderTop(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RShoulderBack(1,fr),all_markers.RShoulderBack(2,fr),all_markers.RShoulderBack(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RArm(1,fr),all_markers.RArm(2,fr),all_markers.RArm(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RElbow(1,fr),all_markers.RElbow(2,fr),all_markers.RElbow(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RWristOut(1,fr),all_markers.RWristOut(2,fr),all_markers.RWristOut(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RWristIn(1,fr),all_markers.RWristIn(2,fr),all_markers.RWristIn(3,fr),'k.','MarkerSize',5)
        plot3(all_markers.RHandOut(1,fr),all_markers.RHandOut(2,fr),all_markers.RHandOut(3,fr),'k.','MarkerSize',5)
    
%     %% PlotMoCapTracer function
%     %segCenter is plotted along with the anatomical markers of the subject
%     plotMoCapTracer(seg_center,fr)

    %% Plotting parameters
    axis equal
    grid on
    legend('Markers', 'Total Body COM', 'Segment Centers')
    
    %optimal x y z graph limits 
%     xlim([0 1.5e3]) %close up
%     ylim([-1e3 1e3]) %close up
    xlim([-1.5e3 1.5e3]) %close up
    ylim([-1e3 7.5e3]) %full lab
%     ylim([1e3 3e3]) %smaller space
    zlim([0 2e3])
    
%     %right-to-left settings
%     az = -131.9770;
%     el =  12.4620;
    %left-to-right settings
    az = 61.8287;
    el = 13.2156;
    view(az,el)
    
    drawnow
    
    %Middle of video acquisition code
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end
