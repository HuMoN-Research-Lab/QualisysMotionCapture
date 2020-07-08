function [Force_cal] = indexForce(Force,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calibrates COP data to its respective location on force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
Force_cal = [];

%% Reformat force data filtering
Force_cal.fp1 = Force.force_plate1(:,trial_start_end);
Force_cal.fp2 = Force.force_plate2(:,trial_start_end);
Force_cal.fp3 = Force.force_plate3(:,trial_start_end);
Force_cal.fp4 = Force.force_plate4(:,trial_start_end);
Force_cal.fp5 = Force.force_plate5(:,trial_start_end);

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
COP{1} =   Force.COP_plate1(:,trial_start_end);
COP{2} =   Force.COP_plate2(:,trial_start_end);
COP{3} =   Force.COP_plate3(:,trial_start_end);
COP{4} =   Force.COP_plate4(:,trial_start_end);
COP{5} =   Force.COP_plate5(:,trial_start_end);

%% Calibrate COP to global reference frame
%Force Plate 1
for ii = 1:3
    Force_cal{ii} = COP{ii,ii(ii,:)};
end
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