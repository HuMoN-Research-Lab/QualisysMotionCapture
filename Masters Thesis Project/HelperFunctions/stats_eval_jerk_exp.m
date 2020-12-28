function stats_eval_jerk_exp(head_trials_steps_jerk,chest_trials_steps_jerk,hip_trials_steps_jerk,LThigh_trials_steps_jerk,RThigh_trials_steps_jerk,LLeg_trials_steps_jerk,RLeg_trials_steps_jerk,LFoot_trials_steps_jerk,RFoot_trials_steps_jerk,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Conduct stats on jerk results from kinematic chain across all trials
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stats on head trials
avg_head_jerk =      mean(head_trials_steps_jerk);
avg_head_jerk_std =  std(head_trials_steps_jerk);

% Stats on chest trials
avg_chest_jerk =     mean(chest_trials_steps_jerk);
avg_chest_jerk_std = std(chest_trials_steps_jerk);

% Stats on hip trials
avg_hip_jerk =       mean(hip_trials_steps_jerk);
avg_hip_jerk_std =   std(hip_trials_steps_jerk);

% Stats on thigh trials
avg_LThigh_jerk =    mean(LThigh_trials_steps_jerk);
std_LThigh_jerk =    std(LThigh_trials_steps_jerk);
avg_RThigh_jerk =    mean(RThigh_trials_steps_jerk);
std_RThigh_jerk =    std(RThigh_trials_steps_jerk);
avg_Thigh_jerk =     mean(LThigh_trials_steps_jerk + RThigh_trials_steps_jerk);
avg_Thigh_jerk_std = mean(std_LThigh_jerk + std_RThigh_jerk);

% Stats on leg trials
avg_LLeg_jerk =      mean(LLeg_trials_steps_jerk);
std_LLeg_jerk =      std(LLeg_trials_steps_jerk);
avg_RLeg_jerk =      mean(RLeg_trials_steps_jerk);
std_RLeg_jerk =      std(RLeg_trials_steps_jerk);
avg_Leg_jerk =       mean(LLeg_trials_steps_jerk + RLeg_trials_steps_jerk);
avg_Leg_jerk_std =   mean(std_LLeg_jerk + std_RLeg_jerk);

% Stats on foot trials
avg_LFoot_jerk =     mean(LFoot_trials_steps_jerk);
std_LFoot_jerk =     std(LFoot_trials_steps_jerk);
avg_RFoot_jerk =     mean(RFoot_trials_steps_jerk);
std_RFoot_jerk =     std(RFoot_trials_steps_jerk);
avg_Feet_jerk =      mean(LFoot_trials_steps_jerk + RFoot_trials_steps_jerk);
avg_Feet_jerk_std =  mean(std_LFoot_jerk + std_RFoot_jerk);

%% Statistical Analysis of Confidence Interval of Lower Extremities
%Stats eval of LThigh & RThigh
LThigh_stat_eval =       avg_LThigh_jerk + std_LThigh_jerk;
RThigh_stat_eval =       avg_RThigh_jerk + std_RThigh_jerk;
LThigh_stat_eval_max =   (LThigh_stat_eval + std_LThigh_jerk) + (LThigh_stat_eval + std_LThigh_jerk)*0.10;
RThigh_stat_eval_max =   (RThigh_stat_eval + std_RThigh_jerk) + (RThigh_stat_eval + std_RThigh_jerk)*0.10;
Thigh_mean_jerk_eval =    [LThigh_stat_eval RThigh_stat_eval];
Thigh_std_jerk_eval =     [std_LThigh_jerk std_RThigh_jerk];

%Set Thigh bar graph max
if LThigh_stat_eval_max > RThigh_stat_eval_max
    Thigh_stat_eval_max = LThigh_stat_eval_max;
elseif LThigh_stat_eval_max < RThigh_stat_eval_max
    Thigh_stat_eval_max = RThigh_stat_eval_max;
end

% Bar graph conditions
figure(43+trial_num)

for ii = 1:2
    thigh_labels = {'LThigh' 'RThigh'};
    Thigh_avg_jerk_series(ii) = bar(ii,Thigh_mean_jerk_eval(ii));
    hold on
    Thigh_std_jerk_series(ii) = errorbar(ii,Thigh_mean_jerk_eval(ii),Thigh_std_jerk_eval(ii),'.');
    hold on
%     xlabel(thigh_labels(ii));
    ylabel('Jerk(m/s^3)');
    ylim([0 Thigh_stat_eval_max])
%     legend(["LThigh","LThigh std","RThigh","RThigh std"]);
    title('Average Jerk for ' + string(trial_num)+ ' Trials Along Thighs')
end
set(gca,'xtick',1:2,'XTickLabels', thigh_labels);

%Stats eval of LLeg & RLeg
LLeg_stat_eval =       avg_LLeg_jerk + std_LLeg_jerk;
RLeg_stat_eval =       avg_RLeg_jerk + std_RLeg_jerk;
LLeg_stat_eval_max =   (LLeg_stat_eval + std_LLeg_jerk) + (LLeg_stat_eval + std_LLeg_jerk)*0.10;
RLeg_stat_eval_max =   (RLeg_stat_eval + std_RLeg_jerk) + (RLeg_stat_eval + std_RLeg_jerk)*0.10;
Leg_mean_jerk_eval =    [LLeg_stat_eval RLeg_stat_eval];
Leg_std_jerk_eval =     [std_LLeg_jerk std_RLeg_jerk];

%Set Thigh bar graph max
if LLeg_stat_eval_max > RLeg_stat_eval_max
    Leg_stat_eval_max = LLeg_stat_eval_max;
elseif LLeg_stat_eval_max < RLeg_stat_eval_max
    Leg_stat_eval_max = RLeg_stat_eval_max;
end

% Bar graph conditions
figure(432+trial_num)

for ii = 1:2
    leg_labels = {'LShank' 'RShank'};
    Leg_avg_jerk_series(ii) = bar(ii,Leg_mean_jerk_eval(ii));
    hold on
    Leg_std_jerk_series(ii) = errorbar(ii,Leg_mean_jerk_eval(ii),Leg_std_jerk_eval(ii),'.');
    hold on
%     xlabel(leg_labels(ii));
    ylabel('Jerk(m/s^3)');
    ylim([0 Leg_stat_eval_max])
%     legend(["LLeg","LLeg std","RLeg","RLeg std"]);
    title('Average Jerk for ' + string(trial_num)+ ' Trials Along Shanks')
end
set(gca,'xtick',1:2,'XTickLabels',leg_labels);

%Stats eval of LFoot & RFoot
LFoot_stat_eval =       avg_LFoot_jerk + std_LFoot_jerk;
RFoot_stat_eval =       avg_RFoot_jerk + std_RFoot_jerk;
LFoot_stat_eval_max =   (LFoot_stat_eval + std_LFoot_jerk) + (LFoot_stat_eval + std_LFoot_jerk)*0.10;
RFoot_stat_eval_max =   (RFoot_stat_eval + std_RFoot_jerk) + (RFoot_stat_eval + std_RFoot_jerk)*0.10;
Foot_mean_jerk_eval =    [LFoot_stat_eval RFoot_stat_eval];
Foot_std_jerk_eval =     [std_LFoot_jerk std_RFoot_jerk];

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
    foot_labels = {'LFoot' 'RFoot'};
    Foot_avg_jerk_series(ii) = bar(ii,Foot_mean_jerk_eval(ii));
    hold on
    Foot_std_jerk_series(ii) = errorbar(ii,Foot_mean_jerk_eval(ii),Foot_std_jerk_eval(ii),'.');
    hold on
%     xlabel(foot_labels(ii));
    ylabel('Jerk(m/s^3)');
    ylim([0 Foot_stat_eval_max])
%     legend(["LFoot","LFoot std","RFoot","RFoot std"]);
    title('Average Jerk for ' + string(trial_num)+ ' Trials Along Feet')
end
set(gca,'xtick',1:2,'XTickLabels',foot_labels);

%% Total Body Overview of Experiments Statistical Analysis
num_fullbody_seg = 6;
for jj = 1:num_fullbody_seg
    figure(21223+trial_num);
    % Set y values
    %     kin_exp_jerk_rev01 = [avg_LFoot_jerk avg_RFoot_jerk avg_LLeg_jerk avg_RLeg_jerk avg_LThigh_jerk avg_RThigh_jerk avg_hip_jerk avg_chest_jerk avg_head_jerk];
    %     kin_labels_rev01 = ["LFoot","RFoot","LLeg","RLeg","LThigh","RThigh","hip","chest","head"];
    kin_exp_jerk =       [avg_Feet_jerk avg_Leg_jerk avg_Thigh_jerk avg_hip_jerk avg_chest_jerk avg_head_jerk];
    kin_exp_jerk_std =   [avg_Feet_jerk_std avg_Leg_jerk_std avg_Thigh_jerk_std avg_hip_jerk_std avg_chest_jerk_std avg_head_jerk_std];
    kin_labels =        {'Feet' 'Shanks' 'Thighs' 'Hip' 'Chest' 'Head'};
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
    jerk_mean_jerk_series(jj) =   bar(jj,kin_exp_jerk(jj));
    hold on
    jerk_std_jerk_series(jj) =    errorbar(jj,kin_exp_jerk(jj),kin_exp_jerk_std(jj),'.');
    %     legend(kin_labels,'Location','northeast')
    %     xticklabels(kin_labels(jj));
    ylabel('Jerk(m/s^3)');
    title('Average Jerk for ' + string(trial_num)+ ' Trials Along Complete Kinematic Chain')
%     title('Average Jerk for Trials 48 - ' + string(trial_num)+ ' Along Complete Kinematic Chain')
end
set(gca,'xtick',1:6,'XTickLabels', kin_labels);

%% Torso Overview of Experiments Statistical Analysis
num_torso_seg = 3;
for jj = 1:num_torso_seg
    figure(31265+trial_num);
    % Set y values
    %     kin_exp_jerk_rev01 = [avg_LFoot_jerk avg_RFoot_jerk avg_LLeg_jerk avg_RLeg_jerk avg_LThigh_jerk avg_RThigh_jerk avg_hip_jerk avg_chest_jerk avg_head_jerk];
    %     kin_labels_rev01 = ["LFoot","RFoot","LLeg","RLeg","LThigh","RThigh","hip","chest","head"];
    kin_exp_jerk_torso =         [avg_hip_jerk avg_chest_jerk avg_head_jerk];
    kin_exp_jerk_torso_std =     [avg_hip_jerk_std avg_chest_jerk_std avg_head_jerk_std];
    kin_labels_torso =           {'Hip' 'Chest' 'Head'};
    %     kin_labels_w_std =  ["Feet","Feet Std","Legs","Legs Std","Thighs","Thighs Std","Hip","Hip Std","Chest","Chest Std","Head","Head Std"];
    
    % Set color of bar graphs
    bar_color_map(1,:) = [.9 .9 .14];  % Green Color for segment 1.
    bar_color_map(2,:) = [.3 .71 .3];  % Blue Color for segment 2.
    bar_color_map(3,:) = [.35 .44 .79];  % Red Color for segment 3.
    
    %Plot bar graph
    bar(jj,kin_exp_jerk_torso(jj));
    hold on
    errorbar(jj,kin_exp_jerk_torso(jj),kin_exp_jerk_torso_std(jj),'.');
    %     legend(kin_labels,'Location','northeast')
    %     xticklabels(kin_labels(jj));
    ylabel('Jerk(m/s^3)');
    title('Average Jerk for ' + string(trial_num)+ ' Trials Along Torso')
end
%     xticklabels({'Feet','Legs','Thighs','Hip','Chest','Head'});
set(gca,'xtick',1:3,'XTickLabels', kin_labels_torso);


end