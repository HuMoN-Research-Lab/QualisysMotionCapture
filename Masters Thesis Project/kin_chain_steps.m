function [head_steps,chest_steps,hip_steps,LThigh_steps,RThigh_steps,LLeg_steps,RLeg_steps,LFoot_steps,RFoot_steps] = kin_chain_steps(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function calcs vel and acc per step along kinematic chain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
head_vel =      head.marVely;
head_acc =      head.marAccy;
head_steps =    [];
chest_vel =     chest.marVely;
chest_acc =     chest.marAccy;
chest_steps =   [];
hip_vel =       hip.marVely;
hip_acc =       hip.marAccy;
hip_steps =     [];

LThigh_vel =    LThigh.marVely;
LThigh_acc =    LThigh.marAccy;
LThigh_steps =  [];
RThigh_vel =    RThigh.marVely;
RThigh_acc =    RThigh.marAccy;
RThigh_steps =  [];

LLeg_vel =      LLeg.marVely;
LLeg_acc =      LLeg.marAccy;
LLeg_steps =    [];
RLeg_vel =      RLeg.marVely;
RLeg_acc =      RLeg.marAccy;
RLeg_steps =    [];

LFoot_vel =     LFoot.marVely;
LFoot_acc =     LFoot.marAccy;
LFoot_steps =   [];
RFoot_vel =     RFoot.marVely;
RFoot_acc =     RFoot.marAccy;
RFoot_steps =   [];

%% Head vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    head_steps_vel{step_num} = head_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
head_steps.steps_vel = head_steps_vel;

%Acc values per step
for step_num = 1:length(all_HS)-1
    head_steps_acc{step_num} = head_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
head_steps.steps_acc = head_steps_acc;

[r,c] = cellfun(@size,head_steps_vel);
max_cell_length = max([r,c]);

%Steps analysis
head_steps.steps_vel_mean =     cellfun(@mean,head_steps_vel);
head_steps.steps_vel_std =      cellfun(@std,head_steps_vel);
head_steps.steps_acc_mean =     cellfun(@mean,head_steps_acc);
head_steps.steps_acc_std =      cellfun(@std,head_steps_acc);

%% Chest vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    chest_steps_vel{step_num} = chest_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
chest_steps.steps_vel = chest_steps_vel;

%Acc values per step
for step_num = 1:length(all_HS)-1
    chest_steps_acc{step_num} = chest_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
chest_steps.steps_acc = chest_steps_acc;

%Steps analysis
chest_steps.steps_vel_mean =     cellfun(@mean,chest_steps_vel);
chest_steps.steps_vel_std =      cellfun(@std,chest_steps_vel);
chest_steps.steps_acc_mean =     cellfun(@mean,chest_steps_acc);
chest_steps.steps_acc_std =      cellfun(@std,chest_steps_acc);

%% Hip vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    hip_steps_vel{step_num} = hip_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
hip_steps.steps_vel = hip_steps_vel;

%Acc values per step
for step_num = 1:length(all_HS)-1
    hip_steps_acc{step_num} = hip_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
hip_steps.steps_acc = hip_steps_acc;

%Steps analysis
hip_steps.steps_vel_mean =     cellfun(@mean,hip_steps_vel);
hip_steps.steps_vel_std =      cellfun(@std,hip_steps_vel);
hip_steps.steps_acc_mean =     cellfun(@mean,hip_steps_acc);
hip_steps.steps_acc_std =      cellfun(@std,hip_steps_acc);

%% Thigh vel and acc per step
%LThigh vel values per step
for step_num = 1:length(all_HS)-1
    LThigh_steps_vel{step_num} = LThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
LThigh_steps.steps_vel = LThigh_steps_vel;

%LThigh acc values per step
for step_num = 1:length(all_HS)-1
    LThigh_steps_acc{step_num} = LThigh_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
LThigh_steps.steps_acc = LThigh_steps_acc;

%Steps analysis
LThigh_steps.steps_vel_mean =     cellfun(@mean,LThigh_steps_vel);
LThigh_steps.steps_vel_std =      cellfun(@std,LThigh_steps_vel);
LThigh_steps.steps_acc_mean =     cellfun(@mean,LThigh_steps_acc);
LThigh_steps.steps_acc_std =      cellfun(@std,LThigh_steps_acc);

%RThigh vel values per step
for step_num = 1:length(all_HS)-1
    RThigh_steps_vel{step_num} = RThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
RThigh_steps.steps_vel = RThigh_steps_vel;

%RThigh acc values per step
for step_num = 1:length(all_HS)-1
    RThigh_steps_acc{step_num} = RThigh_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
RThigh_steps.steps_acc = RThigh_steps_acc;

%Steps analysis
RThigh_steps.steps_vel_mean =     cellfun(@mean,RThigh_steps_vel);
RThigh_steps.steps_vel_std =      cellfun(@std,RThigh_steps_vel);
RThigh_steps.steps_acc_mean =     cellfun(@mean,RThigh_steps_acc);
RThigh_steps.steps_acc_std =      cellfun(@std,RThigh_steps_acc);

%% Leg vel and acc per step
%LLeg vel values per step
for step_num = 1:length(all_HS)-1
    LLeg_steps_vel{step_num} = LLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
LLeg_steps.steps_vel =  LLeg_steps_vel;

%LLeg acc values per step
for step_num = 1:length(all_HS)-1
    LLeg_steps_acc{step_num} = LLeg_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
LLeg_steps.steps_acc =  LLeg_steps_acc;

%Steps analysis
LLeg_steps.steps_vel_mean =     cellfun(@mean,LLeg_steps_vel);
LLeg_steps.steps_vel_std =      cellfun(@std,LLeg_steps_vel);
LLeg_steps.steps_acc_mean =     cellfun(@mean,LLeg_steps_acc);
LLeg_steps.steps_acc_std =      cellfun(@std,LLeg_steps_acc);

%RLeg vel values per step
for step_num = 1:length(all_HS)-1
    RLeg_steps_vel{step_num} = RLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
RLeg_steps.steps_vel =  RLeg_steps_vel;

%RLeg acc values per step
for step_num = 1:length(all_HS)-1
    RLeg_steps_acc{step_num} = RLeg_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
RLeg_steps.steps_acc =  RLeg_steps_acc;

%Steps analysis
RLeg_steps.steps_vel_mean =     cellfun(@mean,RLeg_steps_vel);
RLeg_steps.steps_vel_std =      cellfun(@std,RLeg_steps_vel);
RLeg_steps.steps_acc_mean =     cellfun(@mean,RLeg_steps_acc);
RLeg_steps.steps_acc_std =      cellfun(@std,RLeg_steps_acc);

%% Foot vel and acc per step
%LFoot vel values per step
for step_num = 1:length(all_HS)-1
    LFoot_steps_vel{step_num} = LFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
LFoot_steps.steps_vel =  LFoot_steps_vel;

%LFoot acc values per step
for step_num = 1:length(all_HS)-1
    LFoot_steps_acc{step_num} = LFoot_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
LFoot_steps.steps_acc =  LFoot_steps_acc;

%Steps analysis
LFoot_steps.steps_vel_mean =     cellfun(@mean,LFoot_steps_vel);
LFoot_steps.steps_vel_std =      cellfun(@std,LFoot_steps_vel);
LFoot_steps.steps_acc_mean =     cellfun(@mean,LFoot_steps_acc);
LFoot_steps.steps_acc_std =      cellfun(@std,LFoot_steps_acc);

%RFoot vel values per step
for step_num = 1:length(all_HS)-1
    RFoot_steps_vel{step_num} = RFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end
RFoot_steps.steps_vel =  RFoot_steps_vel;

%RLeg acc values per step
for step_num = 1:length(all_HS)-1
    RFoot_steps_acc{step_num} = RFoot_acc(all_HS(step_num):all_HS(step_num+1)-1);
end
RFoot_steps.steps_acc =  RFoot_steps_acc;

%Steps analysis
RFoot_steps.steps_vel_mean =     cellfun(@mean,RFoot_steps_vel);
RFoot_steps.steps_vel_std =      cellfun(@std,RFoot_steps_vel);
RFoot_steps.steps_acc_mean =     cellfun(@mean,RFoot_steps_acc);
RFoot_steps.steps_acc_std =      cellfun(@std,RFoot_steps_acc);

% time_between_steps = diff(all_HS)/300;
%     for step_num = 1:length(all_HS)-1
%         comX_per_step{step_num} = comX(all_HS(step_num):all_HS(step_num+1)-1);
%     end
%     mean_step_comX = cellfun(@mean, comX_per_step);
%     std_step_comX = cellfun(@std, comX_per_step);
    
%% Vel figures for troubleshooting
% Figure conditions/parameters
plot_step_vel = true;
num_steps = length(head_steps.steps_vel); %x_values = num_steps

%Max limits for figures
ytorso_vel_max = max(cellfun(@max,hip_steps.steps_vel));
yLFeet_vel_max = max(cellfun(@max,LFoot_steps.steps_vel));
yRFeet_vel_max = max(cellfun(@max,RFoot_steps.steps_vel));

if yLFeet_vel_max > yRFeet_vel_max
    yFeet_max = yLFeet_vel_max;
elseif yLFeet_vel_max < yRFeet_vel_max
    yFeet_max = yRFeet_vel_max;
end

%Min limits for figures
ytorso_vel_min =    0;
yFeet_vel_min =     0;

% ytorso_min = min(cellfun(@min,hip_steps.steps_vel));
% yLFeet_min = min(cellfun(@min,LFoot_steps.steps_vel));
% yRFeet_min = min(cellfun(@min,RFoot_steps.steps_vel));
% 
% if yLFeet_min < yRFeet_min
%     yFeet_min = yLFeet_min;
% elseif yLFeet_min > yRFeet_min
%     yFeet_min = yRFeet_min;
% end

if plot_step_vel == true
    %head marker coordinates
    figure(1)
    subplot(3,2,1)
    bar(1:num_steps,head_steps.steps_vel_mean,'c') %timestamp addition before head. give time in seconds
    hold on
    errorbar(1:num_steps,head_steps.steps_vel_mean,head_steps.steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %chest marker coordinates
    subplot(3,2,3)
    bar(1:num_steps,chest_steps.steps_vel_mean,'c')
    hold on
    errorbar(1:num_steps,chest_steps.steps_vel_mean,chest_steps.steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]);
    title('Chest')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %hip marker coordinates
    subplot(3,2,5)
    bar(1:num_steps,hip_steps.steps_vel_mean,'c')
    hold on
    errorbar(1:num_steps,hip_steps.steps_vel_mean,hip_steps.steps_vel_std,'p')
    ylim([ytorso_vel_min ytorso_vel_max]);
    title('Hip')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    bar(1:num_steps,LThigh_steps.steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LThigh_steps.steps_vel_mean,LThigh_steps.steps_vel_std,'p')
    bar(1:num_steps,RThigh_steps.steps_vel_mean,'r')
    errorbar(1:num_steps,RThigh_steps.steps_vel_mean,RThigh_steps.steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LThigh & RThigh')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    bar(1:num_steps,LLeg_steps.steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LLeg_steps.steps_vel_mean,LLeg_steps.steps_vel_std,'p')
    bar(1:num_steps,RLeg_steps.steps_vel_mean,'r')
    errorbar(1:num_steps,RLeg_steps.steps_vel_mean,RLeg_steps.steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LShank & RShank')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    bar(1:num_steps,LFoot_steps.steps_vel_mean,'b')
    hold on
    errorbar(1:num_steps,LFoot_steps.steps_vel_mean,LFoot_steps.steps_vel_std,'p')
    bar(1:num_steps,RFoot_steps.steps_vel_mean,'r')
    errorbar(1:num_steps,RFoot_steps.steps_vel_mean,RFoot_steps.steps_vel_std,'p')
    ylim ([yFeet_vel_min yFeet_max]);
    title('LFoot & RFoot')
    xlabel('Steps')
    ylabel('Velocity (m/s)')
end

%% Acc figures for troubleshooting
% Figure conditions/parameters
plot_step_acc = true;
num_steps = length(head_steps.steps_acc); %x_values = num_steps

%Max limits for figures
ytorso_acc_max = max(cellfun(@max,hip_steps.steps_acc));
yLFeet_acc_max = max(cellfun(@max,LFoot_steps.steps_acc));
yRFeet_acc_max = max(cellfun(@max,RFoot_steps.steps_acc));

if yLFeet_acc_max > yRFeet_acc_max
    yFeet_acc_max = yLFeet_acc_max;
elseif yLFeet_acc_max < yRFeet_acc_max
    yFeet_acc_max = yRFeet_acc_max;
end

%Min limits for figures
ytorso_acc_min = min(hip_steps.steps_acc_mean);
yLFeet_acc_min = min(LFoot_steps.steps_acc_mean);
yRFeet_acc_min = min(RFoot_steps.steps_acc_mean);

if yLFeet_acc_min < yRFeet_acc_min
    yFeet_acc_min = yLFeet_acc_min;
elseif yLFeet_acc_min > yRFeet_acc_min
    yFeet_acc_min = yRFeet_acc_min;
end

if plot_step_acc == true
    %head marker coordinates
    figure(2)
    subplot(3,2,1)
    bar(1:num_steps,head_steps.steps_acc_mean,'c') %timestamp addition before head. give time in seconds
    hold on
    errorbar(1:num_steps,head_steps.steps_acc_mean,head_steps.steps_acc_std,'p')
    ylim([ytorso_acc_min ytorso_acc_max]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %chest marker coordinates
    subplot(3,2,3)
    bar(1:num_steps,chest_steps.steps_acc_mean,'c')
    hold on
    errorbar(1:num_steps,chest_steps.steps_acc_mean,chest_steps.steps_acc_std,'p')
    ylim([ytorso_acc_min ytorso_acc_max]);
    title('Chest')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %hip marker coordinates
    subplot(3,2,5)
    bar(1:num_steps,hip_steps.steps_acc_mean,'c')
    hold on
    errorbar(1:num_steps,hip_steps.steps_acc_mean,hip_steps.steps_acc_std,'p')
    ylim([ytorso_acc_min ytorso_acc_max]);
    title('Hip')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    bar(1:num_steps,LThigh_steps.steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LThigh_steps.steps_acc_mean,LThigh_steps.steps_acc_std,'p')
    bar(1:num_steps,RThigh_steps.steps_acc_mean,'r')
    errorbar(1:num_steps,RThigh_steps.steps_acc_mean,RThigh_steps.steps_acc_std,'p')
    ylim ([yFeet_acc_min yFeet_acc_max]);
    title('LThigh & RThigh')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    bar(1:num_steps,LLeg_steps.steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LLeg_steps.steps_acc_mean,LLeg_steps.steps_acc_std,'p')
    bar(1:num_steps,RLeg_steps.steps_acc_mean,'r')
    errorbar(1:num_steps,RLeg_steps.steps_acc_mean,RLeg_steps.steps_acc_std,'p')
    ylim ([yFeet_acc_min yFeet_acc_max]);
    title('LShank & RShank')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    bar(1:num_steps,LFoot_steps.steps_acc_mean,'b')
    hold on
    errorbar(1:num_steps,LFoot_steps.steps_acc_mean,LFoot_steps.steps_acc_std,'p')
    bar(1:num_steps,RFoot_steps.steps_acc_mean,'r')
    errorbar(1:num_steps,RFoot_steps.steps_acc_mean,RFoot_steps.steps_acc_std,'p')
    ylim ([yFeet_acc_min yFeet_acc_max]);
    title('LFoot & RFoot')
    xlabel('Steps')
    ylabel('Acc (m/s^2)')
end
end