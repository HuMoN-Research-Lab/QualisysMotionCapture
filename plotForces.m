function plotForces(Force,trial_start_end,segCenter,marker_mar_dim_frame,markerLabels)%,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the force output for the force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish and reformat data
RHip_loc_unfil_all = 	segCenter.RHipCenter_mar_dim_frame;
RHip_locX_unfil =       RHip_loc_unfil_all(1,:);
RHip_locY_unfil =       RHip_loc_unfil_all(2,:);
RHip_locZ_unfil =       RHip_loc_unfil_all(3,:);
RHip_loc_fil =          RHip_locX_unfil(trial_start_end);
RHip_loc_fil(2,:) =     RHip_locY_unfil(trial_start_end);
RHip_loc_fil(3,:) =     RHip_locZ_unfil(trial_start_end);

RKnee_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_locX_unfil =      RKnee_loc_unfil_all(1,:);
RKnee_locY_unfil =      RKnee_loc_unfil_all(2,:);
RKnee_locZ_unfil =      RKnee_loc_unfil_all(3,:);
RKnee_loc_fil =         RKnee_locX_unfil(trial_start_end);
RKnee_loc_fil(2,:) =    RKnee_locY_unfil(trial_start_end);
RKnee_loc_fil(3,:) =    RKnee_locZ_unfil(trial_start_end);

RAnkle_loc_unfil_all =  getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RAnkle_locX_unfil =     RAnkle_loc_unfil_all(1,:);
RAnkle_locY_unfil =     RAnkle_loc_unfil_all(2,:);
RAnkle_locZ_unfil =     RAnkle_loc_unfil_all(3,:);
RAnkle_loc_fil =        RAnkle_locX_unfil(trial_start_end);
RAnkle_loc_fil(2,:) =   RAnkle_locY_unfil(trial_start_end);
RAnkle_loc_fil(3,:) =   RAnkle_locZ_unfil(trial_start_end);

RFoot_loc_unfil_all =   getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RFoot_locX_unfil =      RFoot_loc_unfil_all(1,:);
RFoot_locY_unfil =      RFoot_loc_unfil_all(2,:);
RFoot_locZ_unfil =      RFoot_loc_unfil_all(3,:);
RFoot_loc_fil =         RFoot_locX_unfil(trial_start_end);
RFoot_loc_fil(2,:) =    RFoot_locY_unfil(trial_start_end);
RFoot_loc_fil(3,:) =    RFoot_locZ_unfil(trial_start_end);

%% Force data filtering and configuration
forceConfig1 = Force.force_plate1(3,:);
forceConfig2 = Force.force_plate2(3,:);
forceConfig3 = Force.force_plate3(3,:);
% forceConfig4 = Force.force_plate4(3,:);
forceConfig5 = Force.force_plate5(3,:);

fp1 = forceConfig1(trial_start_end);
fp2 = forceConfig2(trial_start_end);
fp3 = forceConfig3(trial_start_end);
% fp4 = forceConfig4(trial_start_end);
fp5 = forceConfig5(trial_start_end);

%% COP force data filtering and configuration
COPConfig1 = Force.COP_plate1(3,:);
COPConfig2 = Force.COP_plate2(3,:);
COPConfig3 = Force.COP_plate3(3,:);
% COPConfig4 = Force.COP_plate4(3,:);
COPConfig5 = Force.COP_plate5(3,:);

COP1 = COPConfig1(trial_start_end);
COP2 = COPConfig2(trial_start_end);
COP3 = COPConfig3(trial_start_end);
% COP4 = COPConfig4(trial_start_end);
COP5 = COPConfig5(trial_start_end);

%% Plot marker step
% numFrames = 1760;
% f = figure(325);
% f.Units = 'normalized';
% f.Position = [-0.0042 0.4306 0.9401 0.4741];
% ylim([0 1200]);
% %Create video with frames
% stepA = VideoWriter('LowerExtremityROM.mp4');
% open(stepA);
% 
% for ii = 1:15:numFrames
%     hold on
%     plot3(RHip_loc_fil(2,ii),RHip_loc_fil(3,ii),'ko')
% %     plot(RKnee_loc_fil(2,ii),RKnee_loc_fil(3,ii),'ko')
% %     plot(RAnkle_loc_fil(2,ii),RAnkle_loc_fil(3,ii),'ro')
% %     plot(RFoot_loc_fil(2,ii),RFoot_loc_fil(3,ii),'bo')
%     plot(fp3(ii),'ko')
%     plot(fp1(ii),'ko')
%     plot(fp2(ii),'ko')
%     plot(fp5(ii),'ko')
%     frame = getframe(gcf);
%     writeVideo(stepA,frame);
% end
% title('Lower Extremity Position vs. Time')
% xlabel('Time')
% ylabel('Marker Position')
% close(stepA)
%% Plot lower extremities position data
plot_lowExtrems = true;
if plot_lowExtrems == true
    figure(23232)
    plot(RHip_loc_fil(2,:),RHip_loc_fil(3,:),'ko')
    hold on
    plot(RKnee_loc_fil(2,:),RKnee_loc_fil(3,:),'ko')
    plot(RAnkle_loc_fil(2,:),RAnkle_loc_fil(3,:),'ko')
    plot(RFoot_loc_fil(2,:),RFoot_loc_fil(3,:),'ko')
    title('Lower Extremities Position Data')
    xlabel('Position of X')
    ylabel('Marker Cartisian Position')
end

%% Plot combined force plate data
plot_combined_FPlates = true;
if plot_combined_FPlates == true
    figure(54322)
    plot(fp3)
    title('Force Plate Data')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    plot(fp1);
    plot(fp2);
    plot(fp5);
    
%     plot(RKnee_locx,RKnee_locy)
%     plot(RAnkle_locx,RAnkle_locy)
%     plot(RFoot_locx,RFoot_locy)
%     plot(RAnkle_loc(2:3,:))
%     plot(RFoot_loc(2:3,:))
%     hold off
    hold off
end

%% Plot individual force plate data
plot_individual_FPlates = false;
if plot_individual_FPlates == true
    
    %First force plate
    subplot(4,1,1)
    plot(fp3);
    title('Force Plate #1')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    
    %Second force plate
    subplot(4,1,2)
    plot(fp1);
    title('Force Plate #2')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    
    %Third force plate
    subplot(4,1,3)
    plot(fp2);
    title('Force Plate #3')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    
    %Fourth force plate
    subplot(4,1,4)
    plot(fp5);
    title('Force Plate #4')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    
    % %Fifth force plate
    % subplot(5,1,5)
    % plot(fp5);
    % title('Force Plate #5')
    % hold on
end

end