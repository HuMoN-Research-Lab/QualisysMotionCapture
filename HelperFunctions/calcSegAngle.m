function [segVel] = calcSegAngle(segCenter,trial_start_end,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcSegVel calculates the velocity of each segCenters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
segAngle = [];

%% Thigh angle calculations
LThigh_mar =    getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut_mar =  getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LThigh_COM =    segCenter.LThighCenter_mar_dim_frame;

% LThigh_posx =   LThigh_mar(1,:) + LThigh_COM*(LThigh_mar(1,:) - LKneeOut_mar(1,:));
% LThigh_posy =   LThigh_mar(2,:) + LThigh_COM*(LThigh_mar(2,:) - LKneeOut_mar(2,:));

LThigh_velx = LThigh.marVelx;
LThigh_vely = LThigh.marVely;

angVel_LThigh = atand(LThigh_vely./LThigh_velx);

end

