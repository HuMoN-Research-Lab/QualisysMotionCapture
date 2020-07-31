function [jointCenters] = jointCenterOpt(segCenter,skeleton)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Optimize all joint center location 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDs of markers in use
use_MarkerClusters = false;
%Torso markers & segCenters
HeadL =             segCenter.HeadL;
HeadTop =           segCenter.HeadTop;
HeadR =             segCenter.HeadR;
HeadFront =         segCenter.HeadFront;
HeadCenter =        segCenter.HeadCenter;
SpineTop =          segCenter.SpineTop;
NeckCenter =        segCenter.NeckCenter;
BackL =             segCenter.BackL;
BackR =             segCenter.BackR;
BackCenter =        segCenter.BackCenter;
ChestCenter =       segCenter.ChestCenter;
TorsoCenter =       segCenter.TorsoCenter;
HipCenter =         segCenter.HipCenter;
LHipFront =         segCenter.LHipFront;
LHipBack =          segCenter.LHipBack;
LHipCenter =        segCenter.LHipCenter;
RHipFront =         segCenter.RHipFront;
RHipBack =          segCenter.RHipBack;
RHipCenter =        segCenter.RHipCenter;

%Shoulder markers & segCenters
LShoulderTop =      segCenter.LShoulderTop;
LShoulderBack =     segCenter.LShoulderBack;
LShoulderCenter =   segCenter.LShoulderCenter;
RShoulderTop =      segCenter.RShoulderTop;
RShoulderBack =     segCenter.RShoulderBack;
RShoulderCenter =   segCenter.RShoulderCenter;

%UpperArm markers & segCenters
LArm =              segCenter.LArm;
RArm =              segCenter.RArm;
LUpperArmCenter =   segCenter.LUpperArmCenter;
RUpperArmCenter =   segCenter.RUpperArmCenter;
LElbow =            segCenter.LElbow;
RElbow =            segCenter.RElbow;

%Forearm markers & segCenters
LForearmCenter =    segCenter.LForearmCenter;
RForearmCenter =    segCenter.RForearmCenter;

%Hand markers & segCenters
LWristOut =         segCenter.LWristOut;
LWristIn =          segCenter.LWristIn;
LWristCenter =      segCenter.LWristCenter;
LHandOut =          segCenter.LHandOut;
LHandCenter =       segCenter.LHandCenter;
RWristOut =         segCenter.RWristOut;
RWristIn =          segCenter.RWristIn;
RWristCenter =      segCenter.RWristCenter;
RHandOut =          segCenter.RHandOut;
RHandCenter =       segCenter.RHandCenter;

%Femur markers & segCenters
LThigh =            segCenter.LThigh;
LThighCenter =      segCenter.LThighCenter;
RThigh =            segCenter.RThigh;
RThighCenter =      segCenter.RThighCenter;

if use_MarkerClusters
    %Left upper leg cluster
    LUpperLegCluster1 = segCenter.LUpLegCluster1;
    LUpperLegCluster2 = segCenter.LUpLegCluster2;
    LUpperLegCluster3 = segCenter.LUpLegCluster3;
    LUpperLegCluster4 = segCenter.LUpLegCluster4;
    
    %Right upper leg cluster
    RUpperLegCluster1 = segCenter.RUpLegCluster1;
    RUpperLegCluster2 = segCenter.RUpLegCluster2;
    RUpperLegCluster3 = segCenter.RUpLegCluster3;
    RUpperLegCluster4 = segCenter.RUpLegCluster4;
end

%Tibia markers & segCenters
LKnee =             segCenter.LKnee;
RKnee =             segCenter.RKnee;

if use_MarkerClusters
    %Left upper leg cluster
    LLegCluster1 =  segCenter.LLegCluster1;
    LLegCluster2 =  segCenter.LLegCluster2;
    LLegCluster3 =  segCenter.LLegCluster3;
    LLegCluster4 =  segCenter.LLegCluster4;
    
    %Right upper leg cluster
    RLegCluster1 =  segCenter.RLegCluster1;
    RLegCluster2 =  segCenter.RLegCluster2;
    RLegCluster3 =  segCenter.RLegCluster3;
    RLegCluster4 =  segCenter.RLegCluster4;
end

LLeg =              segCenter.LLeg;
RLeg =              segCenter.RLeg;
LLegCenter =        segCenter.LLegCenter;
RLegCenter =        segCenter.RLegCenter;

%Foot markers & segCenters
LAnkle =            segCenter.LAnkle;
RAnkle =            segCenter.RAnkle;
LFootCenter =       segCenter.LFootCenter;
RFootCenter =       segCenter.RFootCenter;
LHeel =             segCenter.LHeel;
RHeel =             segCenter.RHeel;
LForefoot =         segCenter.LForefoot;
RForefoot =         segCenter.RForefoot;
LToeTip =           segCenter.LToeTip;
RToeTip =           segCenter.RToeTip;

%% Skeleton segments
Head_s =        skeleton.Head;
Neck_s =        skeleton.Neck;
Spine_s =       skeleton.Spine;
Spine1_s =      skeleton.Spine1;
Spine2_s =      skeleton.Spine2;
Hips_s =        skeleton.Hips;
LShoulder_s =   skeleton.LShoulder;
RShoulder_s =   skeleton.RShoulder;
LUpperArm_s =   skeleton.LUpperArm;
RUpperArm_s =   skeleton.RUpperArm;
LForearm_s =    skeleton.LForearm;
RForearm_s =    skeleton.RForearm;
LHand_s =       skeleton.LHand;
RHand_s =       skeleton.RHand;
LThigh_s =      skeleton.LThigh;
RThigh_s =      skeleton.RThigh;
LLeg_s =        skeleton.LLeg;
RLeg_s =        skeleton.RLeg;
LFoot_s =       skeleton.LFoot;
RFoot_s =       skeleton.RFoot;
LToeBase_s =    skeleton.LToeBase;
RToeBase_s =    skeleton.RToeBase;

%% Activation settings for optimizer of joint centers
%Upper extremities jointCenters
lookfor_LShoulderJointCenter =  false;
lookfor_RShoulderJointCenter =  false;
lookfor_LElbowJointCenter =     false;
lookfor_RElbowJointCenter =     false;
lookfor_LWristJointCenter =     false;
lookfor_RWristJointCenter =     false;

%Lower extremities jointCenters
lookfor_LHipJointCenter =       true;
lookfor_RHipJointCenter =       true;
lookfor_LKneeJointCenter =      true;
lookfor_RKneeJointCenter =      true;
lookfor_LAnkleJointCenter =     true;
lookfor_RAnkleJointCenter =     true;

%% Activation settings for plotting markers and segCenters
plot_segCenters =   true;
plot_markers =      true;
plot_LExtr =        false;
plot_skeleton =     true;

%% Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A =     [];
b =     [];
Aeq =   [];
beq =   [];
lb =    [];
ub =    [];

%% Joint ref loc and initial guess for LShoulderJointCenter
%Respective markers around jointCenter
if lookfor_LShoulderJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       LShoulderTop;
    marker2 =       LShoulderBack;
    marker3 =       LShoulderCenter;
    numOfWeights =  3;
    upper_markers =         cat(numOfWeights,marker1,marker2,marker3);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('LHip Segment Length Optimization.mp4');
    
    %LShoulderCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LShoulderJointCenterError = @(weights) JointCenterErrorFun(LShoulderCenter,...
        upper_markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for LShoulderJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LShoulderWeights, LShoulderJointCenterError_final] = fmincon(LShoulderJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= upper_markers(:,:,ii)*LShoulderWeights(ii);
    end
    LShoulderJointCenter =                  sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.LShoulderWeights =         LShoulderWeights;
    jointCenters.LShoulderJointCenter =     LShoulderJointCenter;
end

%% Joint ref loc and initial guess for RShoulderJointCenter
%Respective markers around jointCenter
if lookfor_RShoulderJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       RShoulderTop;
    marker2 =       RShoulderBack;
    marker3 =       RShoulderCenter;
    numOfWeights =  3;
    markers =               cat(numOfWeights,marker1,marker2,marker3);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('LHip Segment Length Optimization.mp4');
    
    %LShoulderCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RShoulderJointCenterError = @(weights) JointCenterErrorFun(RShoulderCenter,...
        markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for RShoulderJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RShoulderWeights, RShoulderJointCenterError_final] = fmincon(RShoulderJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*RShoulderWeights(ii);
    end
    RShoulderJointCenter =                  sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RShoulderWeights =         RShoulderWeights;
    jointCenters.RShoulderJointCenter =     RShoulderJointCenter;
end

%% Joint ref loc and initial guess for LElbowJointCenter
%Respective markers around jointCenter
if lookfor_LElbowJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       LArm;
    marker2 =       LElbow;
    marker3 =       LForearmCenter;
    numOfWeights =  3;
    markers =               cat(numOfWeights,marker1,marker2,marker3);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('LElbow Segment Length Optimization.mp4');
    
    %LElbowCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LElbowJointCenterError = @(weights) JointCenterErrorFun(LElbow,...
        markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for LElbowJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LElbowWeights,LElbowJointCenterError_final] = fmincon(LElbowJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*LElbowWeights(ii);
    end
    LElbowJointCenter =                 sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.LElbowWeights =        LElbowWeights;
    jointCenters.LElbowJointCenter =    LElbowJointCenter;
end

%% Joint ref loc and initial guess for RElbowJointCenter
%Respective markers around jointCenter
if lookfor_RElbowJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       RArm;
    marker2 =       RElbow;
    marker3 =       RForearmCenter;
    numOfWeights =  3;
    markers =               cat(numOfWeights,marker1,marker2,marker3);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('RElbow Segment Length Optimization.mp4');
    
    %RElbowCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RElbowJointCenterError = @(weights) JointCenterErrorFun(RElbow,...
        markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for RElbowJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RElbowWeights,RElbowJointCenterError_final] = fmincon(RElbowJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*RElbowWeights(ii);
    end
    RElbowJointCenter =                 sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RElbowWeights =        RElbowWeights;
    jointCenters.RElbowJointCenter =    RElbowJointCenter;
end

%% Joint ref loc and initial guess for LWristJointCenter
%Respective markers around jointCenter
if lookfor_LWristJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       LWristOut;
    marker2 =       LWristIn;
    marker3 =       LWristCenter;
    marker4 =       LHandOut;
    numOfWeights =  4;
    markers =               cat(numOfWeights,marker1,marker2,marker3,marker4);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('LWrist Segment Length Optimization.mp4');
    
    %LWristCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    LWristJointCenterError = @(weights) JointCenterErrorFun(LWristCenter,...
        markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for LWristJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LWristWeights,LWristJointCenterError_final] = fmincon(LWristJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*LWristWeights(ii);
    end
    LWristJointCenter =                 sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.LWristWeights =        LWristWeights;
    jointCenters.LWristJointCenter =    LWristJointCenter;
end

%% Joint ref loc and initial guess for RWristJointCenter
%Respective markers around jointCenter
if lookfor_RWristJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       RWristOut;
    marker2 =       RWristIn;
    marker3 =       RWristCenter;
    marker4 =       RHandOut;
    numOfWeights =  4;
    markers =               cat(numOfWeights,marker1,marker2,marker3,marker4);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
    % v = VideoWriter('RWrist Segment Length Optimization.mp4');
    
    %RWristCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    RWristJointCenterError = @(weights) JointCenterErrorFun(RWristCenter,...
        markers,figNum,weights,numOfWeights);
    
    % close(v)
    
    %Optimizer for RWristJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RWristWeights,RWristJointCenterError_final] = fmincon(RWristJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*RWristWeights(ii);
    end
    RWristJointCenter =                 sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RWristWeights =        RWristWeights;
    jointCenters.RWristJointCenter =    RWristJointCenter;
end

%% Joint ref loc and initial guess for LHipJointCenter
%Respective markers around jointCenter
if lookfor_LHipJointCenter
    %future code detects number of markers by how many markers are
    %referenced
    marker1 =       LHipFront;
    marker2 =       LHipBack;
    if use_MarkerClusters
        marker3 =   LUpperLegCluster2;
    end
%     marker5 =       LUpperLegCluster2;
    marker3 =       LThigh;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3);%,marker4);%,marker5);
    weightVector =          ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    
    %Starting point of JointCenter guess that initiates optimizer
    figNum =                132435;
    
%     v = VideoWriter('LHip Segment Length Optimization.mp4');
    
    %LHipCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    visualize = true;
    [LHipJointCenterError] = @(weights) JointCenterErrorFun(LThighCenter,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);%,v);
    
%     close(v)
    
    %Optimizer for LHipJointCenter weightsx
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LHipWeights, LHipJointCenterError_final] = fmincon(LHipJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii) * LHipWeights(ii);
    end
    LHipJointCenter =               sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.LHipWeights =      LHipWeights;
    jointCenters.LHipJointCenter =  LHipJointCenter;
end

%% Joint ref loc and initial guess for RHipJointCenter
if lookfor_RHipJointCenter
    %Acquire mean location of markers around hip joint
    marker1 =       RHipFront;
    marker2 =       RHipBack;
    if use_MarkerClusters
        marker3 =   RUpperLegCluster1;
    end
%     marker4 =       RUpperLegCluster2;
    marker3 =       RThigh;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3); %,marker4);%,marker5);
    weightVector =          ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    figNum =                29586;
    
    v = VideoWriter('RHip Segment Length Optimization.mp4');
    
    visualize = true;
    RHipJointCenterError = @(weights) JointCenterErrorFun(RThighCenter,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);%,v);
    
    %Optimizer for RHipJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RHipWeights, RHipJointCenterError_final] = fmincon(RHipJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    %Calibrates results considering initialGuess
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii) * RHipWeights(ii);
    end
    RHipJointCenter =               sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RHipWeights =      RHipWeights;
    jointCenters.RHipJointCenter =  RHipJointCenter;
end

%% Joint ref loc and initial guess for LKneeJointCenter
if lookfor_LKneeJointCenter
    %Acquire mean location of markers around hip joint
    marker1 =       LThigh;
    marker2 =       LKnee;
    if use_MarkerClusters
        marker3 =       LLegCluster1;
        marker4 =       LLegCluster2;
    end
    marker3 =       LLeg;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3);%,marker4);
    weightVector =          ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    figNum =                33496;
    
    % y = VideoWriter('LKnee Segment Length Optimization.mp4');
    
    %LKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    visualize = true;
    LKneeJointCenterError = @(weights) JointCenterErrorFun(LThighCenter,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LKneeWeights, LKneeJointCenterError_final] = fmincon(LKneeJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii) * LKneeWeights(ii);
    end
    LKneeJointCenter =                  sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.LKneeWeights =         LKneeWeights;
    jointCenters.LKneeJointCenter =     LKneeJointCenter;
end

%% Joint ref loc and initial guess for RKneeJointCenter
if lookfor_RKneeJointCenter
    %Acquire mean location of markers around hip joint
    marker1 =       RThigh;
    marker2 =       RKnee;
    if use_MarkerClusters
        marker3 =       RLegCluster1;
        marker4 =       RLegCluster2;
    end
    marker3 =       RLeg;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3);%,marker4);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    figNum =                43496;

    % y = VideoWriter('RKnee Segment Length Optimization.mp4');
    
    %RKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    visualize = true;
    RKneeJointCenterError = @(weights) JointCenterErrorFun(RThighCenter,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RKneeWeights, RKneeJointCenterError_final] = fmincon(RKneeJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*RKneeWeights(ii);
    end
    RKneeJointCenter =                  sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RKneeWeights =         RKneeWeights;
    jointCenters.RKneeJointCenter =     RKneeJointCenter;
end

%% Joint ref loc and initial guess for LAnkleJointCenter
if lookfor_LAnkleJointCenter
    %Acquire mean location of markers around hip joint
    marker1 =       LHeel;
%     marker2 =       LAnkle;
    marker2 =       LToeTip;
    marker3 =       LForefoot;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3);%,marker4);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    figNum =                53496;

    % y = VideoWriter('RKnee Segment Length Optimization.mp4');
    
    %RKneeCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    visualize = true;
    LAnkleJointCenterError = @(weights) JointCenterErrorFun(LAnkle,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [LAnkleWeights, LAnkleJointCenterError_final] = fmincon(LAnkleJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*LAnkleWeights(ii);
    end
    LAnkleJointCenter =                  sum(weightedMarkers,3);
    
    %Outputs from function
    jointCenters.LAnkleWeights =         LAnkleWeights;
    jointCenters.LAnkleJointCenter =     LAnkleJointCenter;    
end

%% Joint ref loc and initial guess for LAnkleJointCenter
if lookfor_RAnkleJointCenter
    %Acquire mean location of markers around hip joint
    marker1 =       RHeel;
%     marker2 =       RAnkle;
    marker2 =       RToeTip;
    marker3 =       RForefoot;
    numOfWeights =  3;
    lb =            zeros(1,numOfWeights);
    ub =            ones(1,numOfWeights);
    markers =               cat(numOfWeights,marker1,marker2,marker3);%,marker4);
    weightVector=           ones(1,numOfWeights);%Initial Guess of how much the JointGuess vector is wrong
    initialWeightsGuess =   weightVector*(1/numOfWeights);
    figNum =                63496;

    % y = VideoWriter('RAnkle Segment Length Optimization.mp4');
    
    %RAnkleCenter marker (input1), markers around joint(input 2,3,4),
    %unknown that equation is solving for (weights)
    visualize = true;
    RAnkleJointCenterError = @(weights) JointCenterErrorFun(RAnkle,...
        markers,figNum,weights,numOfWeights,segCenter,visualize,use_MarkerClusters);
    
    %Optimizer for LKneeJointCenter weights
    %jointCenter difference = Optimized joint center loc in x,y,z
    [RAnkleWeights, RAnkleJointCenterError_final] = fmincon(RAnkleJointCenterError,initialWeightsGuess,A,b,Aeq,beq,lb,ub,[],opts);
    
    for ii = 1:numOfWeights
        weightedMarkers(:,:,ii)= markers(:,:,ii)*RAnkleWeights(ii);
    end
    RAnkleJointCenter =                  sum(weightedMarkers,3); 
    
    %Outputs from function
    jointCenters.RAnkleWeights =         RAnkleWeights;
    jointCenters.RAnkleJointCenter =     RAnkleJointCenter;    
end

%% Visual representation of markers and segCenters w/ jointCenters
figure(7447)
stepA = VideoWriter('Lower Extremities Joint Centers.mp4');
open(stepA);

for ii = 1:2:length(HipCenter)
    clf
    hold on
    if lookfor_LShoulderJointCenter
        plot3(LShoulderJointCenter(1,ii),LShoulderJointCenter(2,ii),...
            LShoulderJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RShoulderJointCenter
        plot3(RShoulderJointCenter(1,ii),RShoulderJointCenter(2,ii),...
            RShoulderJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_LElbowJointCenter
        plot3(LElbowJointCenter(1,ii),LElbowJointCenter(2,ii),...
            LElbowJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RElbowJointCenter
        plot3(RElbowJointCenter(1,ii),RElbowJointCenter(2,ii),...
            RElbowJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_LWristJointCenter
        plot3(LWristJointCenter(1,ii),LWristJointCenter(2,ii),...
            LWristJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RWristJointCenter
        plot3(RWristJointCenter(1,ii),RWristJointCenter(2,ii),...
            RWristJointCenter(3,ii),'r.','MarkerSize',12)
    end    
    if lookfor_LHipJointCenter
        plot3(LHipJointCenter(1,ii),LHipJointCenter(2,ii),...
            LHipJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RHipJointCenter
        plot3(RHipJointCenter(1,ii),RHipJointCenter(2,ii),...
            RHipJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_LKneeJointCenter
        plot3(LKneeJointCenter(1,ii),LKneeJointCenter(2,ii),...
            LKneeJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RKneeJointCenter
        plot3(RKneeJointCenter(1,ii),RKneeJointCenter(2,ii),...
            RKneeJointCenter(3,ii),'r.','MarkerSize',12)
    end
    if lookfor_LAnkleJointCenter == true
        plot3(LAnkleJointCenter(1,ii),LAnkleJointCenter(2,ii),...
            LAnkleJointCenter(3,ii),'b.','MarkerSize',12)
    end
    if lookfor_RAnkleJointCenter
        plot3(RAnkleJointCenter(1,ii),RAnkleJointCenter(2,ii),...
            RAnkleJointCenter(3,ii),'r.','MarkerSize',12)
    end
    
    if plot_markers
        %Upper markers
        plot3(HeadL(1,ii),HeadL(2,ii),HeadL(3,ii),'k.','MarkerSize',5)
        plot3(HeadTop(1,ii),HeadTop(2,ii),HeadTop(3,ii),'k.','MarkerSize',5)
        plot3(HeadR(1,ii),HeadR(2,ii),HeadR(3,ii),'k.','MarkerSize',5)
        plot3(HeadFront(1,ii),HeadFront(2,ii),HeadFront(3,ii),'k.','MarkerSize',5)
        plot3(SpineTop(1,ii),SpineTop(2,ii),SpineTop(3,ii),'k.','MarkerSize',5)
        plot3(BackL(1,ii),BackL(2,ii),BackL(3,ii),'k.','MarkerSize',5)
        plot3(BackR(1,ii),BackR(2,ii),BackR(3,ii),'k.','MarkerSize',5)
        
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
        if use_MarkerClusters
            plot3(LUpperLegCluster1(1,ii),LUpperLegCluster1(2,ii),LUpperLegCluster1(3,ii),'k.','MarkerSize',5);
            plot3(LUpperLegCluster2(1,ii),LUpperLegCluster2(2,ii),LUpperLegCluster2(3,ii),'k.','MarkerSize',5);
            plot3(LUpperLegCluster3(1,ii),LUpperLegCluster3(2,ii),LUpperLegCluster3(3,ii),'k.','MarkerSize',5);
            plot3(LUpperLegCluster4(1,ii),LUpperLegCluster4(2,ii),LUpperLegCluster4(3,ii),'k.','MarkerSize',5);
        end
        plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',5);
        if use_MarkerClusters
            plot3(LLegCluster1(1,ii),LLegCluster1(2,ii),LLegCluster1(3,ii),'k.','MarkerSize',5);
            plot3(LLegCluster2(1,ii),LLegCluster2(2,ii),LLegCluster2(3,ii),'k.','MarkerSize',5);
            plot3(LLegCluster3(1,ii),LLegCluster3(2,ii),LLegCluster3(3,ii),'k.','MarkerSize',5);
            plot3(LLegCluster4(1,ii),LLegCluster4(2,ii),LLegCluster4(3,ii),'k.','MarkerSize',5);
        end
        plot3(LAnkle(1,ii),LAnkle(2,ii),LAnkle(3,ii),'k.','MarkerSize',5);
        plot3(LHeel(1,ii),LHeel(2,ii),LHeel(3,ii),'k.','MarkerSize',5);
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
        if use_MarkerClusters
            plot3(RUpperLegCluster1(1,ii),RUpperLegCluster1(2,ii),RUpperLegCluster1(3,ii),'k.','MarkerSize',5);
            plot3(RUpperLegCluster2(1,ii),RUpperLegCluster2(2,ii),RUpperLegCluster2(3,ii),'k.','MarkerSize',5);
            plot3(RUpperLegCluster3(1,ii),RUpperLegCluster3(2,ii),RUpperLegCluster3(3,ii),'k.','MarkerSize',5);
            plot3(RUpperLegCluster4(1,ii),RUpperLegCluster4(2,ii),RUpperLegCluster4(3,ii),'k.','MarkerSize',5);
        end
        plot3(RKnee(1,ii),RKnee(2,ii),RKnee(3,ii),'k.','MarkerSize',5);
        if use_MarkerClusters
            plot3(RLegCluster1(1,ii),RLegCluster1(2,ii),RLegCluster1(3,ii),'k.','MarkerSize',5);
            plot3(RLegCluster2(1,ii),RLegCluster2(2,ii),RLegCluster2(3,ii),'k.','MarkerSize',5);
            plot3(RLegCluster3(1,ii),RLegCluster3(2,ii),RLegCluster3(3,ii),'k.','MarkerSize',5);
            plot3(RLegCluster4(1,ii),RLegCluster4(2,ii),RLegCluster4(3,ii),'k.','MarkerSize',5);
        end
        plot3(RAnkle(1,ii),RAnkle(2,ii),RAnkle(3,ii),'k.','MarkerSize',5);
        plot3(RHeel(1,ii),RHeel(2,ii),RHeel(3,ii),'k.','MarkerSize',5);
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
        plot3(LThighCenter(1,ii),LThighCenter(2,ii),LThighCenter(3,ii),'g.','MarkerSize',5)
        plot3(LLegCenter(1,ii),LLegCenter(2,ii),LLegCenter(3,ii),'g.','MarkerSize',5);
        plot3(LFootCenter(1,ii),LFootCenter(2,ii),LFootCenter(3,ii),'g.','MarkerSize',5);
        
        %RUpper SegCenters
        plot3(RShoulderCenter(1,ii),RShoulderCenter(2,ii),RShoulderCenter(3,ii),'g.','MarkerSize',5)
        plot3(RUpperArmCenter(1,ii),RUpperArmCenter(2,ii),RUpperArmCenter(3,ii),'g.','MarkerSize',5)
        plot3(RForearmCenter(1,ii),RForearmCenter(2,ii),RForearmCenter(3,ii),'g.','MarkerSize',5)
        plot3(RHandCenter(1,ii),RHandCenter(2,ii),RHandCenter(3,ii),'g.','MarkerSize',5)
        
        %RLower SegCenters
        plot3(RHipCenter(1,ii),RHipCenter(2,ii),RHipCenter(3,ii),'g.','MarkerSize',5)
        plot3(RThighCenter(1,ii),RThighCenter(2,ii),RThighCenter(3,ii),'g.','MarkerSize',5)
        plot3(RLegCenter(1,ii),RLegCenter(2,ii),RLegCenter(3,ii),'g.','MarkerSize',5);
        plot3(RFootCenter(1,ii),RFootCenter(2,ii),RFootCenter(3,ii),'g.','MarkerSize',5);
    end
    
    %% Plot Skeleton
    if plot_skeleton == true      
        %Qualisys Skeleton
        plot3([Head_s(1,ii);Neck_s(1,ii);Spine2_s(1,ii);Spine1_s(1,ii);Spine_s(1,ii);Hips_s(1,ii)],...
            [Head_s(2,ii);Neck_s(2,ii);Spine2_s(2,ii);Spine1_s(2,ii);Spine_s(2,ii);Hips_s(2,ii)],...
            [Head_s(3,ii);Neck_s(3,ii);Spine2_s(3,ii);Spine1_s(3,ii);Spine_s(3,ii);Hips_s(3,ii)],'-','color',[0.8500 0.3250 0.0980],'LineWidth',2,'MarkerFaceColor','k')
        
        plot3([Spine2_s(1,ii);LShoulder_s(1,ii);LUpperArm_s(1,ii);LForearm_s(1,ii);LHand_s(1,ii)],...
            [Spine2_s(2,ii);LShoulder_s(2,ii);LUpperArm_s(2,ii);LForearm_s(2,ii);LHand_s(2,ii)],...
            [Spine2_s(3,ii);LShoulder_s(3,ii);LUpperArm_s(3,ii);LForearm_s(3,ii);LHand_s(3,ii)],'-','color',[0.8500 0.3250 0.0980],'LineWidth',2,'MarkerFaceColor','k')
        
        plot3([Spine2_s(1,ii);RShoulder_s(1,ii);RUpperArm_s(1,ii);RForearm_s(1,ii);RHand_s(1,ii)],...
            [Spine2_s(2,ii);RShoulder_s(2,ii);RUpperArm_s(2,ii);RForearm_s(2,ii);RHand_s(2,ii)],...
            [Spine2_s(3,ii);RShoulder_s(3,ii);RUpperArm_s(3,ii);RForearm_s(3,ii);RHand_s(3,ii)],'-','color',[0.8500 0.3250 0.0980],'LineWidth',2,'MarkerFaceColor','k')
        
        plot3([Hips_s(1,ii);LThigh_s(1,ii);LLeg_s(1,ii);LFoot_s(1,ii);LToeBase_s(1,ii)],...
            [Hips_s(2,ii);LThigh_s(2,ii);LLeg_s(2,ii);LFoot_s(2,ii);LToeBase_s(2,ii)],...
            [Hips_s(3,ii);LThigh_s(3,ii);LLeg_s(3,ii);LFoot_s(3,ii);LToeBase_s(3,ii)],'-','color',[0.8500 0.3250 0.0980],'LineWidth',2,'MarkerFaceColor','k')
        
        plot3([Hips_s(1,ii);RThigh_s(1,ii);RLeg_s(1,ii);RFoot_s(1,ii);RToeBase_s(1,ii)],...
            [Hips_s(2,ii);RThigh_s(2,ii);RLeg_s(2,ii);RFoot_s(2,ii);RToeBase_s(2,ii)],...
            [Hips_s(3,ii);RThigh_s(3,ii);RLeg_s(3,ii);RFoot_s(3,ii);RToeBase_s(3,ii)],'-','color',[0.8500 0.3250 0.0980],'LineWidth',2,'MarkerFaceColor','k')
        
        %Calculated Skeleton
        plot3([NeckCenter(1,ii);TorsoCenter(1,ii);HipCenter(1,ii)],...
            [SpineTop(2,ii);TorsoCenter(2,ii);HipCenter(2,ii)],...
            [SpineTop(3,ii);TorsoCenter(3,ii);HipCenter(3,ii)],'-k','LineWidth',2)
        
        %LExtremities
        plot3([NeckCenter(1,ii);LShoulderCenter(1,ii);LUpperArmCenter(1,ii);LElbow(1,ii);LForearmCenter(1,ii);LWristOut(1,ii)],...
            [NeckCenter(2,ii);LShoulderCenter(2,ii);LUpperArmCenter(2,ii);LElbow(2,ii);LForearmCenter(2,ii);LWristOut(2,ii)],...
            [NeckCenter(3,ii);LShoulderCenter(3,ii);LUpperArmCenter(3,ii);LElbow(3,ii);LForearmCenter(3,ii);LWristOut(3,ii)],'-b','LineWidth',2)
        
        plot3([HipCenter(1,ii);LHipJointCenter(1,ii);LKneeJointCenter(1,ii);LAnkleJointCenter(1,ii);LFootCenter(1,ii);LToeTip(1,ii)],...
            [HipCenter(2,ii);LHipJointCenter(2,ii);LKneeJointCenter(2,ii);LAnkleJointCenter(2,ii);LFootCenter(2,ii);LToeTip(2,ii)],...
            [HipCenter(3,ii);LHipJointCenter(3,ii);LKneeJointCenter(3,ii);LAnkleJointCenter(3,ii);LFootCenter(3,ii);LToeTip(3,ii)],'-b','LineWidth',2)
        
        %RExtremities
        plot3([NeckCenter(1,ii);RShoulderCenter(1,ii);RUpperArmCenter(1,ii);RElbow(1,ii);RForearmCenter(1,ii);RWristOut(1,ii)],...
            [NeckCenter(2,ii);RShoulderCenter(2,ii);RUpperArmCenter(2,ii);RElbow(2,ii);RForearmCenter(2,ii);RWristOut(2,ii)],...
            [NeckCenter(3,ii);RShoulderCenter(3,ii);RUpperArmCenter(3,ii);RElbow(3,ii);RForearmCenter(3,ii);RWristOut(3,ii)],'-r','LineWidth',2)
        
        plot3([HipCenter(1,ii);RHipJointCenter(1,ii);RKneeJointCenter(1,ii);RAnkleJointCenter(1,ii);RFootCenter(1,ii);RToeTip(1,ii)],...
            [HipCenter(2,ii);RHipJointCenter(2,ii);RKneeJointCenter(2,ii);RAnkleJointCenter(2,ii);RFootCenter(2,ii);RToeTip(2,ii)],...
            [HipCenter(3,ii);RHipJointCenter(3,ii);RKneeJointCenter(3,ii);RAnkleJointCenter(3,ii);RFootCenter(3,ii);RToeTip(3,ii)],'-r','LineWidth',2)

        
            plot3(Head_s(1,ii),Head_s(2,ii),Head_s(3,ii),'k.','MarkerSize',10)
            plot3(Neck_s(1,ii),Neck_s(2,ii),Neck_s(3,ii),'k.','MarkerSize',10)
            plot3(Spine_s(1,ii),Spine_s(2,ii),Spine_s(3,ii),'k.','MarkerSize',10)
            plot3(Spine1_s(1,ii),Spine1_s(2,ii),Spine1_s(3,ii),'k.','MarkerSize',10)
            plot3(Spine2_s(1,ii),Spine2_s(2,ii),Spine2_s(3,ii),'k.','MarkerSize',10)
            plot3(Hips_s(1,ii),Hips_s(2,ii),Hips_s(3,ii),'k.','MarkerSize',10)
            plot3(LShoulder_s(1,ii),LShoulder_s(2,ii),LShoulder_s(3,ii),'k.','MarkerSize',10)
            plot3(RShoulder_s(1,ii),RShoulder_s(2,ii),RShoulder_s(3,ii),'k.','MarkerSize',10)
            plot3(LUpperArm_s(1,ii),LUpperArm_s(2,ii),LUpperArm_s(3,ii),'k.','MarkerSize',10)
            plot3(RUpperArm_s(1,ii),RUpperArm_s(2,ii),RUpperArm_s(3,ii),'k.','MarkerSize',10)
            plot3(LForearm_s(1,ii),LForearm_s(2,ii),LForearm_s(3,ii),'k.','MarkerSize',10)
            plot3(RForearm_s(1,ii),RForearm_s(2,ii),RForearm_s(3,ii),'k.','MarkerSize',10)
            plot3(LHand_s(1,ii),LHand_s(2,ii),LHand_s(3,ii),'k.','MarkerSize',10)
            plot3(RHand_s(1,ii),RHand_s(2,ii),RHand_s(3,ii),'k.','MarkerSize',10)
            plot3(LThigh_s(1,ii),LThigh_s(2,ii),LThigh_s(3,ii),'k.','MarkerSize',10)
            plot3(RThigh_s(1,ii),RThigh_s(2,ii),RThigh_s(3,ii),'k.','MarkerSize',10)
            plot3(LLeg_s(1,ii),LLeg_s(2,ii),LLeg_s(3,ii),'k.','MarkerSize',10)
            plot3(RLeg_s(1,ii),RLeg_s(2,ii),RLeg_s(3,ii),'k.','MarkerSize',10)
            plot3(LFoot_s(1,ii),LFoot_s(2,ii),LFoot_s(3,ii),'k.','MarkerSize',10)
            plot3(RFoot_s(1,ii),RFoot_s(2,ii),RFoot_s(3,ii),'k.','MarkerSize',10)
            plot3(LToeBase_s(1,ii),LToeBase_s(2,ii),LToeBase_s(3,ii),'k.','MarkerSize',10)
            plot3(RToeBase_s(1,ii),RToeBase_s(2,ii),RToeBase_s(3,ii),'k.','MarkerSize',10)
    end
    
    %Full Lab Settings
%     %Left Side
%     az = 231.8574;
%     el = 16.8769;
    %Right Side
    az = 123.4475;
    el = 22.8856;
    
    %     az = 139.7338;
    %     el = 17.4418;
    view(az,el)
    %Full Lab Settings
    xlim([200   650])
    ylim([-3e3  7.5e3])
    %         ylim([-3e3  -1.5e3])
    zlim([0     1.95e3])
    grid on
    drawnow
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end
close(stepA)
    %% Plotting settings
%     axis equal
%     grid on
    
%     %TPose settings
%     xlim([-500  1.5e3])
%     ylim([750   3e3])
%     zlim([0     1.95e3])
%     %right side view
%     az = 69.5695;
%     el = 17.3879;
%     %left side view
% %     az = -30.8155;
% %     el = 6.8338;
    
end