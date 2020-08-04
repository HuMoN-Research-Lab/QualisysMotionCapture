function [JointCenterError] = JointCenterErrorFun_Upper(segCenter,markers,figNum,weights,numOfWeights,segCenterVariable,visualize)%,v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function ID's the errors of joint center loc given specific markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Markers Needed for JointCenter Eval
%Femur markers & segCenters
HeadL =             segCenterVariable.HeadL;
HeadTop =           segCenterVariable.HeadTop;
HeadR =             segCenterVariable.HeadR;
HeadFront =         segCenterVariable.HeadFront;
HeadCenter =        segCenterVariable.HeadCenter;
SpineTop =          segCenterVariable.SpineTop;
NeckCenter =        segCenterVariable.NeckCenter;
BackL =             segCenterVariable.BackL;
BackR =             segCenterVariable.BackR;
BackCenter =        segCenterVariable.BackCenter;
TorsoCenter =       segCenterVariable.TorsoCenter;
HipCenter =         segCenterVariable.HipCenter;

% if use_MarkerClusters
%     LUpperLegCluster1 = segCenterVariable.LUpLegCluster1;
%     LUpperLegCluster2 = segCenterVariable.LUpLegCluster2;
%     RUpperLegCluster1 = segCenterVariable.RUpLegCluster1;
%     RUpperLegCluster2 = segCenterVariable.RUpLegCluster2;
% end

%Shoulder markers & segCenters
LShoulderTop =      segCenterVariable.LShoulderTop;
RShoulderTop =      segCenterVariable.RShoulderTop;
LShoulderCenter =   segCenterVariable.LShoulderCenter;
RShoulderCenter =   segCenterVariable.RShoulderCenter;
LShoulderBack =     segCenterVariable.LShoulderBack;
RShoulderBack =     segCenterVariable.RShoulderBack;

%UpperArm markers & segCenters
LArm =              segCenterVariable.LArm;
RArm =              segCenterVariable.RArm;
LUpperArmCenter =   segCenterVariable.LUpperArmCenter;
RUpperArmCenter =   segCenterVariable.RUpperArmCenter;
LElbow =            segCenterVariable.LElbow;
RElbow =            segCenterVariable.RElbow;

%Forearm markers & segCenterVariables
LForearmCenter =    segCenterVariable.LForearmCenter;
RForearmCenter =    segCenterVariable.RForearmCenter;

%Hand markers & segCenterVariables
LWristOut =         segCenterVariable.LWristOut;
LWristIn =          segCenterVariable.LWristIn;
LWristCenter =      segCenterVariable.LWristCenter;
LHandOut =          segCenterVariable.LHandOut;
LHandCenter =       segCenterVariable.LHandCenter;
RWristOut =         segCenterVariable.RWristOut;
RWristIn =          segCenterVariable.RWristIn;
RWristCenter =      segCenterVariable.RWristCenter;
RHandOut =          segCenterVariable.RHandOut;
RHandCenter =       segCenterVariable.RHandCenter;

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
    hold on
    for ii = 5
        %Plot of middle of human skeleton
        plot3([HeadCenter(1,ii);NeckCenter(1,ii);TorsoCenter(1,ii);HipCenter(1,ii)],...
            [HeadCenter(2,ii);NeckCenter(2,ii);TorsoCenter(2,ii);HipCenter(2,ii)],...
            [HeadCenter(3,ii);NeckCenter(3,ii);TorsoCenter(3,ii);HipCenter(3,ii)],'-k','LineWidth',2)        
        
        %Upper markers
        plot3(HeadL(1,ii),HeadL(2,ii),HeadL(3,ii),'k.','MarkerSize',5)
        plot3(HeadTop(1,ii),HeadTop(2,ii),HeadTop(3,ii),'k.','MarkerSize',5)
        plot3(HeadR(1,ii),HeadR(2,ii),HeadR(3,ii),'k.','MarkerSize',5)
        plot3(HeadFront(1,ii),HeadFront(2,ii),HeadFront(3,ii),'k.','MarkerSize',5)
        plot3(SpineTop(1,ii),SpineTop(2,ii),SpineTop(3,ii),'k.','MarkerSize',5)
%         plot3(BackL(1,ii),BackL(2,ii),BackL(3,ii),'k.','MarkerSize',5)
%         plot3(BackR(1,ii),BackR(2,ii),BackR(3,ii),'k.','MarkerSize',5)
        
        %LUpper Markers
        plot3(LShoulderTop(1,ii),LShoulderTop(2,ii),LShoulderTop(3,ii),'k.','MarkerSize',5)
        plot3(LShoulderBack(1,ii),LShoulderBack(2,ii),LShoulderBack(3,ii),'k.','MarkerSize',5)
        plot3(LArm(1,ii),LArm(2,ii),LArm(3,ii),'k.','MarkerSize',5)
        plot3(LElbow(1,ii),LElbow(2,ii),LElbow(3,ii),'k.','MarkerSize',5)
        plot3(LWristOut(1,ii),LWristOut(2,ii),LWristOut(3,ii),'k.','MarkerSize',5)
        plot3(LWristIn(1,ii),LWristIn(2,ii),LWristIn(3,ii),'k.','MarkerSize',5)
        plot3(LHandOut(1,ii),LHandOut(2,ii),LHandOut(3,ii),'k.','MarkerSize',5)
        
        %RUpper Markers
        plot3(RShoulderTop(1,ii),RShoulderTop(2,ii),RShoulderTop(3,ii),'k.','MarkerSize',5)
        plot3(RShoulderBack(1,ii),RShoulderBack(2,ii),RShoulderBack(3,ii),'k.','MarkerSize',5)
        plot3(RArm(1,ii),RArm(2,ii),RArm(3,ii),'k.','MarkerSize',5)
        plot3(RElbow(1,ii),RElbow(2,ii),RElbow(3,ii),'k.','MarkerSize',5)
        plot3(RWristOut(1,ii),RWristOut(2,ii),RWristOut(3,ii),'k.','MarkerSize',5)
        plot3(RWristIn(1,ii),RWristIn(2,ii),RWristIn(3,ii),'k.','MarkerSize',5)
        plot3(RHandOut(1,ii),RHandOut(2,ii),RHandOut(3,ii),'k.','MarkerSize',5)
        
        %Optimization output
        plot3(segVisual(1,ii),segVisual(2,ii),segVisual(3,ii),'*r','MarkerSize',8);
        
        %Plotting w/out JointCenters
        plot3([NeckCenter(1,ii);LShoulderCenter(1,ii);LUpperArmCenter(1,ii);LElbow(1,ii);LForearmCenter(1,ii);LWristOut(1,ii)],...
            [NeckCenter(2,ii);LShoulderCenter(2,ii);LUpperArmCenter(2,ii);LElbow(2,ii);LForearmCenter(2,ii);LWristOut(2,ii)],...
            [NeckCenter(3,ii);LShoulderCenter(3,ii);LUpperArmCenter(3,ii);LElbow(3,ii);LForearmCenter(3,ii);LWristOut(3,ii)],'-b','LineWidth',2)
        %Plotting w/out JointCenters
        plot3([NeckCenter(1,ii);RShoulderCenter(1,ii);RUpperArmCenter(1,ii);RElbow(1,ii);RForearmCenter(1,ii);RWristOut(1,ii)],...
            [NeckCenter(2,ii);RShoulderCenter(2,ii);RUpperArmCenter(2,ii);RElbow(2,ii);RForearmCenter(2,ii);RWristOut(2,ii)],...
            [NeckCenter(3,ii);RShoulderCenter(3,ii);RUpperArmCenter(3,ii);RElbow(3,ii);RForearmCenter(3,ii);RWristOut(3,ii)],'-r','LineWidth',2)
            
        axis equal
        grid on
        
        xlim([-500  1.5e3])
        ylim([-750   3e3])
        zlim([0     1.95e3])
        
        %Right side view
        az = 69.5695;
        el = 17.3879;
        
%         if use_MarkerClusters
%             %TPose Settings
%             xlim([-500  1.5e3])
%             ylim([-750   3e3])
%             zlim([0     1.95e3])
%             
%             %Right side view
%             az = 69.5695;
%             el = 17.3879;
%             
% %             %Left side view
% %             az = -30.8155;
% %             el = 6.8338;
%             
%         else
%             %Full Lab Settings
%             xlim([0     1e3])
%             ylim([-3e3  -1.5e3])
%             zlim([0     1.95e3])
%             
%             %Left Side
%             az = 231.8574;
%             el = 16.8769;
%             
% %             %Right Side
% %             az = 123.4475;
% %             el = 22.8856;
%         end        
        

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