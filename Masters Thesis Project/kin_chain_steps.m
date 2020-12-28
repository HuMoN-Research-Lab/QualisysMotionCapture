function [avg_num_steps,head_steps,chest_steps,hip_steps,LThigh_steps,RThigh_steps,LLeg_steps,RLeg_steps,LFoot_steps,RFoot_steps] = kin_chain_steps(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function calcs vel and acc per step along kinematic chain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
head_vel =      head.marVely;
head_acc =      head.marAccy;
head_acc_sq =   (head_acc).^2;
head_jerk =     abs(head.marJerky);
head_steps =    [];
chest_vel =     chest.marVely;
chest_acc =     chest.marAccy;
chest_acc_sq =  (chest_acc).^2;
chest_jerk =    abs(chest.marJerky);
chest_steps =   [];
hip_vel =       hip.marVely;
hip_acc =       hip.marAccy;
hip_acc_sq =    (hip_acc).^2;
hip_jerk =      abs(hip.marJerky);
hip_steps =     [];

LThigh_vel =    LThigh.marVely;
LThigh_acc =    LThigh.marAccy;
LThigh_acc_sq = (LThigh_acc).^2;
LThigh_jerk =   abs(LThigh.marJerky);
LThigh_steps =  [];
RThigh_vel =    RThigh.marVely;
RThigh_acc =    RThigh.marAccy;
RThigh_acc_sq = (RThigh_acc).^2;
RThigh_jerk =   abs(RThigh.marJerky);
RThigh_steps =  [];

LLeg_vel =      LLeg.marVely;
LLeg_acc =      LLeg.marAccy;
LLeg_acc_sq =   (LLeg_acc).^2;
LLeg_jerk =     abs(LLeg.marJerky);
LLeg_steps =    [];
RLeg_vel =      RLeg.marVely;
RLeg_acc =      RLeg.marAccy;
RLeg_acc_sq =   (RLeg_acc).^2;
RLeg_jerk =     abs(RLeg.marJerky);
RLeg_steps =    [];

LFoot_vel =     LFoot.marVely;
LFoot_acc =     LFoot.marAccy;
LFoot_acc_sq =  (LFoot_acc).^2;
LFoot_jerk =    abs(LFoot.marJerky);
LFoot_steps =   [];
RFoot_vel =     RFoot.marVely;
RFoot_acc =     RFoot.marAccy;
RFoot_acc_sq =  (RFoot_acc).^2;
RFoot_jerk =    abs(RFoot.marJerky);
RFoot_steps =   [];

%% Head vel and acc per step
%Vel values per step
for step_num = 2:length(all_HS)-2
    head_steps_vel{step_num-1} = head_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 2:length(all_HS)-2
    head_steps_acc{step_num-1} = head_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%Jerk values per step
for step_num = 2:length(all_HS)-2
    head_steps_jerk{step_num-1} = head_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

% %Extra code for determining length of trial
% [r,c] = cellfun(@size,head_steps_vel);
% max_trial_duration = max([r,c]);

%Steps analysis
head_steps_vel_mean =   cellfun(@mean,head_steps_vel);
head_steps_vel_std =    cellfun(@std,head_steps_vel);
head_steps_vel_maxs =   head_steps_vel_mean + head_steps_vel_std;
head_steps_acc_mean =   cellfun(@mean,head_steps_acc);
head_steps_acc_std =    cellfun(@std,head_steps_acc);
head_steps_acc_maxs =   head_steps_acc_mean + head_steps_acc_std;
head_steps_jerk_mean =  cellfun(@mean,head_steps_jerk);
head_steps_jerk_std =   cellfun(@std,head_steps_jerk);
head_steps_jerk_maxs =  head_steps_jerk_mean + head_steps_jerk_std;
head_steps(1) =         mean(head_steps_vel_mean);
head_steps(2) =         mean(head_steps_acc_mean);
head_steps(3) =         mean(head_steps_jerk_mean);
avg_num_steps =         length(head_steps_acc);

%% Chest vel and acc per step
%Vel values per step
for step_num = 2:length(all_HS)-2
    chest_steps_vel{step_num-1} = chest_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 2:length(all_HS)-2
    chest_steps_acc{step_num-1} = chest_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%Jerk values per step
for step_num = 2:length(all_HS)-2
    chest_steps_jerk{step_num-1} = chest_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
chest_steps_vel_mean =      cellfun(@mean,chest_steps_vel);
chest_steps_vel_std =       cellfun(@std,chest_steps_vel);
chest_steps_vel_maxs =      chest_steps_vel_mean + chest_steps_vel_std;
chest_steps_acc_mean =      cellfun(@mean,chest_steps_acc);
chest_steps_acc_std =       cellfun(@std,chest_steps_acc);
chest_steps_acc_maxs =      chest_steps_acc_mean + chest_steps_acc_std;
chest_steps_jerk_mean =     cellfun(@mean,chest_steps_jerk);
chest_steps_jerk_std =      cellfun(@std,chest_steps_jerk);
chest_steps_jerk_maxs =     chest_steps_jerk_mean + chest_steps_jerk_std;
chest_steps(1) =            mean(chest_steps_vel_mean);
chest_steps(2) =            mean(chest_steps_acc_mean);
chest_steps(3) =            mean(chest_steps_jerk_mean);

%% Hip vel and acc per step
%Vel values per step
for step_num = 2:length(all_HS)-2
    hip_steps_vel{step_num-1} = hip_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 2:length(all_HS)-2
    hip_steps_acc{step_num-1} = hip_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%Jerk values per step
for step_num = 2:length(all_HS)-2
    hip_steps_jerk{step_num-1} = hip_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
hip_steps_vel_mean =      cellfun(@mean,hip_steps_vel);
hip_steps_vel_std =       cellfun(@std,hip_steps_vel);
hip_steps_vel_maxs =      hip_steps_vel_mean + hip_steps_vel_std;
hip_steps_acc_mean =      cellfun(@mean,hip_steps_acc);
hip_steps_acc_std =       cellfun(@std,hip_steps_acc);
hip_steps_acc_maxs =      hip_steps_acc_mean + hip_steps_acc_std;
hip_steps_jerk_mean =     cellfun(@mean,hip_steps_jerk);
hip_steps_jerk_std =      cellfun(@std,hip_steps_jerk);
hip_steps_jerk_maxs =     hip_steps_jerk_mean + hip_steps_jerk_std;
hip_steps(1) =            mean(hip_steps_vel_mean);
hip_steps(2) =            mean(hip_steps_acc_mean);
hip_steps(3) =            mean(hip_steps_jerk_mean);

%% Thigh vel and acc per step
%LThigh vel values per step
for step_num = 2:length(all_HS)-2
    LThigh_steps_vel{step_num-1} = LThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LThigh acc values per step
for step_num = 2:length(all_HS)-2
    LThigh_steps_acc{step_num-1} = LThigh_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%LThigh jerk values per step
for step_num = 2:length(all_HS)-2
    LThigh_steps_jerk{step_num-1} = LThigh_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
LThigh_steps_vel_mean =     cellfun(@mean,LThigh_steps_vel);
LThigh_steps_vel_std =      cellfun(@std,LThigh_steps_vel);
LThigh_steps_vel_maxs =     LThigh_steps_vel_mean + LThigh_steps_vel_std;
LThigh_steps_acc_mean =     cellfun(@mean,LThigh_steps_acc);
LThigh_steps_acc_std =      cellfun(@std,LThigh_steps_acc);
LThigh_steps_acc_maxs =     LThigh_steps_acc_mean + LThigh_steps_acc_std;
LThigh_steps_jerk_mean =    cellfun(@mean,LThigh_steps_jerk);
LThigh_steps_jerk_std =     cellfun(@std,LThigh_steps_jerk);
LThigh_steps_jerk_maxs =    LThigh_steps_jerk_mean + LThigh_steps_jerk_std;
LThigh_steps(1) =           mean(LThigh_steps_vel_mean);
LThigh_steps(2) =           mean(LThigh_steps_acc_mean);
LThigh_steps(3) =           mean(LThigh_steps_jerk_mean);

%RThigh vel values per step
for step_num = 2:length(all_HS)-2
    RThigh_steps_vel{step_num-1} = RThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%RThigh acc values per step
for step_num = 2:length(all_HS)-2
    RThigh_steps_acc{step_num-1} = RThigh_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%RThigh jerk values per step
for step_num = 2:length(all_HS)-2
    RThigh_steps_jerk{step_num-1} = RThigh_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
RThigh_steps_vel_mean =     cellfun(@mean,RThigh_steps_vel);
RThigh_steps_vel_std =      cellfun(@std,RThigh_steps_vel);
RThigh_steps_vel_maxs =     RThigh_steps_vel_mean + RThigh_steps_vel_std;
RThigh_steps_acc_mean =     cellfun(@mean,RThigh_steps_acc);
RThigh_steps_acc_std =      cellfun(@std,RThigh_steps_acc);
RThigh_steps_acc_maxs =     RThigh_steps_acc_mean + RThigh_steps_acc_std;
RThigh_steps_jerk_mean =    cellfun(@mean,RThigh_steps_jerk);
RThigh_steps_jerk_std =     cellfun(@std,RThigh_steps_jerk);
RThigh_steps_jerk_maxs =    RThigh_steps_jerk_mean + RThigh_steps_jerk_std;
RThigh_steps(1) =           mean(RThigh_steps_vel_mean);
RThigh_steps(2) =           mean(RThigh_steps_acc_mean);
RThigh_steps(3) =           mean(RThigh_steps_jerk_mean);

%% Leg vel and acc per step
%LLeg vel values per step
for step_num = 2:length(all_HS)-2
    LLeg_steps_vel{step_num-1} = LLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LLeg acc values per step
for step_num = 2:length(all_HS)-2
    LLeg_steps_acc{step_num-1} = LLeg_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%LLeg jerk values per step
for step_num = 2:length(all_HS)-2
    LLeg_steps_jerk{step_num-1} = LLeg_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
LLeg_steps_vel_mean =   cellfun(@mean,LLeg_steps_vel);
LLeg_steps_vel_std =    cellfun(@std,LLeg_steps_vel);
LLeg_steps_vel_maxs =   LLeg_steps_vel_mean + LLeg_steps_vel_std;
LLeg_steps_acc_mean =   cellfun(@mean,LLeg_steps_acc);
LLeg_steps_acc_std =    cellfun(@std,LLeg_steps_acc);
LLeg_steps_acc_maxs =   LLeg_steps_acc_mean + LLeg_steps_acc_std;
LLeg_steps_jerk_mean =  cellfun(@mean,LLeg_steps_jerk);
LLeg_steps_jerk_std =   cellfun(@std,LLeg_steps_jerk);
LLeg_steps_jerk_maxs =  LLeg_steps_jerk_mean + LLeg_steps_jerk_std;
LLeg_steps(1) =         mean(LLeg_steps_vel_mean);
LLeg_steps(2) =         mean(LLeg_steps_acc_mean);
LLeg_steps(3) =         mean(LLeg_steps_jerk_mean);

%RLeg vel values per step
for step_num = 2:length(all_HS)-2
    RLeg_steps_vel{step_num-1} = RLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg acc values per step
for step_num = 2:length(all_HS)-2
    RLeg_steps_acc{step_num-1} = RLeg_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg acc values per step
for step_num = 2:length(all_HS)-2
    RLeg_steps_jerk{step_num-1} = RLeg_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
RLeg_steps_vel_mean =   cellfun(@mean,RLeg_steps_vel);
RLeg_steps_vel_std =    cellfun(@std,RLeg_steps_vel);
RLeg_steps_vel_maxs =   RLeg_steps_vel_mean + RLeg_steps_vel_std;
RLeg_steps_acc_mean =   cellfun(@mean,RLeg_steps_acc);
RLeg_steps_acc_std =    cellfun(@std,RLeg_steps_acc);
RLeg_steps_acc_maxs =   RLeg_steps_acc_mean + RLeg_steps_acc_std;
RLeg_steps_jerk_mean =  cellfun(@mean,RLeg_steps_jerk);
RLeg_steps_jerk_std =   cellfun(@std,RLeg_steps_jerk);
RLeg_steps_jerk_maxs =  RLeg_steps_jerk_mean + RLeg_steps_jerk_std;
RLeg_steps(1) =         mean(RLeg_steps_vel_mean);
RLeg_steps(2) =         mean(RLeg_steps_acc_mean);
RLeg_steps(3) =         mean(RLeg_steps_jerk_mean);

%% Foot vel and acc per step
%LFoot vel values per step
for step_num = 2:length(all_HS)-2
    LFoot_steps_vel{step_num-1} = LFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LFoot acc values per step
for step_num = 2:length(all_HS)-2
    LFoot_steps_acc{step_num-1} = LFoot_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%LFoot jerk values per step
for step_num = 2:length(all_HS)-2
    LFoot_steps_jerk{step_num-1} = LFoot_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
LFoot_steps_vel_mean =      cellfun(@mean,LFoot_steps_vel);
LFoot_steps_vel_std =       cellfun(@std,LFoot_steps_vel);
LFoot_steps_vel_maxs =      LFoot_steps_vel_mean + LFoot_steps_vel_std;
LFoot_steps_acc_mean =      cellfun(@mean,LFoot_steps_acc);
LFoot_steps_acc_std =       cellfun(@std,LFoot_steps_acc);
LFoot_steps_acc_maxs =      LFoot_steps_acc_mean + LFoot_steps_acc_std;
LFoot_steps_jerk_mean =     cellfun(@mean,LFoot_steps_jerk);
LFoot_steps_jerk_std =      cellfun(@std,LFoot_steps_jerk);
LFoot_steps_jerk_maxs =     LFoot_steps_jerk_mean + LFoot_steps_jerk_std;
LFoot_steps(1) =            mean(LFoot_steps_vel_mean);
LFoot_steps(2) =            mean(LFoot_steps_acc_mean);
LFoot_steps(3) =            mean(LFoot_steps_jerk_mean);

%RFoot vel values per step
for step_num = 2:length(all_HS)-2
    RFoot_steps_vel{step_num-1} = RFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg acc values per step
for step_num = 2:length(all_HS)-2
    RFoot_steps_acc{step_num-1} = RFoot_acc_sq(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg jerk values per step
for step_num = 2:length(all_HS)-2
    RFoot_steps_jerk{step_num-1} = RFoot_jerk(all_HS(step_num):all_HS(step_num+1)-1);
end

%Steps analysis
RFoot_steps_vel_mean =      cellfun(@mean,RFoot_steps_vel);
RFoot_steps_vel_std =       cellfun(@std,RFoot_steps_vel);
RFoot_steps_vel_maxs =      RFoot_steps_vel_mean + RFoot_steps_vel_std;
RFoot_steps_acc_mean =      cellfun(@mean,RFoot_steps_acc);
RFoot_steps_acc_std =       cellfun(@std,RFoot_steps_acc);
RFoot_steps_acc_maxs =      RFoot_steps_acc_mean + RFoot_steps_acc_std;
RFoot_steps_jerk_mean =     cellfun(@mean,RFoot_steps_jerk);
RFoot_steps_jerk_std =      cellfun(@std,RFoot_steps_jerk);
RFoot_steps_jerk_maxs =     RFoot_steps_jerk_mean + RFoot_steps_jerk_std;
RFoot_steps(1) =            mean(RFoot_steps_vel_mean);
RFoot_steps(2) =            mean(RFoot_steps_acc_mean);
RFoot_steps(3) =            mean(RFoot_steps_jerk_mean);

% time_between_steps = diff(all_HS)/300;
%     for step_num = 1:length(all_HS)-1
%         comX_per_step{step_num} = comX(all_HS(step_num):all_HS(step_num+1)-1);
%     end
%     mean_step_comX = cellfun(@mean, comX_per_step);
%     std_step_comX = cellfun(@std, comX_per_step);
    
%% Vel figures for troubleshooting
% Figure conditions/parameters
plot_step_vel = false;
num_steps = length(head_steps_vel); %x_values = num_steps

%Max limits for figures
ytorso_vel_max = max(cellfun(@max,hip_steps_vel));
yLFeet_vel_max = max(cellfun(@max,LFoot_steps_vel));
yRFeet_vel_max = max(cellfun(@max,RFoot_steps_vel));

if yLFeet_vel_max > yRFeet_vel_max
    yFeet_max = yLFeet_vel_max;
elseif yLFeet_vel_max < yRFeet_vel_max
    yFeet_max = yRFeet_vel_max;
end

%Min limits for figures
ytorso_vel_min =    0;
yFeet_vel_min =     0;

% ytorso_min = min(cellfun(@min,hip_steps_vel));
% yLFeet_min = min(cellfun(@min,LFoot_steps_vel));
% yRFeet_min = min(cellfun(@min,RFoot_steps_vel));
% 
% if yLFeet_min < yRFeet_min
%     yFeet_min = yLFeet_min;
% elseif yLFeet_min > yRFeet_min
%     yFeet_min = yRFeet_min;
% end

if plot_step_vel == true
    %head marker coordinates
    figure(trial_num)
    subplot(3,2,1)
    bar(1:num_steps,head_steps_vel_mean,'c') %timestamp addition before head. give time in seconds
    hold on
    errorbar(1:num_steps,head_steps_vel_mean,head_steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %chest marker coordinates
    subplot(3,2,3)
    bar(1:num_steps,chest_steps_vel_mean,'c')
    hold on
    errorbar(1:num_steps,chest_steps_vel_mean,chest_steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]);
    title('Chest')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %hip marker coordinates
    subplot(3,2,5)
    bar(1:num_steps,hip_steps_vel_mean,'c')
    hold on
    errorbar(1:num_steps,hip_steps_vel_mean,hip_steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]);
    title('Hip')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    bar(1:num_steps,LThigh_steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LThigh_steps_vel_mean,LThigh_steps_vel_std,'p')
    bar(1:num_steps,RThigh_steps_vel_mean,'r')
    errorbar(1:num_steps,RThigh_steps_vel_mean,RThigh_steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LThigh & RThigh')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    bar(1:num_steps,LLeg_steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LLeg_steps_vel_mean,LLeg_steps_vel_std,'p')
    bar(1:num_steps,RLeg_steps_vel_mean,'r')
    errorbar(1:num_steps,RLeg_steps_vel_mean,RLeg_steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LShank & RShank')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    bar(1:num_steps,LFoot_steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LFoot_steps_vel_mean,LFoot_steps_vel_std,'p')
    bar(1:num_steps,RFoot_steps_vel_mean,'r')
    errorbar(1:num_steps,RFoot_steps_vel_mean,RFoot_steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LFoot & RFoot')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
end

%% Acc figures for troubleshooting
% Figure conditions/parameters
plot_step_acc = false;
num_steps = length(head_steps_acc); %x_values = num_steps

%Max limits for figures
yhead_acc_max =     max(head_steps_acc_maxs)+ max(head_steps_acc_maxs)*0.25;
ychest_acc_max =    max(chest_steps_acc_maxs)+ max(chest_steps_acc_maxs)*0.25;
yhip_acc_max =      max(hip_steps_acc_maxs)+ max(hip_steps_acc_maxs)*0.25; %max(cellfun(@max,hip_steps_acc));
yLThigh_acc_max =   max(LThigh_steps_acc_maxs) + max(LThigh_steps_acc_maxs)*0.25; 
yRThigh_acc_max =   max(RThigh_steps_acc_maxs) + max(RThigh_steps_acc_maxs)*0.25; 
yLLeg_acc_max =     max(LLeg_steps_acc_maxs) + max(LLeg_steps_acc_maxs)*0.25;
yRLeg_acc_max =     max(RLeg_steps_acc_maxs) + max(RLeg_steps_acc_maxs)*0.25;
yLFeet_acc_max =    max(LFoot_steps_acc_maxs); %max(cellfun(@max,LFoot_steps_acc));
yRFeet_acc_max =    max(RFoot_steps_acc_maxs); %max(cellfun(@max,RFoot_steps_acc));

%yThigh_acc_max calc
if yLThigh_acc_max > yRThigh_acc_max
    yThigh_acc_max = yLThigh_acc_max + yLThigh_acc_max*0.25;
elseif yLThigh_acc_max < yRThigh_acc_max
    yThigh_acc_max = yRThigh_acc_max + yRThigh_acc_max*0.25;
end

%yLeg_acc_max calc
if yLLeg_acc_max > yRLeg_acc_max
    yLeg_acc_max = yLLeg_acc_max + yLLeg_acc_max*0.25;
elseif yLLeg_acc_max < yRLeg_acc_max
    yLeg_acc_max = yRLeg_acc_max + yRLeg_acc_max*0.25;
end

%yFeet_acc_max calc
if yLFeet_acc_max > yRFeet_acc_max
    yFeet_acc_max = yLFeet_acc_max + yLFeet_acc_max*0.25;
elseif yLFeet_acc_max < yRFeet_acc_max
    yFeet_acc_max = yRFeet_acc_max + yRFeet_acc_max*0.25;
end

%Min limits for figures
% yhead_acc_min =     min(head_steps_acc_mean);
yhead_acc_min =     min(head_steps_acc_mean) - max(head_steps_acc_std);
ychest_acc_min =    min(chest_steps_acc_mean);
yhip_acc_min =      min(hip_steps_acc_mean);

%yThigh_acc_min calc
yLThigh_acc_min =    min(LThigh_steps_acc_mean);
yRThigh_acc_min =    min(RThigh_steps_acc_mean);

if yLThigh_acc_min < yRThigh_acc_min
    yThigh_acc_min = yLThigh_acc_min;
elseif yLThigh_acc_min > yRThigh_acc_min
    yThigh_acc_min = yRThigh_acc_min;
end

%yLeg_acc_min calc
yLLeg_acc_min =    min(LLeg_steps_acc_mean);
yRLeg_acc_min =    min(RLeg_steps_acc_mean);

if yLLeg_acc_min < yRLeg_acc_min
    yLeg_acc_min = yLLeg_acc_min;
elseif yLLeg_acc_min > yRLeg_acc_min
    yLeg_acc_min = yRLeg_acc_min;
end

%yFoot_acc_min calc
yLFeet_acc_min =    min(LFoot_steps_acc_mean);
yRFeet_acc_min =    min(RFoot_steps_acc_mean);

if yLFeet_acc_min < yRFeet_acc_min
    yFeet_acc_min = yLFeet_acc_min;
elseif yLFeet_acc_min > yRFeet_acc_min
    yFeet_acc_min = yRFeet_acc_min;
end

if plot_step_acc == true
    %head marker coordinates
    figure(trial_num)
    subplot(3,2,1)
    bar(1:num_steps,head_steps_acc_mean,'c') %timestamp addition before head. give time in seconds
    hold on
    errorbar(1:num_steps,head_steps_acc_mean,head_steps_acc_std,'p')
    ylim([yhead_acc_min yhead_acc_max]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %chest marker coordinates
    subplot(3,2,3)
    bar(1:num_steps,chest_steps_acc_mean,'c')
    hold on
    errorbar(1:num_steps,chest_steps_acc_mean,chest_steps_acc_std,'p')
    ylim([ychest_acc_min ychest_acc_max]);
    title('Chest')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %hip marker coordinates
    subplot(3,2,5)
    bar(1:num_steps,hip_steps_acc_mean,'c')
    hold on
    errorbar(1:num_steps,hip_steps_acc_mean,hip_steps_acc_std,'p')
    ylim([yhip_acc_min yhip_acc_max]);
    title('Hip')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    bar(1:num_steps,LThigh_steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LThigh_steps_acc_mean,LThigh_steps_acc_std,'p')
    bar(1:num_steps,RThigh_steps_acc_mean,'r')
    errorbar(1:num_steps,RThigh_steps_acc_mean,RThigh_steps_acc_std,'p')
    ylim([yThigh_acc_min yThigh_acc_max]);
    title('LThigh & RThigh')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    bar(1:num_steps,LLeg_steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LLeg_steps_acc_mean,LLeg_steps_acc_std,'p')
    bar(1:num_steps,RLeg_steps_acc_mean,'r')
    errorbar(1:num_steps,RLeg_steps_acc_mean,RLeg_steps_acc_std,'p')
    ylim([yLeg_acc_min yLeg_acc_max]);
    title('LShank & RShank')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    bar(1:num_steps,LFoot_steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LFoot_steps_acc_mean,LFoot_steps_acc_std,'p')
    bar(1:num_steps,RFoot_steps_acc_mean,'r')
    errorbar(1:num_steps,RFoot_steps_acc_mean,RFoot_steps_acc_std,'p')
    ylim([yFeet_acc_min yFeet_acc_max]);
    title('LFoot & RFoot')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
end

%% Jerk figures for troubleshooting
% Figure conditions/parameters
plot_step_jerk = false;
num_steps = length(head_steps_jerk); %x_values = num_steps

%Max limits for figures
yhead_jerk_max =     max(head_steps_jerk_maxs)+ max(head_steps_acc_maxs)*0.25;
ychest_jerk_max =    max(chest_steps_jerk_maxs)+ max(chest_steps_jerk_maxs)*0.25;
yhip_jerk_max =      max(hip_steps_jerk_maxs)+ max(hip_steps_jerk_maxs)*0.25; %max(cellfun(@max,hip_steps_acc));
yLThigh_jerk_max =   max(LThigh_steps_jerk_maxs) + max(LThigh_steps_jerk_maxs)*0.25; 
yRThigh_jerk_max =   max(RThigh_steps_jerk_maxs) + max(RThigh_steps_jerk_maxs)*0.25; 
yLLeg_jerk_max =     max(LLeg_steps_jerk_maxs) + max(LLeg_steps_jerk_maxs)*0.25;
yRLeg_jerk_max =     max(RLeg_steps_jerk_maxs) + max(RLeg_steps_jerk_maxs)*0.25;
yLFeet_jerk_max =    max(LFoot_steps_jerk_maxs); %max(cellfun(@max,LFoot_steps_acc));
yRFeet_jerk_max =    max(RFoot_steps_jerk_maxs); %max(cellfun(@max,RFoot_steps_acc));

%yThigh_jerk_max calc
if yLThigh_jerk_max > yRThigh_jerk_max
    yThigh_jerk_max = yLThigh_jerk_max + yLThigh_jerk_max*0.25;
elseif yLThigh_jerk_max < yRThigh_jerk_max
    yThigh_jerk_max = yRThigh_jerk_max + yRThigh_jerk_max*0.25;
end

%yLeg_jerk_max calc
if yLLeg_jerk_max > yRLeg_jerk_max
    yLeg_jerk_max = yLLeg_jerk_max + yLLeg_jerk_max*0.25;
elseif yLLeg_jerk_max < yRLeg_jerk_max
    yLeg_jerk_max = yRLeg_jerk_max + yRLeg_jerk_max*0.25;
end

%yFeet_jerk_max calc
if yLFeet_jerk_max > yRFeet_jerk_max
    yFeet_jerk_max = yLFeet_jerk_max + yLFeet_jerk_max*0.25;
elseif yLFeet_jerk_max < yRFeet_jerk_max
    yFeet_jerk_max = yRFeet_jerk_max + yRFeet_jerk_max*0.25;
end

%Min limits for figures
% yhead_jerk_min =     min(head_steps_jerk_mean);
yhead_jerk_min =     min(head_steps_jerk_mean) - max(head_steps_jerk_std);
ychest_jerk_min =    min(chest_steps_jerk_mean);
yhip_jerk_min =      min(hip_steps_jerk_mean);

%yThigh_acc_min calc
yLThigh_jerk_min =    min(LThigh_steps_jerk_mean);
yRThigh_jerk_min =    min(RThigh_steps_jerk_mean);

if yLThigh_jerk_min < yRThigh_jerk_min
    yThigh_jerk_min = yLThigh_jerk_min;
elseif yLThigh_jerk_min > yRThigh_jerk_min
    yThigh_jerk_min = yRThigh_jerk_min;
end

%yLeg_jerk_min calc
yLLeg_jerk_min =    min(LLeg_steps_jerk_mean);
yRLeg_jerk_min =    min(RLeg_steps_jerk_mean);

if yLLeg_jerk_min < yRLeg_jerk_min
    yLeg_jerk_min = yLLeg_jerk_min;
elseif yLLeg_jerk_min > yRLeg_jerk_min
    yLeg_jerk_min = yRLeg_jerk_min;
end

%yFoot_jerk_min calc
yLFeet_jerk_min =    min(LFoot_steps_jerk_mean);
yRFeet_jerk_min =    min(RFoot_steps_jerk_mean);

if yLFeet_jerk_min < yRFeet_jerk_min
    yFeet_jerk_min = yLFeet_jerk_min;
elseif yLFeet_jerk_min > yRFeet_jerk_min
    yFeet_jerk_min = yRFeet_jerk_min;
end

if plot_step_jerk == true
    %head marker coordinates
    figure(trial_num)
    subplot(3,2,1)
    bar(1:num_steps,head_steps_jerk_mean,'c') %timestamp addition before head. give time in seconds
    hold on
    errorbar(1:num_steps,head_steps_jerk_mean,head_steps_jerk_std,'p')
    ylim([yhead_jerk_min yhead_jerk_max]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
    
    %chest marker coordinates
    subplot(3,2,3)
    bar(1:num_steps,chest_steps_jerk_mean,'c')
    hold on
    errorbar(1:num_steps,chest_steps_jerk_mean,chest_steps_jerk_std,'p')
    ylim([ychest_jerk_min ychest_jerk_max]);
    title('Chest')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
    
    %hip marker coordinates
    subplot(3,2,5)
    bar(1:num_steps,hip_steps_jerk_mean,'c')
    hold on
    errorbar(1:num_steps,hip_steps_jerk_mean,hip_steps_jerk_std,'p')
    ylim([yhip_jerk_min yhip_jerk_max]);
    title('Hip')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    bar(1:num_steps,LThigh_steps_jerk_mean,'b')
    hold on
    errorbar(1:num_steps,LThigh_steps_jerk_mean,LThigh_steps_jerk_std,'p')
    bar(1:num_steps,RThigh_steps_jerk_mean,'r')
    errorbar(1:num_steps,RThigh_steps_jerk_mean,RThigh_steps_jerk_std,'p')
    ylim([yThigh_jerk_min yThigh_jerk_max]);
    title('LThigh & RThigh')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    bar(1:num_steps,LLeg_steps_jerk_mean,'b')
    hold on
    errorbar(1:num_steps,LLeg_steps_jerk_mean,LLeg_steps_jerk_std,'p')
    bar(1:num_steps,RLeg_steps_jerk_mean,'r')
    errorbar(1:num_steps,RLeg_steps_jerk_mean,RLeg_steps_jerk_std,'p')
    ylim([yLeg_jerk_min yLeg_jerk_max]);
    title('LShank & RShank')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    bar(1:num_steps,LFoot_steps_jerk_mean,'b')
    hold on
    errorbar(1:num_steps,LFoot_steps_jerk_mean,LFoot_steps_jerk_std,'p')
    bar(1:num_steps,RFoot_steps_jerk_mean,'r')
    errorbar(1:num_steps,RFoot_steps_jerk_mean,RFoot_steps_jerk_std,'p')
    ylim([yFeet_jerk_min yFeet_jerk_max]);
    title('LFoot & RFoot')
    xlabel('Steps')
    ylabel('Jerk (m/s^3)')
end
end