function [marVel,marAcc,marJerk,marJerk_squared] = calcMar_Vel_Acc_Jerk(totalCOMXYZ)

%% Marker tracking hip data
%hipIDs were acquired using the markerLabels
marVel =  [];
marAcc =  [];
marJerk = [];
totalCOMXYZ = totalCOMXYZ.';
%Velocity of hips
marVel =            diff(totalCOMXYZ');
marAcc =            diff(marVel);
marJerk =           diff(marAcc);
marJerk_squared =   (marJerk).^2;

%calculates acceleration of hips
%hipsAcc = [0 0 0; diff(hipsVel)];

end

