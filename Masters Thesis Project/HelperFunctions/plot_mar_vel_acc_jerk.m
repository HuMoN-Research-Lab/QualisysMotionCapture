function plot_mar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trial_num,vel_start_end,acc_start_end,jerk_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the x y z vel, acc, and jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set preliminary conditions and parameters
figure(trial_num + 100)

%% Full body kinematic chain velocity in y coordinate plane
ytrialVel_uppertrunkMax = max(hip.marVely) + max(hip.marVely)*0.10;
ytrialVel_uppertrunkMin = 0.5;

%Plot all velocities of subject
plot_velocity = true;
if plot_velocity == true
    %head marker coordinates
    subplot(3,2,1)
    plot(vel_start_end,head.marVely,'k') %timestamp addition before head. give time in seconds
    %time = 1:length(markerVely)/framerate
    hold on
    xlim([0 4.5]);
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(vel_start_end,chest.marVely,'k')
    hold on
    xlim([0 4.5]);
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Chest Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(vel_start_end,hip.marVely,'k')
    hold on
    xlim([0 4.5]);
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Hip Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')

    %Initial conditions for lower trunk kinematic chain normalization
    %Set ymin and ymax for vel plots
    if max(LFoot.marVely) > max(RFoot.marVely)
        ytrialvel_max = max(LFoot.marVely) + max(LFoot.marVely)*0.10;
    elseif max(LFoot.marVely) < max(RFoot.marVely)
        ytrialvel_max = max(RFoot.marVely) + max(RFoot.marVely)*0.10;
    end
    
    ytrialvel_min = 0;
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    plot(vel_start_end,LThigh.marVely,'b')
    hold on
    plot(vel_start_end,RThigh.marVely,'r')
    xlim([0 4.5]);
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LThigh & RThigh Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(vel_start_end,LLeg.marVely,'b')
    hold on
    plot(vel_start_end,RLeg.marVely,'r')
    xlim([0 4.5]);
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LShank & RShank Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(vel_start_end,LFoot.marVely,'b')
    hold on
    plot(vel_start_end,RFoot.marVely,'r')
%     foot_ylim = ylim;
    xlim([0 4.5]);
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LFoot & RFoot Velocities')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
end

%% Full body kinematic chain acceleration in the y coordinate plane
figure(trial_num + 1000)
plot_acc = true;

%Set ymin and ymax for upper extremities acc plots
ytrialAcc_uppertrunkMax = 0.02;%max(hip.marAccy) + max(hip.marAccy)*0.10;
ytrialAcc_uppertrunkMin = -0.02;%min(hip.marAccy);

%Set ymin and ymax for lower extremities acc plots
if max(LFoot.marAccy) > max(RFoot.marAccy)
    ytrialacc_max = max(LFoot.marAccy) + max(LFoot.marAccy)*0.10;
elseif max(LFoot.marAccy) < max(RFoot.marAccy)
    ytrialacc_max = max(RFoot.marAccy) + max(RFoot.marAccy)*0.10;
end

% ytrialacc_min = 0;
if min(LFoot.marAccy) < min(RFoot.marAccy)
    ytrialacc_min = min(LFoot.marAccy) + min(LFoot.marAccy)*0.10;
elseif min(LFoot.marAccy) > min(RFoot.marAccy)
    ytrialacc_min = min(RFoot.marAccy) + min(RFoot.marAccy)*0.10;
end
    
if plot_acc == true
    %head marker coordinates
    subplot(3,2,1)
    plot(acc_start_end,head.marAccy,'k')
    hold on
    % head_acc_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[head_acc_ylim(1) head_acc_ylim(2)],'b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[head_acc_ylim(1) head_acc_ylim(2)],'Color',[0.78 0.18  0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('Head Accelerations')
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(acc_start_end,chest.marAccy,'k')
    hold on
    % chest_acc_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[chest_acc_ylim(1) chest_acc_ylim(2)],'b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[chest_acc_ylim(1) chest_acc_ylim(2)],'Color',[0.78 0.18  0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('Chest Accelerations')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(acc_start_end,hip.marAccy,'k')
    hold on
    % hip_acc_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[hip_acc_ylim(1) hip_acc_ylim(2)],'b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[hip_acc_ylim(1) hip_acc_ylim(2)],'Color',[0.78 0.18  0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('Hip Accelerations')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    plot(acc_start_end,LThigh.marAccy,'b')
    hold on
    plot(acc_start_end,RThigh.marAccy,'r')
    % thigh_acc_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[thigh_acc_ylim(1) thigh_acc_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[thigh_acc_ylim(1) thigh_acc_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('LThigh & RThigh Accelerations')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(acc_start_end,LLeg.marAccy,'b')
    hold on
    plot(acc_start_end,RLeg.marAccy,'r')
    % leg_acc_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[leg_acc_ylim(1) leg_acc_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[leg_acc_ylim(1) leg_acc_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('LShank & RShank Accelerations')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(acc_start_end,LFoot.marAccy,'b')
    hold on
    plot(acc_start_end,RFoot.marAccy,'r')
    % foot_acc_ylim = ylim;
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[foot_acc_ylim(1) foot_acc_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[foot_acc_ylim(1) foot_acc_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    xlim([0 4.5]);
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    title('LFoot & RFoot Accelerations')
end

%% Full body kinematic chain jerk in the y coordinate plane
figure(trial_num + 10000)
plot_jerk = true;

%Set ymin and ymax for upper extremities acc plots
ytrialJerk_uppertrunkMax = 2*10^(-3);%max(hip.marJerky) + max(hip.marJerky)*0.10;
ytrialJerk_uppertrunkMin = -2*10^(-3);%min(hip.marJerky);

%Set ymin and ymax for lower extremities jerk plots
if max(LFoot.marJerky) > max(RFoot.marJerky)
    ytrialJerk_max = max(LFoot.marJerky) + max(LFoot.marJerky)*0.10;
elseif max(LFoot.marJerky) < max(RFoot.marJerky)
    ytrialJerk_max = max(RFoot.marJerky) + max(RFoot.marJerky)*0.10;
end

% ytrialJerk_min = 0;
if min(LFoot.marJerky) < min(RFoot.marJerky)
    ytrialJerk_min = min(LFoot.marJerky) + min(LFoot.marJerky)*0.10;
elseif min(LFoot.marJerky) > min(RFoot.marJerky)
    ytrialJerk_min = min(RFoot.marJerky) + min(RFoot.marJerky)*0.10;
end
    
if plot_jerk == true
    %head marker coordinates
    subplot(3,2,1)
    plot(jerk_start_end,head.marJerky,'k')
    hold on
    xlim([0 4.5]);
    ylim ([ytrialJerk_uppertrunkMin ytrialJerk_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('Head Jerk')
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(jerk_start_end,chest.marJerky,'k')
    hold on
    xlim([0 4.5]);
    ylim ([ytrialJerk_uppertrunkMin ytrialJerk_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('Chest Jerk')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(jerk_start_end,hip.marJerky,'k')
    hold on
    xlim([0 4.5]);
    ylim ([ytrialJerk_uppertrunkMin ytrialJerk_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('Hip Jerk')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    plot(jerk_start_end,LThigh.marJerky,'b')
    hold on
    plot(jerk_start_end,RThigh.marJerky,'r')
    xlim([0 4.5]);
    ylim ([ytrialJerk_min ytrialJerk_max]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('LThigh & RThigh Jerk')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(jerk_start_end,LLeg.marJerky,'b')
    hold on
    plot(jerk_start_end,RLeg.marJerky,'r')
    xlim([0 4.5]);
    ylim ([ytrialJerk_min ytrialJerk_max]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('LShank & RShank Jerk')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(jerk_start_end,LFoot.marJerky,'b')
    hold on
    plot(jerk_start_end,RFoot.marJerky,'r')
    xlim([0 4.5]);
    ylim ([ytrialJerk_min ytrialJerk_max]);
    xlabel('Time (s)')
    ylabel('Jerk (m/s^3)')
    title('LFoot & RFoot Jerk')
end

end