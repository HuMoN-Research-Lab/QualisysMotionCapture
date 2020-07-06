function [LHipJointCenter] = jointCenterOpt(segCenter_cal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Optimize all joint center location 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDs of markers in use
%LMarkers
LHipFront =     segCenter_cal.LHipFront_loc_fil;
LHipBack =      segCenter_cal.LHipBack_loc_fil;
LHipCenter =    segCenter_cal.LHipCenter_loc_fil;
LThigh =        segCenter_cal.LThigh_loc_fil;
LKnee =         segCenter_cal.LKnee_loc_fil;
LLeg =          segCenter_cal.LLeg_loc_fil;
LAnkle =        segCenter_cal.LAnkle_loc_fil;
LFoot =         segCenter_cal.LFoot_loc_fil;
LToeTip =       segCenter_cal.LToeTip_loc_fil;

%RMarkers
RHipFront =     segCenter_cal.RHipFront_loc_fil;
RHipBack =      segCenter_cal.RHipBack_loc_fil;
RHipCenter =    segCenter_cal.RHipCenter_loc_fil;
RThigh =        segCenter_cal.RThigh_loc_fil;
RKnee =         segCenter_cal.RKnee_loc_fil;
RLeg =          segCenter_cal.RLeg_loc_fil;
RAnkle =        segCenter_cal.RAnkle_loc_fil;
RFoot =         segCenter_cal.RFoot_loc_fil;
RToeTip =       segCenter_cal.RToeTip_loc_fil;

%% Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A =     [];
b =     [];
Aeq =   [];
beq =   [];
lb =    0;
ub =    1;

%% Joint ref loc and initial guess for LHipJointCenter
%Weights for markers
weights = {0.40 0.30 0.30};

%Acquire mean location of markers around hip joint
% [LHipJointMarkers_mean] = joint_ref_loc(LHipFront,LHipBack,LThigh);

%Starting point of JointCenter guess that initiates optimizer
initialGuess =  [0;0;0];
figNum =        132435;

v = VideoWriter('LHip Segment Length Optimization.mp4');

%First marker to evaluate joint center is LHipCenter marker (input1)
%LHipJointCenterGuess = average loc using select markers (input2)

LHipJointCenterError = @(LHipJointCenterGuess) JointCenterErrorFun(LHipCenter,...
    LHipFront,LHipBack,LThigh,v,figNum,weights);
close(v)

%First attempt
% LHipJointCenterError = @(LHipJointCenterGuess) JointCenterErrorFun(LHipCenter, LHipJointCenterGuess, LHipJointMarkers_mean,v,figNum,weights);

%% Initiates optimizer and calibrates results
%jointCenter difference = Optimized joint center loc in x,y,z
[LHipJointCenterDifference, LHipJointCenterError_final] = fmincon(LHipJointCenterError,initialGuess,A,b,Aeq,beq,lb,ub,[],opts);

%Calibrates results considering initialGuess
LHipJointCenter = [(LHipJointCenterDifference(1)+LHipJointMarkers_mean(1,:));...
    (LHipJointCenterDifference(2)+LHipJointMarkers_mean(2,:));...
    (LHipJointCenterDifference(3)+LHipJointMarkers_mean(3,:))]; 

%% Joint ref loc and initial guess for RHipJointCenter
%Acquire mean location of markers around hip joint
[RHipJointMarkers_mean] = joint_ref_loc(RHipFront,RHipBack,RThigh);

%Starting point of JointCenter guess that initiates optimizer
initialGuess =  [0;0;0];
figNum =        49586;

w = VideoWriter('RHip Segment Length Optimization.mp4');

%First marker to evaluate joint center is RHipCenter marker (input1)
%RHipJointCenterGuess = average loc using select markers (input2)
RHipJointCenterError = @(RHipJointCenterGuess) JointCenterErrorFun(RHipCenter, RHipJointCenterGuess, RHipJointMarkers_mean,w,figNum);
close(v)

%% Initiates optimizer and calibrates results
%jointCenter difference = Optimized joint center loc in x,y,z
[RHipJointCenterDifference, RHipJointCenterError_final] = fmincon(RHipJointCenterError,initialGuess,A,b,Aeq,beq,lb,ub,[],opts);

%Calibrates results considering initialGuess
RHipJointCenter = [(RHipJointCenterDifference(1)+RHipJointMarkers_mean(1,:));...
    (RHipJointCenterDifference(2)+RHipJointMarkers_mean(2,:));...
    (RHipJointCenterDifference(3)+RHipJointMarkers_mean(3,:))]; 

%% Visual representation of accuracy
figure(7447)
stepA = VideoWriter('Joint Center Optimization Results.mp4');
open(stepA);
plot_segCenters = true;
plot_markers = true;

for ii = 1:20:length(LHipCenter)
    clf
    %    plot3([LHip(1,ii);LThigh(1,ii);LKnee(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
    %         [LHip(2,ii);LThigh(2,ii);LKnee(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
    %         [LHip(3,ii);LThigh(3,ii);LKnee(3,ii)],'b.','MarkerSize',15)                          %;LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)]
    
    plot3(LHipJointCenter(1,ii),LHipJointCenter(2,ii),...
        LHipJointCenter(3,ii),'r.','MarkerSize',12)
    hold on
    
    plot3(RHipJointCenter(1,ii),RHipJointCenter(2,ii),...
        RHipJointCenter(3,ii),'r.','MarkerSize',12)
    
    if plot_markers == true
        %LMarkers
        plot3(LHipFront(1,ii),LHipFront(2,ii),LHipFront(3,ii),'k.','MarkerSize',5)
        plot3(LHipBack(1,ii),LHipBack(2,ii),LHipBack(3,ii),'k.','MarkerSize',5)
        plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',5);
        plot3(LAnkle(1,ii),LAnkle(2,ii),LAnkle(3,ii),'k.','MarkerSize',5);
        plot3(LToeTip(1,ii),LToeTip(2,ii),LToeTip(3,ii),'k.','MarkerSize',5);
    
        %RMarkers
        hold on
        plot3(RHipFront(1,ii),RHipFront(2,ii),RHipFront(3,ii),'k.','MarkerSize',5)
        plot3(RHipBack(1,ii),RHipBack(2,ii),RHipBack(3,ii),'k.','MarkerSize',5)
        plot3(RKnee(1,ii),RKnee(2,ii),RKnee(3,ii),'k.','MarkerSize',5);
        plot3(RAnkle(1,ii),RAnkle(2,ii),RAnkle(3,ii),'k.','MarkerSize',5);
        plot3(RToeTip(1,ii),RToeTip(2,ii),RToeTip(3,ii),'k.','MarkerSize',5);
    end
    
    if plot_segCenters == true
        %LSegCenters
        plot3(LHipCenter(1,ii),LHipCenter(2,ii),LHipCenter(3,ii),'g.','MarkerSize',5)
        plot3(LThigh(1,ii),LThigh(2,ii),LThigh(3,ii),'g.','MarkerSize',5)
        plot3(LLeg(1,ii),LLeg(2,ii),LLeg(3,ii),'g.','MarkerSize',5);
        plot3(LFoot(1,ii),LFoot(2,ii),LFoot(3,ii),'g.','MarkerSize',5);
    
        %RSegCenters
        plot3(RHipCenter(1,ii),RHipCenter(2,ii),RHipCenter(3,ii),'g.','MarkerSize',5)
        plot3(RThigh(1,ii),RThigh(2,ii),RThigh(3,ii),'g.','MarkerSize',5)
        plot3(RLeg(1,ii),RLeg(2,ii),RLeg(3,ii),'g.','MarkerSize',5);
        plot3(RFoot(1,ii),RFoot(2,ii),RFoot(3,ii),'g.','MarkerSize',5);
        
%         plot3(RThigh(1,ii),RThigh(2,ii),RThigh(3,ii),'g.','MarkerSize',5)
%         plot3(RLeg(1,ii),RLeg(2,ii),RLeg(3,ii),'g.','MarkerSize',5);
%         plot3(RFoot(1,ii),RFoot(2,ii),RFoot(3,ii),'g.','MarkerSize',5);
    end
    
    
    axis equal
    grid on
    
    xlim([0 2e3])
    ylim([-5e3 10e3])
    zlim([0 3e3])
    az = -30.8155;
    el = 6.8338;
    %     %Find az and el values of the current plot
    %     [az,el] = view
    view(az,el)
%     legend('LHip','LThigh','LKnee','LHip Joint Center')
    drawnow
    
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end
close(stepA)


end