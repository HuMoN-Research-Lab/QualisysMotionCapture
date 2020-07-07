function [jointCenters] = jointCenterOpt(segCenter_cal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Optimize all joint center location 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDs of markers in use
%Upper markers & segCenters
HeadL =             segCenter_cal.HeadL_loc_fil;
HeadTop =           segCenter_cal.HeadTop_loc_fil;
HeadR =             segCenter_cal.HeadR_loc_fil;
HeadFront =         segCenter_cal.HeadFront_loc_fil;
HeadCenter =        segCenter_cal.HeadCenter_loc_fil;
SpineTop =          segCenter_cal.SpineTop_loc_fil;
ChestCenter =       segCenter_cal.ChestCenter_loc_fil;

%LUpper markers & segCenters
LShoulderTop =      segCenter_cal.LShoulderTop_loc_fil;
LShoulderCenter =   segCenter_cal.LShoulderCenter_loc_fil;
LShoulderBack =     segCenter_cal.LShoulderBack_loc_fil;
LArm =              segCenter_cal.LArm_loc_fil;
LUpperArmCenter =   segCenter_cal.LUpperArmCenter_loc_fil;
LElbow =            segCenter_cal.LElbow_loc_fil;
LForearmCenter =    segCenter_cal.LForearmCenter_loc_fil;
LWristOut =         segCenter_cal.LWristOut_loc_fil;
LWristIn =          segCenter_cal.LWristIn_loc_fil;
LHandOut =          segCenter_cal.LHandOut_loc_fil;
LHandCenter =       segCenter_cal.LHandCenter_loc_fil;

%LLower markers & segCenters
LHipFront =         segCenter_cal.LHipFront_loc_fil;
LHipBack =          segCenter_cal.LHipBack_loc_fil;
LHipCenter =        segCenter_cal.LHipCenter_loc_fil;
LThigh =            segCenter_cal.LThigh_loc_fil;
LKnee =             segCenter_cal.LKnee_loc_fil;
LLeg =              segCenter_cal.LLeg_loc_fil;
LAnkle =            segCenter_cal.LAnkle_loc_fil;
LFoot =             segCenter_cal.LFoot_loc_fil;
LToeTip =           segCenter_cal.LToeTip_loc_fil;

%RUpper markers & segCenters
RShoulderTop =      segCenter_cal.RShoulderTop_loc_fil;
RShoulderCenter =   segCenter_cal.RShoulderCenter_loc_fil;
RShoulderBack =     segCenter_cal.RShoulderBack_loc_fil;
RArm =              segCenter_cal.RArm_loc_fil;
RUpperArmCenter =   segCenter_cal.RUpperArmCenter_loc_fil;
RElbow =            segCenter_cal.RElbow_loc_fil;
RForearmCenter =    segCenter_cal.RForearmCenter_loc_fil;
RWristOut =         segCenter_cal.RWristOut_loc_fil;
RWristIn =          segCenter_cal.RWristIn_loc_fil;
RHandOut =          segCenter_cal.RHandOut_loc_fil;
RHandCenter =       segCenter_cal.RHandCenter_loc_fil;

%RLower markers & segCenters
RHipFront =         segCenter_cal.RHipFront_loc_fil;
RHipBack =          segCenter_cal.RHipBack_loc_fil;
RHipCenter =        segCenter_cal.RHipCenter_loc_fil;
RThigh =            segCenter_cal.RThigh_loc_fil;
RKnee =             segCenter_cal.RKnee_loc_fil;
RLeg =              segCenter_cal.RLeg_loc_fil;
RAnkle =            segCenter_cal.RAnkle_loc_fil;
RFoot =             segCenter_cal.RFoot_loc_fil;
RToeTip =           segCenter_cal.RToeTip_loc_fil;

%% Activation settings for optimizer of joint centers
lookfor_LHipJointCenter =       false;
lookfor_LKneeJointCenter =      false;
lookfor_LAnkleJointCenter =     false;
lookfor_RHipJointCenter =       false;
lookfor_RKneeJointCenter =      false;
lookfor_RAnkleJointCenter =     false;

%% Activation settings for plotting markers and segCenters
plot_segCenters =   false;
plot_markers =      false;
plot_LExtr =        false;
plot_skeleton =     true;

%Attempt to plot markers on top of each other
if plot_LExtr == true
    figure(10);
    stepA = VideoWriter('Lower Extremities Motion Tracker.mp4');
    open(stepA);
    
    for jj = 1:10:length(LHipCenter)
        hold on
        
        %Tracer for the movement of lower extremities
        plot3([LHipCenter(1,jj);LThigh(1,jj);LKnee(1,jj);LAnkle(1,jj);LFoot(1,jj);LToeTip(1,jj)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [LHipCenter(2,jj);LThigh(2,jj);LKnee(2,jj);LAnkle(2,jj);LFoot(2,jj);LToeTip(2,jj)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [LHipCenter(3,jj);LThigh(3,jj);LKnee(3,jj);LAnkle(3,jj);LFoot(3,jj);LToeTip(3,jj)],'-k','MarkerSize',15)
        pause(0.5);
        %Real-time movement of lower extremities
        plot3([LHipCenter(1,jj);LThigh(1,jj);LKnee(1,jj);LAnkle(1,jj);LFoot(1,jj);LToeTip(1,jj)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [LHipCenter(2,jj);LThigh(2,jj);LKnee(2,jj);LAnkle(2,jj);LFoot(2,jj);LToeTip(2,jj)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [LHipCenter(3,jj);LThigh(3,jj);LKnee(3,jj);LAnkle(3,jj);LFoot(3,jj);LToeTip(3,jj)],'-b','MarkerSize',15)                          %;LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)]
        
        axis equal
        grid on
        xlim([0 2e3])
        ylim([-5e3 10e3])
        zlim([0 3e3])
        %left side view
        az = -88.5681;
        el = 0.7189;
        view(az,el)
        drawnow
        frame = getframe(gcf);
        writeVideo(stepA,frame);
    end
    close(stepA)
end

%% Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A =     [];
b =     [];
Aeq =   [];
beq =   [];
lb =    0;
ub =    1;

%% Joint ref loc and initial guess for LHipJointCenter
%Respective markers around jointCenter
if lookfor_LHipJointCenter == true
    marker1 = LHipFront;
    marker2 = LHipBack;
    marker3 = LThigh;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.40;0.30;0.30];
    figNum =                132435;
    
    % v = VideoWriter('LHip Segment Length Optimization.mp4');
    
    %LHipCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LHipJointCenterError = @(weights) JointCenterErrorFun(LHipCenter,...
        marker1,marker2,marker3,figNum,weights);
    % close(v)
    
    %First attempt
    % LHipJointCenterError = @(LHipJointCenterGuess) JointCenterErrorFun(LHipCenter, LHipJointCenterGuess, LHipJointMarkers_mean,v,figNum,weights);
    
    %Optimizer for LHipJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LHipWeights, LHipJointCenterError_final] = fmincon(LHipJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*LHipWeights(1);
    weightedMarker2 = marker2*LHipWeights(2);
    weightedMarker3 = marker3*LHipWeights(3);
    LHipJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3; 
    
    jointCenters.LHipWeights =      LHipWeights;
    jointCenters.LHipJointCenter =  LHipJointCenter;
end

%% Joint ref loc and initial guess for RHipJointCenter
if lookfor_RHipJointCenter == true
    %Acquire mean location of markers around hip joint
    marker1 = RHipFront;
    marker2 = RHipBack;
    marker3 = RThigh;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.40;0.30;0.30];
    figNum =                49586;
    
    w = VideoWriter('RHip Segment Length Optimization.mp4');
    
    %RHipCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RHipJointCenterError = @(weights) JointCenterErrorFun(RHipCenter,...
        marker1,marker2,marker3,figNum,weights);
    
    %Optimizer for RHipJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RHipWeights, RHipJointCenterError_final] = fmincon(RHipJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*RHipWeights(1);
    weightedMarker2 = marker2*RHipWeights(2);
    weightedMarker3 = marker3*RHipWeights(3);
    RHipJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3;
    
    jointCenters.RHipWeights =      RHipWeights;
    jointCenters.RHipJointCenter =  RHipJointCenter;
end

%% Joint ref loc and initial guess for LKneeJointCenter
if lookfor_LKneeJointCenter == true
    %Acquire mean location of markers around hip joint
    marker1 = LKnee;
    marker2 = LLeg;
    marker3 = LAnkle;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.30;0.40;0.30];
    figNum =                49586;
    
    % y = VideoWriter('LKnee Segment Length Optimization.mp4');
    
    %LKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LKneeJointCenterError = @(weights) JointCenterErrorFun(LKnee,...
        marker1,marker2,marker3,figNum,weights);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LKneeWeights, LKneeJointCenterError_final] = fmincon(LKneeJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*LKneeWeights(1);
    weightedMarker2 = marker2*LKneeWeights(2);
    weightedMarker3 = marker3*LKneeWeights(3);
    LKneeJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3;
    
    jointCenters.LKneeWeights =         LKneeWeights;
    jointCenters.LKneeJointCenter =     LKneeJointCenter;
end

%% Joint ref loc and initial guess for RKneeJointCenter
if lookfor_RKneeJointCenter == true
    %Acquire mean location of markers around hip joint
    marker1 = RKnee;
    marker2 = RLeg;
    marker3 = RAnkle;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.30;0.40;0.30];
    figNum =                49586;
    
    % y = VideoWriter('RKnee Segment Length Optimization.mp4');
    
    %RKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RKneeJointCenterError = @(weights) JointCenterErrorFun(RKnee,...
        marker1,marker2,marker3,figNum,weights);
    
    %Optimizer for RKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RKneeWeights, RKneeJointCenterError_final] = fmincon(RKneeJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*RKneeWeights(1);
    weightedMarker2 = marker2*RKneeWeights(2);
    weightedMarker3 = marker3*RKneeWeights(3);
    RKneeJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3;
    
    jointCenters.RKneeWeights =         RKneeWeights;
    jointCenters.RKneeJointCenter =     RKneeJointCenter;
end

%% Joint ref loc and initial guess for LAnkleJointCenter
if lookfor_LAnkleJointCenter == true
    %Acquire mean location of markers around hip joint
    marker1 = LAnkle;
    marker2 = LFoot;
    marker3 = LToeTip;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.30;0.40;0.30];
    figNum =                49586;
    
    % y = VideoWriter('LKnee Segment Length Optimization.mp4');
    
    %LKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LAnkleJointCenterError = @(weights) JointCenterErrorFun(LAnkle,...
        marker1,marker2,marker3,figNum,weights);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LAnkleWeights, LAnkleJointCenterError_final] = fmincon(LAnkleJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*LAnkleWeights(1);
    weightedMarker2 = marker2*LAnkleWeights(2);
    weightedMarker3 = marker3*LAnkleWeights(3);
    LAnkleJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3;
    
    jointCenters.LAnkleWeights =        LAnkleWeights;
    jointCenters.LAnkleJointCenter =    LAnkleJointCenter;
end

%% Joint ref loc and initial guess for LAnkleJointCenter
if lookfor_RAnkleJointCenter == true
    %Acquire mean location of markers around ankle
    marker1 = RAnkle;
    marker2 = RFoot;
    marker3 = RToeTip;
    
    %Starting point of JointCenter guess that initiates optimizer
    initialWeightsGuess =   [0.30;0.40;0.30];
    figNum =                49586;
    
    % y = VideoWriter('RAnkle Segment Length Optimization.mp4');
    
    %LKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RAnkleJointCenterError = @(weights) JointCenterErrorFun(RAnkle,...
        marker1,marker2,marker3,figNum,weights);
    
    %Optimizer for RAnkleJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RAnkleWeights, RAnkleJointCenterError_final] = fmincon(RAnkleJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    weightedMarker1 = marker1*RAnkleWeights(1);
    weightedMarker2 = marker2*RAnkleWeights(2);
    weightedMarker3 = marker3*RAnkleWeights(3);
    RAnkleJointCenter = weightedMarker1 + weightedMarker2 + weightedMarker3;
    
    jointCenters.RAnkleWeights =        RAnkleWeights;
    jointCenters.RAnkleJointCenter =    RAnkleJointCenter;
end

%% Visual representation of markers and segCenters w/ jointCenters
figure(7447)
stepA = VideoWriter('Skeleton Motion Capture with Joint Centers.mp4');
open(stepA);

for ii = 1:5:length(LHipCenter)
    clf
    hold on
    
    if lookfor_LHipJointCenter == true
        plot3(LHipJointCenter(1,ii),LHipJointCenter(2,ii),...
            LHipJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_LAnkleJointCenter == true
        plot3(LAnkleJointCenter(1,ii),LAnkleJointCenter(2,ii),...
            LAnkleJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_LKneeJointCenter == true
        plot3(LKneeJointCenter(1,ii),LKneeJointCenter(2,ii),...
            LKneeJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RHipJointCenter == true
        plot3(RHipJointCenter(1,ii),RHipJointCenter(2,ii),...
            RHipJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_RKneeJointCenter == true
        plot3(RKneeJointCenter(1,ii),RKneeJointCenter(2,ii),...
            RKneeJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_RAnkleJointCenter == true
        plot3(RAnkleJointCenter(1,ii),RAnkleJointCenter(2,ii),...
            RAnkleJointCenter(3,ii),'r.','MarkerSize',12)
    end
    
    if plot_markers == true
        %Upper markers
        plot3(HeadL(1,ii),HeadL(2,ii),HeadL(3,ii),'k.','MarkerSize',5)
        plot3(HeadTop(1,ii),HeadTop(2,ii),HeadTop(3,ii),'k.','MarkerSize',5)
        plot3(HeadR(1,ii),HeadR(2,ii),HeadR(3,ii),'k.','MarkerSize',5)
        plot3(HeadFront(1,ii),HeadFront(2,ii),HeadFront(3,ii),'k.','MarkerSize',5)
        
        %LUpper Markers
        plot3(LShoulderTop(1,ii),LShoulderTop(2,ii),LShoulderTop(3,ii),'k.','MarkerSize',5)
        plot3(LShoulderBack(1,ii),LShoulderBack(2,ii),LShoulderBack(3,ii),'k.','MarkerSize',5)
        plot3(LArm(1,ii),LArm(2,ii),LArm(3,ii),'k.','MarkerSize',5)
        plot3(LElbow(1,ii),LElbow(2,ii),LElbow(3,ii),'k.','MarkerSize',5)
        plot3(LWristOut(1,ii),LWristOut(2,ii),LWristOut(3,ii),'k.','MarkerSize',5)
        plot3(LWristIn(1,ii),LWristIn(2,ii),LWristIn(3,ii),'k.','MarkerSize',5)
        plot3(LHandOut(1,ii),LHandOut(2,ii),LHandOut(3,ii),'k.','MarkerSize',5)
        
        %LLower Markers
        plot3(LHipFront(1,ii),LHipFront(2,ii),LHipFront(3,ii),'k.','MarkerSize',5)
        plot3(LHipBack(1,ii),LHipBack(2,ii),LHipBack(3,ii),'k.','MarkerSize',5)
        plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',5);
        plot3(LAnkle(1,ii),LAnkle(2,ii),LAnkle(3,ii),'k.','MarkerSize',5);
        plot3(LToeTip(1,ii),LToeTip(2,ii),LToeTip(3,ii),'k.','MarkerSize',5);
    
        %RUpper Markers
        plot3(RShoulderTop(1,ii),RShoulderTop(2,ii),RShoulderTop(3,ii),'k.','MarkerSize',5)
        plot3(RShoulderBack(1,ii),RShoulderBack(2,ii),RShoulderBack(3,ii),'k.','MarkerSize',5)
        plot3(RArm(1,ii),RArm(2,ii),RArm(3,ii),'k.','MarkerSize',5)
        plot3(RElbow(1,ii),RElbow(2,ii),RElbow(3,ii),'k.','MarkerSize',5)
        plot3(RWristOut(1,ii),RWristOut(2,ii),RWristOut(3,ii),'k.','MarkerSize',5)
        plot3(RWristIn(1,ii),RWristIn(2,ii),RWristIn(3,ii),'k.','MarkerSize',5)
        plot3(RHandOut(1,ii),RHandOut(2,ii),RHandOut(3,ii),'k.','MarkerSize',5)
        
        %RLower Markers
        plot3(RHipFront(1,ii),RHipFront(2,ii),RHipFront(3,ii),'k.','MarkerSize',5)
        plot3(RHipBack(1,ii),RHipBack(2,ii),RHipBack(3,ii),'k.','MarkerSize',5)
        plot3(RKnee(1,ii),RKnee(2,ii),RKnee(3,ii),'k.','MarkerSize',5);
        plot3(RAnkle(1,ii),RAnkle(2,ii),RAnkle(3,ii),'k.','MarkerSize',5);
        plot3(RToeTip(1,ii),RToeTip(2,ii),RToeTip(3,ii),'k.','MarkerSize',5);
    end
    
    if plot_segCenters == true
        %Upper SegCenters
        plot3(HeadCenter(1,ii),HeadCenter(2,ii),HeadCenter(3,ii),'g.','MarkerSize',5)
        plot3(ChestCenter(1,ii),ChestCenter(2,ii),ChestCenter(3,ii),'g.','MarkerSize',5)
        
        %LUpper SegCenters
        plot3(LShoulderCenter(1,ii),LShoulderCenter(2,ii),LShoulderCenter(3,ii),'g.','MarkerSize',5)
        plot3(LUpperArmCenter(1,ii),LUpperArmCenter(2,ii),LUpperArmCenter(3,ii),'g.','MarkerSize',5)
        plot3(LForearmCenter(1,ii),LForearmCenter(2,ii),LForearmCenter(3,ii),'g.','MarkerSize',5)
        plot3(LHandCenter(1,ii),LHandCenter(2,ii),LHandCenter(3,ii),'g.','MarkerSize',5)
        
        %LLower SegCenters 
        plot3(LHipCenter(1,ii),LHipCenter(2,ii),LHipCenter(3,ii),'g.','MarkerSize',5)
        plot3(LThigh(1,ii),LThigh(2,ii),LThigh(3,ii),'g.','MarkerSize',5)
        plot3(LLeg(1,ii),LLeg(2,ii),LLeg(3,ii),'g.','MarkerSize',5);
        plot3(LFoot(1,ii),LFoot(2,ii),LFoot(3,ii),'g.','MarkerSize',5);
        
        %RUpper SegCenters
        plot3(RShoulderCenter(1,ii),RShoulderCenter(2,ii),RShoulderCenter(3,ii),'g.','MarkerSize',5)
        plot3(RUpperArmCenter(1,ii),RUpperArmCenter(2,ii),RUpperArmCenter(3,ii),'g.','MarkerSize',5)
        plot3(RForearmCenter(1,ii),RForearmCenter(2,ii),RForearmCenter(3,ii),'g.','MarkerSize',5)
        plot3(RHandCenter(1,ii),RHandCenter(2,ii),RHandCenter(3,ii),'g.','MarkerSize',5)
        
        %RLower SegCenters
        hold on
        plot3(RHipCenter(1,ii),RHipCenter(2,ii),RHipCenter(3,ii),'g.','MarkerSize',5)
        plot3(RThigh(1,ii),RThigh(2,ii),RThigh(3,ii),'g.','MarkerSize',5)
        plot3(RLeg(1,ii),RLeg(2,ii),RLeg(3,ii),'g.','MarkerSize',5);
        plot3(RFoot(1,ii),RFoot(2,ii),RFoot(3,ii),'g.','MarkerSize',5);
    end
    
    if plot_skeleton == true
        %Plot Head
        plot3([HeadTop(1,ii);HeadR(1,ii);HeadFront(1,ii);SpineTop(1,ii);ChestCenter(1,ii)],...
            [HeadTop(2,ii);HeadR(2,ii);HeadFront(2,ii);SpineTop(2,ii);ChestCenter(2,ii)],...
            [HeadTop(3,ii);HeadR(3,ii);HeadFront(3,ii);SpineTop(3,ii);ChestCenter(3,ii)],'-k','MarkerSize',20)
        
        %Plot LExtremities
        plot3([LShoulderCenter(1,ii);LUpperArmCenter(1,ii);LElbow(1,ii);LForearmCenter(1,ii);LWristOut(1,ii)],...
            [LShoulderCenter(2,ii);LUpperArmCenter(2,ii);LElbow(2,ii);LForearmCenter(2,ii);LWristOut(2,ii)],...
            [LShoulderCenter(3,ii);LUpperArmCenter(3,ii);LElbow(3,ii);LForearmCenter(3,ii);LWristOut(3,ii)],'-b','MarkerSize',20)
        
        plot3([LHipCenter(1,ii);LThigh(1,ii);LKnee(1,ii);LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)],...
            [LHipCenter(2,ii);LThigh(2,ii);LKnee(2,ii);LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)],...
            [LHipCenter(3,ii);LThigh(3,ii);LKnee(3,ii);LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)],'-b','MarkerSize',20)
        
        %Plot RExtremities
        plot3([RShoulderCenter(1,ii);RUpperArmCenter(1,ii);RElbow(1,ii);RForearmCenter(1,ii);RWristOut(1,ii)],...
            [RShoulderCenter(2,ii);RUpperArmCenter(2,ii);RElbow(2,ii);RForearmCenter(2,ii);RWristOut(2,ii)],...
            [RShoulderCenter(3,ii);RUpperArmCenter(3,ii);RElbow(3,ii);RForearmCenter(3,ii);RWristOut(3,ii)],'-r','MarkerSize',20)
        
        plot3([RHipCenter(1,ii);RThigh(1,ii);RKnee(1,ii);RAnkle(1,ii);RFoot(1,ii);RToeTip(1,ii)],...
            [RHipCenter(2,ii);RThigh(2,ii);RKnee(2,ii);RAnkle(2,ii);RFoot(2,ii);RToeTip(2,ii)],...
            [RHipCenter(3,ii);RThigh(3,ii);RKnee(3,ii);RAnkle(3,ii);RFoot(3,ii);RToeTip(3,ii)],'-r','MarkerSize',20)
    end
    
    %% Plotting settings
    axis equal
    grid on
    
    xlim([0 2e3])
    ylim([-5e3 10e3])
    zlim([0 3e3])
    
%     %left side view
%     az = -30.8155;
%     el = 6.8338;
    
    %right side view
    az = 33.0845;
    el = 11.6447;
    
    view(az,el)
    drawnow
    
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end
close(stepA)

%% Extra code
%Acquire mean location of markers around hip joint
% [LHipJointMarkers_mean] = joint_ref_loc(LHipFront,LHipBack,LThigh);


end