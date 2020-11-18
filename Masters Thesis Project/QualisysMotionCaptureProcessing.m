%% MATLAB Motion Capture Data Acquisition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Index start and end of gait cycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
if ispc %JSM PC
    codePath = 'C:\Users\jonma\Dropbox\ResearchProjects\GithubDesktop_DontEdit\COMPhaseSpacePlanning';
    dataPath = 'C:\Users\jonma\Google Drive\MotionCaptureProjects\Qualisys_MotionCapture\RevisedWalkingData';
elseif ismac %MT Mac
    %codePath = '/Users/MT/Documents/GitHub/QualisysMotionCapture';
    codePath = '/Users/MT/Documents/GitHub/QualisysMotionCapture/Masters Thesis Project';
    %dataPath = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Qualisys_MotionCapture/RevisedWalkingData';
    dataPath = '/Users/MT/Documents/GitHub/QualisysMotionCapture/Masters Thesis Project/mat_trials';
    %dataPath = '/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Matheus_Qualisys_Walking_Trials/Thesis_Trials/mat_files';
end

cd(codePath)
addpath(genpath(cd))
addpath(dataPath)

%% Experiment Info 
%What is a trial?
total_trials =   3;

%What is a cond
trial_cond =     1;      %req for formatting trial results

for trial_num = 2:total_trials
    %% Initial conditions of data set
    %function locates relevant information based on user name
    %bodyMass should be in kg and height in metric units (mm)
    user_profile = readtable('userProfile.xlsx','readrownames',true);
    [mm_height,kg_mass] = find_user(user_profile,'MFBT'); %Change to initials
    
    %% Load acquired Qualisys MoCap Data
    %fileName = '02_21_2020_Walking_Calibration';
    file_name = strcat('Matheus_ThesisFW0011_Trial',num2str(trial_num),'.mat');
    [marker_labels,marker_mar_dim_frame,Force,num_frames] = load_mo_cap_data(file_name,trial_num);
    
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
    [totalCOM_metrics,trial_start_end,vel_start_end,acc_start_end] = calc_COMXYZ_vel_acc_jerk(total_body_COMXYZ,num_frames);
    
    %% Calibrates seg_center data using trial start and end frames
    [seg_center_cal] = index_seg_center(seg_center,trial_start_end,marker_mar_dim_frame,marker_labels);
    
    %% Calibrates force data using trial start and end frames
    [Force_cal] = index_force(Force,trial_start_end);
    
    %% Calculates marker vel,acc,and jerk for trials
    [head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot] = calc_mar_vel_acc_jerk(seg_center,trial_start_end);
    
    %% Plot head, chest, hip, and feet
    %Create function that plots marker in x,y,z
    plot_mar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trial_num,vel_start_end,acc_start_end);
    
    %% Identify heel strike and toe off in gait cycle
    [LFoot_HS,LFoot_TO,RFoot_HS,RFoot_TO] = locate_TO_HS(LFoot,RFoot);
    
    %% Index steps through kinematic chain
    all_HS = sort([LFoot_HS RFoot_HS]);
    [head_steps,chest_steps,hip_steps,LThigh_steps,RThigh_steps,LLeg_steps,RLeg_steps,LFoot_steps,RFoot_steps] = kin_chain_steps(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS);
    
%     %% Plot head, chest, hip, and feet
%     %Create function that plots marker in x,y,z
%     plotMar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trial_num,vel_start_end,acc_start_end);
    
end
% %% Calculates lower extremity seg length
% % units converted from mm to m
% [bodySegLength] = calcBodySegLength(marker_mar_dim_frame,markerLabels,seg_center);

%% Code to be developed
%     %% Calculates the inst. angle for lower extremity joint
% [segTheta] = calcSegAngle(marker_mar_dim_frame,markerLabels,seg_center);

%     %% calcRadiusOfGyration function
%     % Function outputs radius of gyration for body segs
%     % units in m
%     [radGyra] = calcRadiusOfGyration(bodySegLength);

%     %% calcRadiusOfGyration function
%     % Function outputs radius of gyration for body segs in units of kg/m^2
%     [momInertia] = calcMomentOfInertia(body_seg_weight,bodySegLength,radGyra);
%
%     %% Calculates the inst. angular velocity of the lower extremity
%     % [segOmega,segAlpha] = calcThetaVel(segTheta);

%% Plot force plate data
%plotForces(Force_cal,seg_center_cal)
 
%b=3; %Unknown use
%% calcMarVel function
% Function outputs relative velocity of each body seg
% Currently not optimized yet for plotting purposes
%[seg_centerVel] = calcMarVel(seg_center);

%% Optimizer finds location of jont center
% [error] = JointCenterError(seg_center);

% optimizer(seg_center,marker_mar_dim_frame,markerLabels);

% %% Motion capture data plot
% %Miscellaneous numbering of figures important for future reference
% f = figure(45000);
% %facilitates output of figures across multiple mediums
% f.Units = 'normalized';
% f.Position = [-0.0042 0.4306 0.9401 0.4741];
% 
% %Create video with frames
% % stepA = VideoWriter('TotalCOM_MotionCapture.mp4');
% % open(stepA);
% 
% %for frames 1:numFrames at interval of 10
% for fr = 1:10:num_frames
%     %Clear current frame
%     clf
% 
%     %Plot all markers in x,y, and z
%     plot3(marker_mar_dim_frame(:, 1, fr),...
%         marker_mar_dim_frame(:, 2, fr),...
%         marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
%     
%     %Hold on for next set of plotting instructions
%     hold on
%     
%     %% Total Body COM in 3D
%     %plot of total anatomical COM
%     plot3(totalCOMXYZ(1,fr),...
%         totalCOMXYZ(2,fr),...
%         totalCOMXYZ(3,fr),'p','DisplayName','TotalXYZ');
%     hold on
% 
%     %% PlotMoCapTracer function
%     %seg_center is plotted along with the anatomical markers of the subject
% %     plotMoCapTracer(seg_center)
%     
%     %% Plotting parameters
%     axis equal
%     grid on
%     legend
%     
%     %optimal x y z graph limits 
%     xlim([0 2e3])
%     ylim([-5e3 10e3]) %full lab
% %    ylim([1e3 3e3]) %smaller space
%     zlim([0 3e3])
%     
%     %unsure of what this section XYZs
%     az = -84.362;
%     el =  20.417;
%     view(az,el)
%     
%     drawnow
%     
%     %Middle of video acquisition code
% %     frame = getframe(gcf);
% %     writeVideo(stepA,frame);
%     
% end

%End of video acquisition code
% close(stepA)
