function plot_mar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot,trial_num,vel_start_end,acc_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the x y z vel, acc, and jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set preliminary conditions and parameters
figure(trial_num + 100)

%% Upper trunk kinematic chain visualization normalization
ytrialVel_uppertrunkMax = max(hip.marVely);
ytrialVel_uppertrunkMin = 0;

%Plot all velocities of subject
plot_velocity = true;
if plot_velocity == true
    %head marker coordinates
    subplot(3,2,1)
    plot(vel_start_end,head.marVely,'k') %timestamp addition before head. give time in seconds
    %time = 1:length(markerVely)/framerate
    hold on
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head Vely')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(vel_start_end,chest.marVely,'k')
    hold on
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Chest Vely')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(vel_start_end,hip.marVely,'k')
    hold on
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Hip Vely')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')

    %Initial conditions for lower trunk kinematic chain normalization
    %Set ymin and ymax for vel plots
    if max(LFoot.marVely) > max(RFoot.marVely)
        ytrialvel_max = max(LFoot.marVely);
    elseif max(LFoot.marVely) < max(RFoot.marVely)
        ytrialvel_max = max(RFoot.marVely);
    end
    
    ytrialvel_min = 0;
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    plot(vel_start_end,LThigh.marVely,'b')
    hold on
    plot(vel_start_end,RThigh.marVely,'r')
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LThigh & RThigh Velx')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(vel_start_end,LLeg.marVely,'b')
    hold on
    plot(vel_start_end,RLeg.marVely,'r')
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LShank & RShank Velx')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(vel_start_end,LFoot.marVely,'b')
    hold on
    plot(vel_start_end,RFoot.marVely,'r')
    foot_ylim = ylim;
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LFoot & RFoot Velx')
    xlabel('Time (s)')
    ylabel('Velocity (m/s)')
end

%% Acceleration for markers in the x coordinate frames
figure(trial_num + 1000)
plot_acc = true;

%Set ymin and ymax for upper extremities acc plots
ytrialAcc_uppertrunkMax = max(hip.marAccy);
ytrialAcc_uppertrunkMin = min(hip.marAccy);

%Set ymin and ymax for lower extremities acc plots
if max(LFoot.marAccy) > max(RFoot.marAccy)
    ytrialacc_max = max(LFoot.marAccy);
elseif max(LFoot.marAccy) < max(RFoot.marAccy)
    ytrialacc_max = max(RFoot.marAccy);
end

% ytrialacc_min = 0;
if min(LFoot.marAccy) < min(RFoot.marAccy)
    ytrialacc_min = min(LFoot.marAccy);
elseif min(LFoot.marAccy) > min(RFoot.marAccy)
    ytrialacc_min = min(RFoot.marAccy);
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
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('Head Accy')
    
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
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('Chest Accy')
    
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
    ylim ([ytrialAcc_uppertrunkMin ytrialAcc_uppertrunkMax]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('Hip Accy')
    
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
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('LThigh & RThigh Accy')
    
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
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('LLeg & RLeg Accy')
    
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
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Time (s)')
    ylabel('Acc (m/s^2)')
    title('LFoot & RFoot Accy')
end
end