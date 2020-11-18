function [totalCOM_metrics,trial_start_end,vel_start_end,acc_start_end] = calc_COMXYZ_vel_acc_jerk(totalCOMXYZ,num_frames)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates vel,acc,and jerk using segCenter of respective foot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%differences might be magnified in diff dimensions
%free walking people walk faster
%limited walking people walk slower but evaluate diff dimension 

%% Define output structure
totalCOM_metrics = [];
vel_frames = (num_frames-1);

%% COM vel, acc, and jerk calculations
%movement of totalCOM used to ID start of trial
marVelx =                       diff(totalCOMXYZ(1,:));
marVely_calc =                  diff(totalCOMXYZ(2,:));
marVelz =                       diff(totalCOMXYZ(3,:));

for ii = 1:vel_frames
    if mean(marVely_calc) <= 0
        marVely(1,ii) = -marVely_calc(1,ii);
    else
        marVely = marVely_calc;
    end
end

calc_totalmarVel =              plus(marVelx,marVely);
trial_start_end =               find(calc_totalmarVel > 2);

for jj = 1:length(trial_start_end)
    time_start_end(1,jj) = (trial_start_end(1,jj))/300;
end

vel_start_end = resample(time_start_end,length(time_start_end)-1,length(time_start_end));
acc_start_end = resample(vel_start_end,length(vel_start_end)-1,length(vel_start_end));
% figure(1)
% plot(calc_totalmarVel)

%velx, accx, and jerkx
totalCOM_metrics.marVelx =         marVelx(trial_start_end);
totalCOM_metrics.marAccx =         diff(totalCOM_metrics.marVelx);
totalCOM_metrics.absMarJerkx =     abs(diff(totalCOM_metrics.marAccx));

%vely, accy, and jerky 
totalCOM_metrics.marVely =         marVely(trial_start_end);
totalCOM_metrics.marAccy =         diff(totalCOM_metrics.marVely);
totalCOM_metrics.absMarJerky =     abs(diff(totalCOM_metrics.marAccy));

%velz, accz, and jerkz
totalCOM_metrics.marVelz =         marVelz(trial_start_end);
totalCOM_metrics.marAccz =         diff(totalCOM_metrics.marVelz);
totalCOM_metrics.absMarJerkz =     abs(diff(totalCOM_metrics.marAccz));

%total marker vel, acc, and jerk calc
totalCOM_metrics.totalmarVel =         calc_totalmarVel(trial_start_end);
totalCOM_metrics.totalmarAcc =         diff(totalCOM_metrics.totalmarVel);
totalCOM_metrics.totalmarJerk =        diff(totalCOM_metrics.totalmarAcc);
totalCOM_metrics.totalmarJerk_abs =    abs(totalCOM_metrics.totalmarJerk);

end

