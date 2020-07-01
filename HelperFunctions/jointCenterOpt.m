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

end