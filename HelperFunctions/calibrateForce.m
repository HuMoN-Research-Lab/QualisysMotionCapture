function [Force_cal] = calibrateForce(Force,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calibrates COP data to its respective location on force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
Force_cal = [];

%% Reformat force data filtering
forceConfig1x = Force.force_plate1(1,:);
forceConfig1y = Force.force_plate1(2,:);
forceConfig1z = Force.force_plate1(3,:);

forceConfig2x = Force.force_plate2(1,:);
forceConfig2y = Force.force_plate2(2,:);
forceConfig2z = Force.force_plate2(3,:);

forceConfig3x = Force.force_plate3(1,:);
forceConfig3y = Force.force_plate3(2,:);
forceConfig3z = Force.force_plate3(3,:);

forceConfig4x = Force.force_plate4(1,:);
forceConfig4y = Force.force_plate4(2,:);
forceConfig4z = Force.force_plate4(3,:);

forceConfig5x = Force.force_plate5(1,:);
forceConfig5y = Force.force_plate5(2,:);
forceConfig5z = Force.force_plate5(3,:);

%Filter data to start of trial
Force_cal.fp1 =       forceConfig1x(trial_start_end);
Force_cal.fp1(2,:) =  forceConfig1y(trial_start_end);
Force_cal.fp1(3,:) =  forceConfig1z(trial_start_end);

Force_cal.fp2 =       forceConfig2x(trial_start_end);
Force_cal.fp2(2,:) =  forceConfig2y(trial_start_end);
Force_cal.fp2(3,:) =  forceConfig2z(trial_start_end);

Force_cal.fp3 =       forceConfig3x(trial_start_end);
Force_cal.fp3(2,:) =  forceConfig3y(trial_start_end);
Force_cal.fp3(3,:) =  forceConfig3z(trial_start_end);

Force_cal.fp4 =       forceConfig4x(trial_start_end);
Force_cal.fp4(2,:) =  forceConfig4y(trial_start_end);
Force_cal.fp4(3,:) =  forceConfig4z(trial_start_end);

Force_cal.fp5 =       forceConfig5x(trial_start_end);
Force_cal.fp5(2,:) =  forceConfig5y(trial_start_end);
Force_cal.fp5(3,:) =  forceConfig5z(trial_start_end);

%% Force plate location data
ForcePlate1_loc_raw =   Force.force_plate1_loc;
ForcePlate2_loc_raw =   Force.force_plate2_loc;
ForcePlate3_loc_raw =   Force.force_plate3_loc;
ForcePlate4_loc_raw =   Force.force_plate4_loc;
ForcePlate5_loc_raw =   Force.force_plate5_loc;

%Calibrate center of force plates
ForcePlate1_loc = mean(ForcePlate1_loc_raw,1);
ForcePlate2_loc = mean(ForcePlate2_loc_raw,1);
ForcePlate3_loc = mean(ForcePlate3_loc_raw,1);
ForcePlate4_loc = mean(ForcePlate4_loc_raw,1);
ForcePlate5_loc = mean(ForcePlate5_loc_raw,1);

%% COP force data filtering and configuration
COPConfig1x =   Force.COP_plate1(1,:);
COPConfig1y =   Force.COP_plate1(2,:);
COPConfig1z =   Force.COP_plate1(3,:);

COPConfig2x =   Force.COP_plate2(1,:);
COPConfig2y =   Force.COP_plate2(2,:);
COPConfig2z =   Force.COP_plate2(3,:);

COPConfig3x =   Force.COP_plate3(1,:);
COPConfig3y =   Force.COP_plate3(2,:);
COPConfig3z =   Force.COP_plate3(3,:);

COPConfig4x =   Force.COP_plate4(1,:);
COPConfig4y =   Force.COP_plate4(2,:);
COPConfig4z =   Force.COP_plate4(3,:);

COPConfig5x =   Force.COP_plate5(1,:);
COPConfig5y =   Force.COP_plate5(2,:);
COPConfig5z =   Force.COP_plate5(3,:);

%Filter data to start and end of trial
COP1 =      COPConfig1x(trial_start_end);
COP1(2,:) = COPConfig1y(trial_start_end);
COP1(3,:) = COPConfig1z(trial_start_end);

COP2 =      COPConfig2x(trial_start_end);
COP2(2,:) = COPConfig2y(trial_start_end);
COP2(3,:) = COPConfig2z(trial_start_end);

COP3 =      COPConfig3x(trial_start_end);
COP3(2,:) = COPConfig3y(trial_start_end);
COP3(3,:) = COPConfig3z(trial_start_end);

COP4 =      COPConfig4x(trial_start_end);
COP4(2,:) = COPConfig4y(trial_start_end);
COP4(3,:) = COPConfig4z(trial_start_end);

COP5 =      COPConfig5x(trial_start_end);
COP5(2,:) = COPConfig5y(trial_start_end);
COP5(3,:) = COPConfig5z(trial_start_end);

%% Calibrate COP to global reference frame
%Force Plate 1
Force_cal.COP1 =        COP1(1,:)+ForcePlate1_loc(1);
Force_cal.COP1(2,:) =   COP1(2,:)+ForcePlate1_loc(2);
Force_cal.COP1(3,:) =   COP1(3,:)+ForcePlate1_loc(3);

%Force Plate 2
Force_cal.COP2 =        COP2(1,:)+ForcePlate2_loc(1);
Force_cal.COP2(2,:) =   COP2(2,:)+ForcePlate2_loc(2);
Force_cal.COP2(3,:) =   COP2(3,:)+ForcePlate2_loc(3);

%Force Plate 3
Force_cal.COP3 =        COP3(1,:)+ForcePlate3_loc(1);
Force_cal.COP3(2,:) =   COP3(2,:)+ForcePlate3_loc(2);
Force_cal.COP3(3,:) =   COP3(3,:)+ForcePlate3_loc(3);

%Force Plate 4
Force_cal.COP4 =        COP4(1,:)+ForcePlate4_loc(1);
Force_cal.COP4(2,:) =   COP4(2,:)+ForcePlate4_loc(2);
Force_cal.COP4(3,:) =   COP4(3,:)+ForcePlate4_loc(3);

%Force Plate 5
Force_cal.COP5 =        COP5(1,:)+ForcePlate5_loc(1);
Force_cal.COP5(2,:) =   COP5(2,:)+ForcePlate5_loc(2);
Force_cal.COP5(3,:) =   COP5(3,:)+ForcePlate5_loc(3);

end