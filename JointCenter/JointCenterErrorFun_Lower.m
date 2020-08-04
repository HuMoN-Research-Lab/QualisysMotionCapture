function [JointCenterError] = JointCenterErrorFun_Lower(segCenter,markers,figNum,weights,numOfWeights,segCenterVariable,visualize,use_MarkerClusters)%,v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function ID's the errors of joint center loc given specific markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Markers Needed for JointCenter Eval
%Lower extremity markers & segCenters
LHipFront =         segCenterVariable.LHipFront;
RHipFront =         segCenterVariable.RHipFront;
LHipBack =          segCenterVariable.LHipBack;
RHipBack =          segCenterVariable.RHipBack;
LHipCenter =        segCenterVariable.LHipCenter;
RHipCenter =        segCenterVariable.RHipCenter;
LThigh =            segCenterVariable.LThigh;
LThighCenter =      segCenterVariable.LThighCenter;
RThigh =            segCenterVariable.RThigh;
RThighCenter =      segCenterVariable.RThighCenter;
if use_MarkerClusters
    LUpperLegCluster1 = segCenterVariable.LUpLegCluster1;
    LUpperLegCluster2 = segCenterVariable.LUpLegCluster2;
    RUpperLegCluster1 = segCenterVariable.RUpLegCluster1;
    RUpperLegCluster2 = segCenterVariable.RUpLegCluster2;
end

%Tibia markers & segCenters
LKnee =             segCenterVariable.LKnee;
RKnee =             segCenterVariable.RKnee;
LLegCenter =        segCenterVariable.LLegCenter;
RLegCenter =        segCenterVariable.RLegCenter;

%Foot markers & segCenters
LAnkle =            segCenterVariable.LAnkle;
RAnkle =            segCenterVariable.RAnkle;
LForefoot =         segCenterVariable.LForefoot;
RForefoot =         segCenterVariable.RForefoot;
LHeel =             segCenterVariable.LHeel;
RHeel =             segCenterVariable.RHeel;
LToeTip =           segCenterVariable.LToeTip;
RToeTip =           segCenterVariable.RToeTip;

%% Find the weighted average of markers
for ii = 1:numOfWeights
    weightedMarkers(:,:,ii)= markers(:,:,ii)*weights(ii);
end
weightedMarkerAverage = sum(weightedMarkers,3);

%% Create variables for JointCenterGuess
%Establish joint center as origin
NormalizedSeg(1,:) = weightedMarkerAverage(1,:) - segCenter(1,:);
NormalizedSeg(2,:) = weightedMarkerAverage(2,:) - segCenter(2,:);
NormalizedSeg(3,:) = weightedMarkerAverage(3,:) - segCenter(3,:);

%% Convert cartesian to spherical coordinates
%Function output = distance from the joint center to the segment center
[azi,Elevation,SegmentDistance] = cart2sph(NormalizedSeg(1,:),NormalizedSeg(2,:),NormalizedSeg(3,:));

%Segment center from frame-to-frame difference
frame_to_frame_diff = diff(SegmentDistance);

%Create error as the sum of the distance -- this is what is being optimized
%because if this error is zero that would mean that the length of the
%segment from joint center to segment center would be the same in every
%frame
% error = sum(abs(diff((SegmentDistance))));
JointCenterError = sum(diff(SegmentDistance).^2);

% Take sum squared error divided by frames
%Plot the differences
figure(figNum)
% open(v)

%% Visualization of optimization
for ii = 1:3
    segVisual(ii,:) = NormalizedSeg(ii,:) + segCenter(ii,:);  
end

if visualize
    for ii = 5
        %Plot of right side of human skeleton
        plot3([RHipCenter(1,ii);RKnee(1,ii);RAnkle(1,ii);RForefoot(1,ii);RToeTip(1,ii)],...
            [RHipCenter(2,ii);RKnee(2,ii);RAnkle(2,ii);RForefoot(2,ii);RToeTip(2,ii)],...
            [RHipCenter(3,ii);RKnee(3,ii);RAnkle(3,ii);RForefoot(3,ii);RToeTip(3,ii)],'-r','LineWidth',2)
        hold on
        %Plot of left side of human skeleton
        plot3([LHipCenter(1,ii);LKnee(1,ii);LAnkle(1,ii);LForefoot(1,ii);LToeTip(1,ii)],...
            [LHipCenter(2,ii);LKnee(2,ii);LAnkle(2,ii);LForefoot(2,ii);LToeTip(2,ii)],...
            [LHipCenter(3,ii);LKnee(3,ii);LAnkle(3,ii);LForefoot(3,ii);LToeTip(3,ii)],'-b','LineWidth',2)
        
        %LLower Markers
        plot3(LHipFront(1,ii),LHipFront(2,ii),LHipFront(3,ii),'k.','MarkerSize',5)
        plot3(LHipBack(1,ii),LHipBack(2,ii),LHipBack(3,ii),'k.','MarkerSize',5)
        plot3(LHipCenter(1,ii),LHipCenter(2,ii),LHipCenter(3,ii),'g.','MarkerSize',10)
        plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',5);
        plot3(LAnkle(1,ii),LAnkle(2,ii),LAnkle(3,ii),'k.','MarkerSize',5);
        plot3(LHeel(1,ii),LHeel(2,ii),LHeel(3,ii),'k.','MarkerSize',5);
        plot3(LToeTip(1,ii),LToeTip(2,ii),LToeTip(3,ii),'k.','MarkerSize',5);
        
        %RLower Markers
        plot3(RHipFront(1,ii),RHipFront(2,ii),RHipFront(3,ii),'k.','MarkerSize',5)
        plot3(RHipBack(1,ii),RHipBack(2,ii),RHipBack(3,ii),'k.','MarkerSize',5)
        plot3(RHipCenter(1,ii),RHipCenter(2,ii),RHipCenter(3,ii),'g.','MarkerSize',10)
        plot3(RKnee(1,ii),RKnee(2,ii),RKnee(3,ii),'k.','MarkerSize',5);
        plot3(RAnkle(1,ii),RAnkle(2,ii),RAnkle(3,ii),'k.','MarkerSize',5);
        plot3(RHeel(1,ii),RHeel(2,ii),RHeel(3,ii),'k.','MarkerSize',5);
        plot3(RToeTip(1,ii),RToeTip(2,ii),RToeTip(3,ii),'k.','MarkerSize',5);
        
        %Optimization output
        plot3(segVisual(1,ii),segVisual(2,ii),segVisual(3,ii),'*r','MarkerSize',8);
        
        axis equal
        grid on
        
        if use_MarkerClusters
            %TPose Settings
            xlim([-500  1.5e3])
            ylim([-750   3e3])
            zlim([0     1.95e3])
            
            %Right side view
            az = 69.5695;
            el = 17.3879;
            
%             %Left side view
%             az = -30.8155;
%             el = 6.8338;
            
        else
            %Full Lab Settings
            xlim([0     1e3])
            ylim([-3e3  -1.5e3])
            zlim([0     1.95e3])
            
            %Left Side
            az = 231.8574;
            el = 16.8769;
            
%             %Right Side
%             az = 123.4475;
%             el = 22.8856;
        end        
        

%         %Center side view
%         az = 90;
%         el = 0;
        
        %     %left side view
        %     az = -30.8155;
        %     el = 6.8338;
        
        %     %right side view
        %     az = 50.9926;
        %     el = 9.9634;
        
        view(az,el)
        drawnow
    end
end
 
% plot(frame_to_frame_diff)
% xlabel('Frame')
% ylabel('Segment length difference (mm)')
% title('Segment Length Optimization')
% drawnow

% frame = getframe(gcf);
% writeVideo(v,frame);

end