function [error] = JointCenterErrorFun(segCenter,markers,figNum,weights)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function ID's the errors of joint center loc given specific markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the weighted average of markers
for ii = 1:numOfWeights
    weightedMarkers(:,:,ii)= markers(:,:,ii)*weights(ii);
end
weightedMarkerAverage = mean(weightedMarkers,3);

%% Create variables for JointCenterGuess
%Establish joint center as origin
NormalizedSegmentX = weightedMarkerAverage(1,:) - segCenter(1,:);
NormalizedSegmentY = weightedMarkerAverage(2,:) - segCenter(2,:);
NormalizedSegmentZ = weightedMarkerAverage(3,:) - segCenter(3,:);

%% Convert cartesian to spherical coordinates
%Function output = distance from the joint center to the segment center
[azi,Elevation,SegmentDistance] = cart2sph(NormalizedSegmentX,NormalizedSegmentY,NormalizedSegmentZ);

%Segment center from frame-to-frame difference
frame_to_frame_diff = diff(SegmentDistance);

%Create error as the sum of the distance -- this is what is being optimized
%because if this error is zero that would mean that the length of the
%segment from joint center to segment center would be the same in every
%frame
% error = sum(abs(diff((SegmentDistance))));
error = sum(diff(SegmentDistance).^2);

% Take sum squared error divided by frames
%Plot the differences
figure(figNum)
% open(v)
plot(frame_to_frame_diff)
xlabel('Frame')
ylabel('Segment length difference (mm)')
title('Segment Length Optimization')
drawnow

% frame = getframe(gcf);
% writeVideo(v,frame);


% %First attempt with optimizer
% % Variable will change with every iteration of the optimiser to adjust the 
% % JointCenterGuess to the optimal Joint Center Location
% JointCenterAttempt = [(marker2(1,:)+ marker1(1));...
%     (marker2(2,:) + marker1(2));...
%     (marker2(3,:) + marker1(3))]; 


end