function [error] = JointCenterError(SegmentCenter,JointCenterGuess_dist)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%JointCenterError minizes the error from calc joint center
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Convert the average position to spherical coords
%Conversion for JointCenterGuess
[azi,elevation,JointCenterGuess] = cart2sph(JointCenterGuess_dist(1),...
    JointCenterGuess_dist(2), JointCenterGuess_dist(3));

%Conversion for SegmentCenter
[azi,elevation,SegmentDist] = cart2sph(SegmentCenter(1),SegmentCenter(2) ,SegmentCenter(3));

%Error output calc
error = sum(diff((SegmentDist-JointCenterGuess)));

end