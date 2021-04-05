function barplot_trial_steps_acc(head_trials_steps_acc,chest_trials_steps_acc,hip_trials_steps_acc,LThigh_trials_steps_acc,RThigh_trials_steps_acc,LLeg_trials_steps_acc,RLeg_trials_steps_acc,LFoot_trials_steps_acc,RFoot_trials_steps_acc,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot acc of steps of individual trials
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculating mean acc_step for all trials
head_trials_step_acc_mean =     mean(head_trials_steps_acc);
chest_trials_step_acc_mean =    mean(chest_trials_steps_acc);
hip_trials_step_acc_mean =      mean(hip_trials_steps_acc);
LThigh_trials_step_acc_mean =   mean(LThigh_trials_steps_acc);
RThigh_trials_step_acc_mean =   mean(RThigh_trials_steps_acc);
LLeg_trials_step_acc_mean =     mean(LLeg_trials_steps_acc);
RLeg_trials_step_acc_mean =     mean(RLeg_trials_steps_acc);
LFoot_trials_step_acc_mean =    mean(LFoot_trials_steps_acc);
RFoot_trials_step_acc_mean =    mean(RFoot_trials_steps_acc);

%% Set max and mins for lower extremities
%Max limits for sub plots
%Thigh_acc_max calc
LThigh_trial_acc_max =    max(LThigh_trials_steps_acc);
RThigh_trial_acc_max =    max(RThigh_trials_steps_acc);

if LThigh_trial_acc_max > RThigh_trial_acc_max
    Thigh_trial_acc_max = LThigh_trial_acc_max;
elseif LThigh_trial_acc_max < RThigh_trial_acc_max
    Thigh_trial_acc_max = RThigh_trial_acc_max;
end

%Leg_acc_max calc
LLeg_trial_acc_max =    max(LLeg_trials_steps_acc);
RLeg_trial_acc_max =    max(RLeg_trials_steps_acc);

if LLeg_trial_acc_max > RLeg_trial_acc_max
    Leg_trial_acc_max = LLeg_trial_acc_max;
elseif LLeg_trial_acc_max < RLeg_trial_acc_max
    Leg_trial_acc_max = RLeg_trial_acc_max;
end

%Foot_acc_max calc
LFeet_trial_acc_max =    max(LFoot_trials_steps_acc);
RFeet_trial_acc_max =    max(RFoot_trials_steps_acc);

if LFeet_trial_acc_max > RFeet_trial_acc_max
    Feet_trial_acc_max = LFeet_trial_acc_max;
elseif LFeet_trial_acc_max < RFeet_trial_acc_max
    Feet_trial_acc_max = RFeet_trial_acc_max;
end

%Min limits for sub plots
%Thigh_acc_min calc
LThigh_trial_acc_min =    min(LThigh_trials_steps_acc);
RThigh_trial_acc_min =    min(RThigh_trials_steps_acc);

if LThigh_trial_acc_min < RThigh_trial_acc_min
    Thigh_trial_acc_min = LThigh_trial_acc_min;
elseif LThigh_trial_acc_min > RThigh_trial_acc_min
    Thigh_trial_acc_min = RThigh_trial_acc_min;
end

%Leg_acc_min calc
LLeg_trial_acc_min =    min(LLeg_trials_steps_acc);
RLeg_trial_acc_min =    min(RLeg_trials_steps_acc);

if LLeg_trial_acc_min < RLeg_trial_acc_min
    Leg_trial_acc_min = LLeg_trial_acc_min;
elseif LLeg_trial_acc_min > RLeg_trial_acc_min
    Leg_trial_acc_min = RLeg_trial_acc_min;
end

%Foot_acc_min calc
LFeet_trial_acc_min =    min(LFoot_trials_steps_acc);
RFeet_trial_acc_min =    min(RFoot_trials_steps_acc);

if LFeet_trial_acc_min < RFeet_trial_acc_min
    Feet_trial_acc_min = LFeet_trial_acc_min;
elseif LFeet_trial_acc_min > RFeet_trial_acc_min
    Feet_trial_acc_min = RFeet_trial_acc_min;
end

%head marker coordinates
figure(trial_num+1)
subplot(3,2,1)
bar(1:trial_num,head_trials_steps_acc,'c')
hold on
ylim([0 max(head_trials_steps_acc) + max(head_trials_steps_acc)*0.10]);
title('Head')
xlabel('Trial')
ylabel('Acc (m/s^2)')

%chest marker coordinates
subplot(3,2,3)
bar(1:trial_num,chest_trials_steps_acc,'c')
hold on
ylim([0 max(chest_trials_steps_acc) + max(chest_trials_steps_acc)*0.10]);
title('Chest')
xlabel('Trial')
ylabel('Acc (m/s^2)')

%hip marker coordinates
subplot(3,2,5)
bar(1:trial_num,hip_trials_steps_acc,'c')
hold on
ylim([0 max(hip_trials_steps_acc) + max(hip_trials_steps_acc)*0.10]);
title('Hip')
xlabel('Trial')
ylabel('Acc (m/s^2)')

%LThigh & RThigh marker overlayed
subplot(3,2,2)
bar(1:trial_num,LThigh_trials_steps_acc,'b')
hold on
bar(1:trial_num,RThigh_trials_steps_acc,'r')
ylim([Thigh_trial_acc_min Thigh_trial_acc_max + max(Thigh_trial_acc_max)*0.10]);
title('LThigh & RThigh')
xlabel('Trial')
ylabel('Acc (m/s^2)')

%LLeg & RLeg marker overlayed
subplot(3,2,4)
bar(1:trial_num,LLeg_trials_steps_acc,'b')
hold on
bar(1:trial_num,RLeg_trials_steps_acc,'r')
ylim([Leg_trial_acc_min Leg_trial_acc_max + max(Leg_trial_acc_max)*0.10]);
title('LShank & RShank')
xlabel('Trial')
ylabel('Acc (m/s^2)')

%LFoot & RFoot marker overlayed
subplot(3,2,6)
bar(1:trial_num,LFoot_trials_steps_acc,'b')
hold on
bar(1:trial_num,RFoot_trials_steps_acc,'r')
ylim([Feet_trial_acc_min Feet_trial_acc_max + max(Feet_trial_acc_max)*0.10]);
title('LFoot & RFoot')
xlabel('Trial')
ylabel('Acc (m/s^2)')