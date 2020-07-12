%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Script finds the average position of the markers around a joint
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish initial conditions
clc
LHip_centerLoc = segCenter.LHipCenter_mar_dim_frame;
LThigh_loc_unfil =      getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LThigh_loc_fil =        LThigh_loc_unfil(1:3,:);
LThigh_loc =            LThigh_loc_fil';
LKnee_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LKnee_loc_fil =         LKnee_loc_unfil(1:3,:);
LKnee_loc =             LKnee_loc_fil';

RThigh_loc_unfil =      getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RThigh_loc_fil =        RThigh_loc_unfil(1:3,:);
RThigh_loc =            RThigh_loc_fil';
RKnee_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_loc_fil =         RKnee_loc_unfil(1:3,:);
RKnee_loc =             RKnee_loc_fil';

%% Hip initial marker positions
LHip_marsXPos =         LThigh_loc(:,1);
LHip_marsXPos(:,2) =    LKnee_loc(:,1);
LHip_marsAvgXPos =      mean(LHip_marsXPos,2);

LHip_marsYPos =         LThigh_loc(:,2);
LHip_marsYPos(:,2) =    LKnee_loc(:,2);
LHip_marsAvgYPos =      mean(LHip_marsYPos,2);

LHip_marsZPos =         LThigh_loc(:,3);
LHip_marsZPos(:,2) =    LKnee_loc(:,3);
LHip_marsAvgZPos =      mean(LHip_marsZPos,2);

mar_xPos = (LHip_marsAvgXPos).';
mar_yPos = (LHip_marsAvgYPos).';
mar_zPos = (LHip_marsAvgZPos).';

%Convert the average position to spherical coords
[azi,elevation,JointCenterGuess_dist] = cart2sph(mar_xPos,mar_yPos,mar_zPos);

%Call error func
JointCenterEval = @(JointCenterGuess)JointCenterError(LHip_centerLoc,JointCenterGuess_dist);

%Settings for optimizer
opts = optimset('Display', 'iter', 'MaxFunEvals',5000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});

%Run optimizer
[jointCenterOpt, jointCenterErr] = fminunc(JointCenterEval,JointCenterGuess_dist,opts);