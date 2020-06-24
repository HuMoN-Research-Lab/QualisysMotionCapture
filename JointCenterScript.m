%Average position of the markers around the joint
%% Establish initial conditions
%Hip initial marker positions
LHip_pos = segCenter.
XPos = avgXPOS;
YPos = avgYPOS;
ZPos = avgZPOS;

%Convert the average position to spherical coords
[azi,elevation,initialJointCenterDistanceGuess] = cart2sph(XPos, YPos, ZPos);

%Call error func
JointCenterError = @(JointCenterGuess) JointCenterErrorFun(SegmentCenters, JointCenterGuess);

%Settings for optimizer
opts = optimset('Display', 'iter', 'MaxFunEvals',5000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});

%Run optimizer
[jointCenterOpt, jointCenterErr] = fminunc(JointCenterError, initialJointCenterDistanceGuess, opts);