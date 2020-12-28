function [head_stats,chest_stats,hip_stats,Thigh_stats,Leg_stats,Foot_stats] = stats_eval_acc_exp(head_trials_steps_acc,chest_trials_steps_acc,hip_trials_steps_acc,LThigh_trials_steps_acc,RThigh_trials_steps_acc,LLeg_trials_steps_acc,RLeg_trials_steps_acc,LFoot_trials_steps_acc,RFoot_trials_steps_acc,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conduct stats on acc results from kinematic chain across all trials
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stats on head trials
avg_head_acc =      mean(head_trials_steps_acc);
avg_head_acc_std =  std(head_trials_steps_acc);

% Stats on chest trials
avg_chest_acc =     mean(chest_trials_steps_acc);
avg_chest_acc_std = std(chest_trials_steps_acc);

% Stats on hip trials
avg_hip_acc =       mean(hip_trials_steps_acc);
avg_hip_acc_std =   std(hip_trials_steps_acc);

% Stats on thigh trials
avg_LThigh_acc =    mean(LThigh_trials_steps_acc);
std_LThigh_acc =    std(LThigh_trials_steps_acc);
avg_RThigh_acc =    mean(RThigh_trials_steps_acc);
std_RThigh_acc =    std(RThigh_trials_steps_acc);
avg_Thigh_acc =     mean(LThigh_trials_steps_acc + RThigh_trials_steps_acc);
avg_Thigh_acc_std = mean(std_LThigh_acc + std_RThigh_acc);

% Stats on leg trials
avg_LLeg_acc =      mean(LLeg_trials_steps_acc);
std_LLeg_acc =      std(LLeg_trials_steps_acc);
avg_RLeg_acc =      mean(RLeg_trials_steps_acc);
std_RLeg_acc =      std(RLeg_trials_steps_acc);
avg_Leg_acc =       mean(LLeg_trials_steps_acc + RLeg_trials_steps_acc);
avg_Leg_acc_std =   mean(std_LLeg_acc + std_RLeg_acc);

% Stats on foot trials
avg_LFoot_acc =     mean(LFoot_trials_steps_acc);
std_LFoot_acc =     std(LFoot_trials_steps_acc);
avg_RFoot_acc =     mean(RFoot_trials_steps_acc);
std_RFoot_acc =     std(RFoot_trials_steps_acc);
avg_Feet_acc =      mean(LFoot_trials_steps_acc + RFoot_trials_steps_acc);
avg_Feet_acc_std =  mean(std_LFoot_acc + std_RFoot_acc);

%% Statistical Analysis of Confidence Interval of Lower Extremities
%Stats eval of LThigh & RThigh
LThigh_stat_eval =       avg_LThigh_acc + std_LThigh_acc;
RThigh_stat_eval =       avg_RThigh_acc + std_RThigh_acc;
LThigh_stat_eval_max =   (LThigh_stat_eval + std_LThigh_acc) + (LThigh_stat_eval + std_LThigh_acc)*0.10;
RThigh_stat_eval_max =   (RThigh_stat_eval + std_RThigh_acc) + (RThigh_stat_eval + std_RThigh_acc)*0.10;
Thigh_mean_acc_eval =    [LThigh_stat_eval RThigh_stat_eval];
Thigh_std_acc_eval =     [std_LThigh_acc std_RThigh_acc];

%Set Thigh bar graph max
if LThigh_stat_eval_max > RThigh_stat_eval_max
    Thigh_stat_eval_max = LThigh_stat_eval_max;
elseif LThigh_stat_eval_max < RThigh_stat_eval_max
    Thigh_stat_eval_max = RThigh_stat_eval_max;
end

% Bar graph conditions
figure(43+trial_num)

for ii = 1:2
    Thigh_avg_acc_series(ii) = bar(ii,Thigh_mean_acc_eval(ii));
    hold on
    Thigh_std_series(ii) = errorbar(ii,Thigh_mean_acc_eval(ii),Thigh_std_acc_eval(ii),'.');
    hold on
    %     xlabel('Thigh Trials');
    ylabel('Acceleration(m/s^2)');
    ylim([0 Thigh_stat_eval_max])
    legend(["LThigh","LThigh std","RThigh","RThigh std"]);
    title('Average Acceleration for ' + string(trial_num)+ ' Trials Along Thighs')
%     title('Average Acceleration for Trials 48 - ' + string(trial_num)+ ' Along the Thigh')
end

%Stats eval of LLeg & RLeg
LLeg_stat_eval =       avg_LLeg_acc + std_LLeg_acc;
RLeg_stat_eval =       avg_RLeg_acc + std_RLeg_acc;
LLeg_stat_eval_max =   (LLeg_stat_eval + std_LLeg_acc) + (LLeg_stat_eval + std_LLeg_acc)*0.10;
RLeg_stat_eval_max =   (RLeg_stat_eval + std_RLeg_acc) + (RLeg_stat_eval + std_RLeg_acc)*0.10;
Leg_mean_acc_eval =    [LLeg_stat_eval RLeg_stat_eval];
Leg_std_acc_eval =     [std_LLeg_acc std_RLeg_acc];

%Set Thigh bar graph max
if LLeg_stat_eval_max > RLeg_stat_eval_max
    Leg_stat_eval_max = LLeg_stat_eval_max;
elseif LLeg_stat_eval_max < RLeg_stat_eval_max
    Leg_stat_eval_max = RLeg_stat_eval_max;
end

% Bar graph conditions
figure(432+trial_num)

for ii = 1:2
    Leg_avg_acc_series(ii) = bar(ii,Leg_mean_acc_eval(ii));
    hold on
    Leg_std_series(ii) = errorbar(ii,Leg_mean_acc_eval(ii),Leg_std_acc_eval(ii),'.');
    hold on
    %     xlabel('Leg Trials');
    ylabel('Acceleration(m/s^2)');
    ylim([0 Leg_stat_eval_max])
    legend(["LLeg","LLeg std","RLeg","RLeg std"]);
    title('Average Acceleration for ' + string(trial_num)+ ' Trials Along Legs')
%     title('Average Acceleration for Trials 48 - ' + string(trial_num)+ ' Along the Legs')
end

%Stats eval of LFoot & RFoot
LFoot_stat_eval =       avg_LFoot_acc + std_LFoot_acc;
RFoot_stat_eval =       avg_RFoot_acc + std_RFoot_acc;
LFoot_stat_eval_max =   (LFoot_stat_eval + std_LFoot_acc) + (LFoot_stat_eval + std_LFoot_acc)*0.10;
RFoot_stat_eval_max =   (RFoot_stat_eval + std_RFoot_acc) + (RFoot_stat_eval + std_RFoot_acc)*0.10;
Foot_mean_acc_eval =    [LFoot_stat_eval RFoot_stat_eval];
Foot_std_acc_eval =     [std_LFoot_acc std_RFoot_acc];

%Set Foot bar graph max
if LFoot_stat_eval_max > RFoot_stat_eval_max
    Foot_stat_eval_max = LFoot_stat_eval_max;
elseif LFoot_stat_eval_max < RFoot_stat_eval_max
    Foot_stat_eval_max = RFoot_stat_eval_max;
end

% Bar graph conditions
figure(4321+trial_num)
% bar_xlabel = ["LFoot","RFoot"];

for ii = 1:2
    Foot_avg_acc_series(ii) = bar(ii,Foot_mean_acc_eval(ii));
    hold on
    Foot_std_series(ii) = errorbar(ii,Foot_mean_acc_eval(ii),Foot_std_acc_eval(ii),'.');
    hold on
    %xlabel('Feet Trials');
    ylabel('Acceleration(m/s^2)');
    ylim([0 Foot_stat_eval_max])
    legend(["LFoot","LFoot std","RFoot","RFoot std"]);
    title('Average Acceleration for ' + string(trial_num)+ ' Trials Along Feet')
%     title('Average Acceleration for Trials 48 - ' + string(trial_num)+ ' Along the Feet')
end

%% Total Body Overview of Experiments Statistical Analysis
num_fullbody_seg = 6;
for jj = 1:num_fullbody_seg
    figure(21223+trial_num);
    % Set y values
    %     kin_exp_acc_rev01 = [avg_LFoot_acc avg_RFoot_acc avg_LLeg_acc avg_RLeg_acc avg_LThigh_acc avg_RThigh_acc avg_hip_acc avg_chest_acc avg_head_acc];
    %     kin_labels_rev01 = ["LFoot","RFoot","LLeg","RLeg","LThigh","RThigh","hip","chest","head"];
    kin_exp_acc =       [avg_Feet_acc avg_Leg_acc avg_Thigh_acc avg_hip_acc avg_chest_acc avg_head_acc];
    kin_exp_acc_std =   [avg_Feet_acc_std avg_Leg_acc_std avg_Thigh_acc_std avg_hip_acc_std avg_chest_acc_std avg_head_acc_std];
    kin_labels =        {'Feet' 'Legs' 'Thighs' 'Hip' 'Chest' 'Head'};
    %     kin_labels_w_std =  ["Feet","Feet Std","Legs","Legs Std","Thighs","Thighs Std","Hip","Hip Std","Chest","Chest Std","Head","Head Std"];
    
    % Set color of bar graphs
    bar_color_map(1,:) = [.2 .71 .3];  % Green Color for segment 1.
    bar_color_map(2,:) = [.25 .55 .79];  % Blue Color for segment 2.
    bar_color_map(3,:) = [.9 .1 .14];  % Red Color for segment 3.
    bar_color_map(4,:) = [.9 .9 .14];  % Yellow color
    bar_color_map(5,:) = [.3 .71 .3];
    bar_color_map(6,:) = [.35 .44 .79];
    %     bar_color_map(7,:) = [.6 .15 .49];
    %     bar_color_map(8,:) = [.8 .12 .54];
    
    %Plot bar graph
    acc_mean_bar_series(jj) =   bar(jj,kin_exp_acc(jj));
    hold on
    acc_std_bar_series(jj) =    errorbar(jj,kin_exp_acc(jj),kin_exp_acc_std(jj),'.');
    %     legend(kin_labels,'Location','northeast')
    %     xticklabels(kin_labels(jj));
    ylabel('Acceleration(m/s^2)');
    title('Average Acceleration for ' + string(trial_num)+ ' Trials Along Complete Kinematic Chain')
%     title('Average Acceleration for Trials 48 - ' + string(trial_num)+ ' Along Complete Kinematic Chain')
end
set(gca,'xtick',1:6,'XTickLabels', kin_labels);

%% Torso Overview of Experiments Statistical Analysis
num_torso_seg = 3;
for jj = 1:num_torso_seg
    figure(31265+trial_num);
    % Set y values
    %     kin_exp_acc_rev01 = [avg_LFoot_acc avg_RFoot_acc avg_LLeg_acc avg_RLeg_acc avg_LThigh_acc avg_RThigh_acc avg_hip_acc avg_chest_acc avg_head_acc];
    %     kin_labels_rev01 = ["LFoot","RFoot","LLeg","RLeg","LThigh","RThigh","hip","chest","head"];
    kin_exp_acc_torso =         [avg_hip_acc avg_chest_acc avg_head_acc];
    kin_exp_acc_torso_std =     [avg_hip_acc_std avg_chest_acc_std avg_head_acc_std];
    kin_labels_torso =                {'Hip' 'Chest' 'Head'};
    %     kin_labels_w_std =  ["Feet","Feet Std","Legs","Legs Std","Thighs","Thighs Std","Hip","Hip Std","Chest","Chest Std","Head","Head Std"];
    
    % Set color of bar graphs
    bar_color_map(1,:) = [.9 .9 .14];  % Green Color for segment 1.
    bar_color_map(2,:) = [.3 .71 .3];  % Blue Color for segment 2.
    bar_color_map(3,:) = [.35 .44 .79];  % Red Color for segment 3.
    
    %Plot bar graph
    bar(jj,kin_exp_acc_torso(jj));
    hold on
    errorbar(jj,kin_exp_acc_torso(jj),kin_exp_acc_torso_std(jj),'.');
    %     legend(kin_labels,'Location','northeast')
    %     xticklabels(kin_labels(jj));
    ylabel('Acceleration(m/s^2)');
    title('Average Acceleration for ' + string(trial_num)+ ' Trials Along Torso')
%     title('Average Acceleration for Trials 48 - ' + string(trial_num)+ ' Along the Torso')
end
%     xticklabels({'Feet','Legs','Thighs','Hip','Chest','Head'});
set(gca,'xtick',1:3,'XTickLabels', kin_labels_torso);


end