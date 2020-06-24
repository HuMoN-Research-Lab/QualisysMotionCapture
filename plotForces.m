function plotForces(Force,trial_start_end,marker_mar_dim_frame,markerLabels)%,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the force output for the force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish initial conditions
figure(325);
RKnee_loc = 	getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_locx =    RKnee_loc(2,:);
RKnee_locy =    RKnee_loc(3,:);

RAnkle_loc = 	getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RAnkle_locx =   RAnkle_loc(2,:);
RAnkle_locy =   RAnkle_loc(3,:);

RFoot_loc =     getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RFoot_locx =    RFoot_loc(2,:);
RFoot_locy =    RFoot_loc(3,:);

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

%% Plot combined force plate data
plot_combined_FPlates = true;
if plot_combined_FPlates == true
    plot(fp3)
    title('Force Plate Data')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    plot(fp1);
    plot(fp2);
    plot(fp5);
    
    plot(RKnee_locx,RKnee_locy)
    plot(RAnkle_locx,RAnkle_locy)
    plot(RFoot_locx,RFoot_locy)
%     plot(RAnkle_loc(2:3,:))
%     plot(RFoot_loc(2:3,:))
%     hold off

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