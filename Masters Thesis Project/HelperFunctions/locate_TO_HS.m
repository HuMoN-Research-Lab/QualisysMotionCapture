function [LFoot_HS,LFoot_TO,RFoot_HS,RFoot_TO] = locate_TO_HS(LFoot,RFoot,trial_num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Index start and end of gait cycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial Conditions
LFoot_vely = LFoot.marVely;
RFoot_vely = RFoot.marVely;

%% LFoot Gait Breakdown
% Index LFoot in motion
threshold = 0.5;
LFoot_gait_bool = LFoot_vely >= threshold;

% Locate toe-ons and heel-strikes in gait cycle
LFoot_gait_diff = diff(LFoot_gait_bool);
LFoot_TO = find(LFoot_gait_diff == 1);
LFoot_HS = find(LFoot_gait_diff == -1);

%% Debug Plot Output
figure(trial_num)
hold on
plot(LFoot_vely,'b');
%plot(RFoot_vely,'r');
refline(0,threshold)
plot(LFoot_TO,LFoot_vely(LFoot_TO),'bo')
plot(LFoot_HS,LFoot_vely(LFoot_HS),'bx')
title('Step Finder Debug Plot');

%% RFoot Gait Breakdown
% Index RFoot in motion
RFoot_gait_index = RFoot_vely >= threshold;

RFoot_stance_diff = diff(RFoot_gait_index);
RFoot_TO = find(RFoot_stance_diff == 1);
RFoot_HS = find(RFoot_stance_diff == -1);

%% Debug Plot Output
hold on
plot(RFoot_vely,'r');
plot(RFoot_TO,RFoot_vely(RFoot_TO),'ro')
plot(RFoot_HS,RFoot_vely(RFoot_HS),'rx')

%head_traj_per_step{1} = 0; 

%% Step Index
%Left foot calc
%Identify the start of the trials first complete step
if LFoot_HS(1) > LFoot_TO(1)
    LFoot_HS_step(1) = 1;
    LFoot_TO_step(1) = 2;
elseif LFoot_HS(1) < LFoot_TO(1)
    LFoot_HS_step(1) = 1;
    LFoot_TO_step(1) = 1;
end

%Identify the end of the trials last complete step
%bad if ends in HS, good if ends in TO
if LFoot_HS(end) > LFoot_TO(end)
    LFoot_HS_step(2) = length(LFoot_HS)-1;
    LFoot_TO_step(2) = length(LFoot_TO);
elseif LFoot_HS(end) < LFoot_TO(end)
    LFoot_HS_step(2) = length(LFoot_HS);
    LFoot_TO_step(2) = length(LFoot_TO);
end

% %Identify the steps taken during a trial
% for jj = 1:length(LFoot_HS)-1
%     LFoot_step{jj} = LFoot_HS(jj):LFoot_TO(jj+1)-1;
% end
% 
% if LFoot_HS(1) > LFoot_TO(1) %identify the start of the step
%     if LFoot_HS(last_step) > LFoot_TO(last_step)
%         trial_duration = LFoot_HS;
%     end
% end

%RFoot calc
if RFoot_HS(1) > RFoot_TO(1)
    RFoot_HS_step(1) = 1;
    RFoot_TO_step(1) = 2;
elseif RFoot_HS(1) < RFoot_TO(1)
    RFoot_HS_step(1) = 1;
    RFoot_TO_step(1) = 1;
end

%Identify the end of the trials last complete step
%bad if ends in HS, good if ends in TO
if RFoot_HS(end) > RFoot_TO(end)
    RFoot_HS_step(2) = length(RFoot_HS)-1;
    RFoot_TO_step(2) = length(RFoot_TO);
elseif RFoot_HS(end) < RFoot_TO(end)
    RFoot_HS_step(2) = length(RFoot_HS);
    RFoot_TO_step(2) = length(RFoot_TO);
end

% %% Identify individual step frames
% if LFoot_HS(end) > LFoot_TO(end)
%     for kk = LFoot_TO_step(1):LFoot_TO_step(2)
%         for jj = LFoot_HS_step(1):LFoot_HS_step(2)
%             LFoot_step{jj} = LFoot_HS(jj):LFoot_TO_step(kk);
%         end
%     end
% end

% for jj = 1:3
%     LFoot_step{jj} = LFoot_HS(jj):LFoot_TO(jj+1)-1;
% end

% %Right Foot
% for jj = 1:3
%     RFoot_step{jj} = RFoot_HS(jj):RFoot_TO(jj+1)-1;
% end


%% Stance and Swing Calculations
% %Left leg calcs
% % Identify which leg took first step & calc num steps
% if length(LFoot_TO) > length(LFoot_HS)
%     LFoot_steps = length(LFoot_TO);
% elseif length(LFoot_TO) < length(LFoot_HS)
%     LFoot_steps = length(LFoot_HS);
% end
% 
% % Create frame breakdown of foot gait cycle
% LFoot_swing = {};
% LFoot_stance = {};
% 
% for ii = 1:LFoot_steps-1
%     if LFoot_TO(ii) < LFoot_HS(ii)
%         LFoot_swing{ii} = LFoot_TO(ii):LFoot_HS(ii);
%         LFoot_stance{ii} = LFoot_HS(ii):LFoot_TO(ii+1);
%     elseif LFoot_TO(ii) > LFoot_HS(ii)
%         LFoot_swing{ii} = LFoot_HS(ii):LFoot_TO(ii);
%         LFoot_stance{ii} = LFoot_HS(ii+1):LFoot_TO(ii);
%     end
% end

% %Right leg calcs
% % Identify which leg took first step & calc num steps
% if length(RFoot_TO) > length(RFoot_HS)
%     RFoot_steps = length(RFoot_TO);
% elseif length(RFoot_TO) < length(RFoot_HS)
%     RFoot_steps = length(RFoot_HS);
% end
% 
% % Create frame breakdown of foot gait cycle
% RFoot_swing = {};
% RFoot_stance = {};
% 
% for ii = 1:RFoot_steps-1
%     if RFoot_TO(ii) < RFoot_HS(ii)
%         RFoot_swing{ii} = RFoot_TO(ii):RFoot_HS(ii);
%         RFoot_stance{ii} = RFoot_HS(ii):RFoot_TO(ii+1);
%     elseif RFoot_TO(ii) > RFoot_HS(ii)
%         RFoot_swing{ii} = RFoot_HS(ii):RFoot_TO(ii);
%         RFoot_stance{ii} = RFoot_HS(ii+1):RFoot_TO(ii);
%     end
% end


%% graveyard
% for ii = 1:vel_frames
%     if mean(RFoot_marVely_calc) >= 0.5
%         RFoot.step(1,ii) = -RFoot_marVely_calc(1,ii);
%     else
%         RFoot.marVely = RFoot_marVely_calc;
%     end
% end
end
