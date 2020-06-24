function [error] = JointCenterError(SegmentCenters,JointCenterGuess)
[azi,elevation,SegmentDist] = cart2sph(SegmentCenters(1),SegmentCenters(2) ,SegmentCenters(3));
[azi,elevation,JointCenterDist] = cart2sph(JointCenterGuess(1),JointCenterGuess(2), JointCenterGuess(3));
error = sum(diff((SegmentDist-JointCenterDist)));
end