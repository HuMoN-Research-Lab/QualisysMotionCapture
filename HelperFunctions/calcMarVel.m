function [marVel] = calcMarVel(totalCOMXYZ)

%% Marker tracking hip data
%hipIDs were acquired using the markerLabels
marVel = [];

%Velocity of hips
marVel =  [0 0 0; diff(totalCOMXYZ.')];

%calculates acceleration of hips
%hipsAcc = [0 0 0; diff(hipsVel)];

end

