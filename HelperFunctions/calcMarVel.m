function [segCenterVel] = calcMarVel(segCenter)

%% Marker tracking hip data
%hipIDs were acquired using the markerLabels
segCenterVel = [];

%Velocity of hips
segCenterVel.hip =  [0 0 0; diff(segCenter.hipCenter_mar_dim_frame)];

%calculates acceleration of hips
%hipsAcc = [0 0 0; diff(hipsVel)];

end

