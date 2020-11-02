function plotMar_vel_acc_jerk(head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot) %,rev_step_TO_HS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the x y z vel, acc, and jerk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set preliminary conditions and parameters
figure(100)

%% Upper trunk kinematic chain visualization normalization
ytrialVel_uppertrunkMax = max(hip.marVely);
ytrialVel_uppertrunkMin = 0;

%Plot all velocities of subject
plot_velocity = true;
if plot_velocity == true
    %head marker coordinates
    subplot(3,2,1)
    plot(head.marVely,'k')
    hold on
    % head_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[head_ylim(1) head_ylim(2)],'Color','b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[head_ylim(1) head_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]); %get foot_vel lim - max = 1.1*ymax of foot
    title('Head Vely')
    xlabel('Number of Frames')
    ylabel('Velocity (m/s)')
    
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(chest.marVely,'k')
    hold on
    % chest_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[chest_ylim(1) chest_ylim(2)],'b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[chest_ylim(1) chest_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Chest Vely')
    xlabel('Number of Frames')
    ylabel('Velocity (m/s)')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(hip.marVely,'k')
    hold on
    % hip_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[hip_ylim(1) hip_ylim(2)],'b')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[hip_ylim(1) hip_ylim(2)],'Color',[0.78 0.18  0.74])
    % end
    ylim ([ytrialVel_uppertrunkMin ytrialVel_uppertrunkMax]);
    title('Hip Vely')
    xlabel('Number of Frames')
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
    plot(LThigh.marVely,'b')
    hold on
    plot(RThigh.marVely,'r')
    % thigh_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[thigh_ylim(1) thigh_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[thigh_ylim(1) thigh_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LThigh & RThigh Velx')
    xlabel('Number of Frames')
    ylabel('Velocity (m/s)')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(LLeg.marVely,'b')
    hold on
    plot(RLeg.marVely,'r')
    % leg_ylim = ylim;
    % %toe strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[leg_ylim(1) leg_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[leg_ylim(1) leg_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LShank & RShank Velx')
    xlabel('Number of Frames')
    ylabel('Velocity (m/s)')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(LFoot.marVely,'b')
    hold on
    plot(RFoot.marVely,'r')
    foot_ylim = ylim;
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[foot_ylim(1) foot_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[foot_ylim(1) foot_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialvel_min ytrialvel_max]);
    title('LFoot & RFoot Velx')
    xlabel('Number of Frames')
    ylabel('Velocity (m/s)')

end

%% Acceleration for markers in the x coordinate frames
figure(1232)
plot_acc = true;

%Set ymin and ymax for upper extremities acc plots
ytrialAcc_uppertrunkMax = max(hip.marAccy);
ytrialAcc_uppertrunkMin = 0;

%Set ymin and ymax for lower extremities acc plots
if max(LFoot.marAccy) > max(RFoot.marAccy)
    ytrialacc_max = max(LFoot.marAccy);
elseif max(LFoot.marAccy) < max(RFoot.marAccy)
    ytrialacc_max = max(RFoot.marAccy);
end

ytrialacc_min = 0;
    
if plot_acc == true
    %head marker coordinates
    subplot(3,2,1)
    plot(head.marAccy,'k')
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
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('Head Accy')
    
    %chest marker coordinates
    subplot(3,2,3)
    plot(chest.marAccy,'k')
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
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('Chest Accy')
    
    %hip marker coordinates
    subplot(3,2,5)
    plot(hip.marAccy,'k')
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
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('Hip Accy')
    
    %LThigh & RThigh marker overlayed
    subplot(3,2,2)
    plot(LThigh.marAccy,'b')
    hold on
    plot(RThigh.marAccy,'r')
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
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('LThigh & RThigh Accy')
    
    %LLeg & RLeg marker overlayed
    subplot(3,2,4)
    plot(LLeg.marAccy,'b')
    hold on
    plot(RLeg.marAccy,'r')
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
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('LLeg & RLeg Accy')
    
    %LFoot & RFoot marker overlayed
    subplot(3,2,6)
    plot(LFoot.marAccy,'b')
    hold on
    plot(RFoot.marAccy,'r')
    % foot_acc_ylim = ylim;
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,1) rev_step_TO_HS(ii,1)],[foot_acc_ylim(1) foot_acc_ylim(2)],'k')
    % end
    % %heel strike
    % for ii = 1:length(rev_step_TO_HS)
    %     plot([rev_step_TO_HS(ii,2) rev_step_TO_HS(ii,2)],[foot_acc_ylim(1) foot_acc_ylim(2)],'Color',[0.78 0.18 0.74])
    % end
    ylim ([ytrialacc_min ytrialacc_max]);
    xlabel('Number of Frames')
    ylabel('Acc (m/s^2)')
    title('LFoot & RFoot Accy')
end
end