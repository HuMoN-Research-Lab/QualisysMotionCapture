function [error] = JointCenterErrorFun(firstMarker,JointCenterGuess,HipJointMarkers_mean,v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function ID's the errors of joint center loc given specific markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create variables for JointCenterGuess
% Variable will change with every iteration of the optimiser to adjust the 
% JointCenterGuess to the optimal Joint Center Location
JointCenterAttempt = [(HipJointMarkers_mean(1,:)+ JointCenterGuess(1));...
    (HipJointMarkers_mean(2,:) + JointCenterGuess(2));...
    (HipJointMarkers_mean(3,:) + JointCenterGuess(3))]; 

%Establish joint center as origin
NormalizedSegmentX = JointCenterAttempt(1,:) - firstMarker(1,:);
NormalizedSegmentY = JointCenterAttempt(2,:) - firstMarker(2,:);
NormalizedSegmentZ = JointCenterAttempt(3,:) - firstMarker(3,:);

%% Convert cartesian to spherical coordinates
%Function output = distance from the joint center to the segment center
[azi,Elevation,SegmentDistance] = cart2sph(NormalizedSegmentX,NormalizedSegmentY,NormalizedSegmentZ);

%Segment center from frame-to-frame difference
frame_to_frame_diff = diff(SegmentDistance);

%Create error as the sum of the distance -- this is what is being optimized
%because if this error is zero that would mean that the length of the
%segment from joint center to segment center would be the same in every
%frame
error = sum(abs(diff((SegmentDistance))));
% Started at this, ended at this
% error  = num 
% sqrterror = erro.^2
% Take sum squared error divided by frames
%Plot the differences
figure(2814983)
open(v)
plot(frame_to_frame_diff)
xlabel('Frame')
ylabel('Segment length difference (mm)')
title('Segment Length Optimization')
drawnow
frame = getframe(gcf);
writeVideo(v,frame);

end