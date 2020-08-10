function [angles] = calc_joint_angle(segCenter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function calculated joint angle 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References:	
%       (1) Grood, E.W., and Suntay, W.J. (1983) A joint coordinate 
%		    system for the clinical description of three-dimensional 
%		    motions: applications to the knee. 
%		    J. biomech. Engng 105, 136-144.
%       (2) Spoor and Veldpaus (1980) Rigid body motion calculated
%           from spatial co-ordinates of markers. J Biomech 13: 391-393

%% Create starting origin for femur and tibia
LFemur_origin(1:3,1) =  segCenter.LThigh(1:3,1);
LFemur_origin(4:6,1) =  segCenter.LKnee(1:3,1);
LFemur_origin(7:9,1) =  segCenter.LLeg(1:3,1);

LTib_origin(1:3,1) =    segCenter.LThigh(1:3,1);
LTib_origin(4:6,1) =    segCenter.LKnee(1:3,1);
LTib_origin(7:9,1) =    segCenter.LLeg(1:3,1);

LFemur_mov(1:3,:) =     segCenter.LThigh(1:3,:);
LFemur_mov(4:6,:) =     segCenter.LKnee(1:3,:);
LFemur_mov(7:9,:) =     segCenter.LLeg(1:3,:);

LTib_mov(1:3,:) =       segCenter.LThigh(1:3,:);
LTib_mov(4:6,:) =       segCenter.LKnee(1:3,:);
LTib_mov(7:9,:) =       segCenter.LLeg(1:3,:);

%% Acquire angles
[angles,helicang] = rev_cardan(LFemur_origin,LTib_origin,LFemur_mov,LTib_mov,'zxy');

end