function [head_steps,chest_steps,hip_steps,LThigh_steps,RThigh_steps,LLeg_steps,RLeg_steps,LFoot_steps,RFoot_steps] = kin_chain_steps(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,all_HS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function calcs vel and acc per step along kinematic chain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
head_vel =      head.marVely;
head_acc =      head.marAccy;
chest_vel =     chest.marVely;
chest_acc =     chest.marAccy;
hip_vel =       hip.marVely;
hip_acc =       hip.marAccy;
LThigh_vel =    LThigh.marVely;
LThigh_acc =    LThigh.marAccy;
RThigh_vel =    RThigh.marVely;
RThigh_acc =    RThigh.marAccy;
LLeg_vel =      LLeg.marVely;
LLeg_acc =      LLeg.marAccy;
RLeg_vel =      RLeg.marVely;
RLeg_acc =      RLeg.marAccy;
LFoot_vel =     LFoot.marVely;
LFoot_acc =     LFoot.marAccy;
RFoot_vel =     RFoot.marVely;
RFoot_acc =     RFoot.marAccy;

%% Head vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    head_steps_vel{step_num} = head_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 1:length(all_HS)-1
    head_steps_acc{step_num} = head_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%% Chest vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    chest_steps_vel{step_num} = chest_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 1:length(all_HS)-1
    chest_steps_acc{step_num} = chest_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%% Hip vel and acc per step
%Vel values per step
for step_num = 1:length(all_HS)-1
    hip_steps_vel{step_num} = hip_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%Acc values per step
for step_num = 1:length(all_HS)-1
    hip_steps_acc{step_num} = hip_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%% Thigh vel and acc per step
%LThigh vel values per step
for step_num = 1:length(all_HS)-1
    LThigh_steps_vel{step_num} = LThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LThigh acc values per step
for step_num = 1:length(all_HS)-1
    LThigh_steps_acc{step_num} = LThigh_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%RThigh vel values per step
for step_num = 1:length(all_HS)-1
    RThigh_steps_vel{step_num} = RThigh_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LThigh acc values per step
for step_num = 1:length(all_HS)-1
    RThigh_steps_acc{step_num} = RThigh_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%% Leg vel and acc per step
%LLeg vel values per step
for step_num = 1:length(all_HS)-1
    LLeg_steps_vel{step_num} = LLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LLeg acc values per step
for step_num = 1:length(all_HS)-1
    LLeg_steps_acc{step_num} = LLeg_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg vel values per step
for step_num = 1:length(all_HS)-1
    RLeg_steps_vel{step_num} = RLeg_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg acc values per step
for step_num = 1:length(all_HS)-1
    RLeg_steps_acc{step_num} = RLeg_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%% Foot vel and acc per step
%LFoot vel values per step
for step_num = 1:length(all_HS)-1
    LFoot_steps_vel{step_num} = LFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%LFoot acc values per step
for step_num = 1:length(all_HS)-1
    LFoot_steps_acc{step_num} = LFoot_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

%RFoot vel values per step
for step_num = 1:length(all_HS)-1
    RFoot_steps_vel{step_num} = RFoot_vel(all_HS(step_num):all_HS(step_num+1)-1);
end

%RLeg acc values per step
for step_num = 1:length(all_HS)-1
    RFoot_steps_acc{step_num} = RFoot_acc(all_HS(step_num):all_HS(step_num+1)-1);
end

RFoot_steps_mean =  cellfun(@mean, RFoot_steps_vel);
RFoot_steps_std =   cellfun(@std, RFoot_steps_vel);

% time_between_steps = diff(all_HS)/300;
%     for step_num = 1:length(all_HS)-1
%         comX_per_step{step_num} = comX(all_HS(step_num):all_HS(step_num+1)-1);
%     end
%     mean_step_comX = cellfun(@mean, comX_per_step);
%     std_step_comX = cellfun(@std, comX_per_step);
    
end