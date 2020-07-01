function jointCenterOpt(segCenter_cal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Optimize Joint center location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identification of markers in use
%LMarkers
LHip = segCenter_cal.LHip_loc_fil;
LThigh = segCenter_cal.LThigh_loc_fil;
LKnee = segCenter_cal.LKnee_loc_fil;

%RMarkers
RHip = segCenter_cal.RHip_loc_fil;
RThigh = segCenter_cal.RThigh_loc_fil;
RKnee = segCenter_cal.RKnee_loc_fil;

%% Reformat marker data into x,y,z components
%x,y,z components for markers in thigh segment
markersX_raw = [LHip(1,:);LThigh(1,:);LKnee(1,:)];
markersY_raw = [LHip(2,:);LThigh(2,:);LKnee(2,:)];
markersZ_raw = [LHip(3,:);LThigh(3,:);LKnee(3,:)];

%Average position of markers around the joint
markersX_mean = mean(markersX_raw);
markersY_mean = mean(markersY_raw);
markersZ_mean = mean(markersZ_raw);

%% Create variables for function
%Joint center mean markers into vector notation
HipJointMarkers_mean = [markersX_mean; markersY_mean; markersZ_mean];

%First marker to evaluate joint center
firstMarker = LHip;

%Starting point of JointCenter guess
initialGuess = [0;0;0];

%% Error function initiation
%with JointCenterGuess being the average loc using select markers
JointCenterError = @(JointCenterGuess) JointCenterErrorFun(firstMarker, JointCenterGuess, HipJointMarkers_mean);

%% Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A =     [];
b =     [];
Aeq =   [];
beq =   [];
lb =    0;
ub =    1;

%% Initiates optimizer and calibrates results
%initialGuess initiates optimizer
%jointCenter difference = Optimized joint center loc in x,y,z
[jointCenterDifference, jointCenterError] = fmincon(JointCenterError, initialGuess,A,b,Aeq,beq,lb,ub,[],opts);

%Calibrates results considering initialGuess
HipJointCenter = [(jointCenterDifference(1)+ markersX_mean);...
    (jointCenterDifference(2)+ markersY_mean);...
    (jointCenterDifference(3)+ markersZ_mean)]; 

%% Visual representation of accuracy
figure(7447)
for ii = 1:20:length(LHip)
   clf
   plot3(LThigh(1,ii),LThigh(2,ii),LThigh(3,ii),'k.','MarkerSize',15)
   hold on
   plot3(HipJointCenter(1,ii),HipJointCenter(2,ii),HipJointCenter(3,ii),...
       'r.','MarkerSize',15)
end



end