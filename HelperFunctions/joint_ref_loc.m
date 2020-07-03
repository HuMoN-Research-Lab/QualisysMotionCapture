function [JointMars_mean] = joint_ref_loc(Marker1,Marker2,Marker3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Reformat markers and segments for optimization purposes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reformat LMarker data into x,y,z components
MarX_raw = [Marker1(1,:);Marker2(1,:);Marker3(1,:)]; %;RHipCenter(1,:)]; %;LKnee(1,:)
MarY_raw = [Marker1(2,:);Marker2(2,:);Marker3(2,:)]; %;RHipCenter(2,:)]; %;LKnee(2,:)
MarZ_raw = [Marker1(3,:);Marker2(3,:);Marker3(3,:)]; %;RHipCenter(3,:)]; %;LKnee(3,:)

%Average position of markers around the joint
MarX_mean = mean(MarX_raw);
MarY_mean = mean(MarY_raw);
MarZ_mean = mean(MarZ_raw);

%Joint center mean markers into vector notation
JointMars_mean = [MarX_mean;MarY_mean;MarZ_mean];

%% Marker weight conversion

%x,y,z components for markers in thigh segment
% LHipFront_weight =  0.333;
% LHipBack_weight =   0.333;
% LThigh_weight =     0.333;
% 
% [LHipFront,LHipBack,LThigh] = mar_seg_weight_conv(LHipFront,LHipBack,...
%     LThigh,LHipFront_weight,LHipBack_weight,LThigh_weight);

end