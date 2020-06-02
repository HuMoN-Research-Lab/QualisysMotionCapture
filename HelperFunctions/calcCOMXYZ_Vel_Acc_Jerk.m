function [totalCOM_calc,trial_start_end] = calcCOMXYZ_Vel_Acc_Jerk(totalCOMXYZ)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates vel,acc,and jerk using segCenter of respective foot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%differences might be magnified in diff dimensions
%free walking people walk faster
%limited walking people walk slower but evaluate diff dimension 

%% Define output structure
totalCOM_calc = [];

%% COM vel, acc, and jerk calculations
%movement of totalCOM used to ID start of trial
marVelx =                       diff(totalCOMXYZ(1,:));
marVely =                       diff(totalCOMXYZ(2,:));
marVelz =                       diff(totalCOMXYZ(3,:));
calc_totalmarVel =              plus(marVelx,marVely);
trial_start_end =               find(calc_totalmarVel > 2);

%velx, accx, and jerkx
totalCOM_calc.marVelx =         marVelx(trial_start_end);
totalCOM_calc.marAccx =         diff(totalCOM_calc.marVelx);
totalCOM_calc.absMarJerkx =     abs(diff(totalCOM_calc.marAccx));

%vely, accy, and jerky 
totalCOM_calc.marVely =         marVely(trial_start_end);
totalCOM_calc.marAccy =         diff(totalCOM_calc.marVely);
totalCOM_calc.absMarJerky =     abs(diff(totalCOM_calc.marAccy));

%velz, accz, and jerkz
totalCOM_calc.marVelz =         marVelz(trial_start_end);
totalCOM_calc.marAccz =         diff(totalCOM_calc.marVelz);
totalCOM_calc.absMarJerkz =     abs(diff(totalCOM_calc.marAccz));

%total marker vel, acc, and jerk calc
totalCOM_calc.totalmarVel =         calc_totalmarVel(trial_start_end);
totalCOM_calc.totalmarAcc =         diff(totalCOM_calc.totalmarVel);
totalCOM_calc.totalmarJerk =        diff(totalCOM_calc.totalmarAcc);
totalCOM_calc.totalmarJerk_abs =    abs(totalCOM_calc.totalmarJerk);

end

