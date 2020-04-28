
% function [rightTO_HS, leftTO_HS] = ZeniStepFinder(shadow_fr_mar_dim,shadowMarkerNames, avg_fps)
% Reference: Zeni et al. "Two simple methods for determining gait events
% during treadmill and overground walking using kinematic data" (2008)

function [allSteps,step_hs_to_ft_XYZ,peaks,hs_to_ft_Data] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate)

%Convert data into functions format
data_fr_mar_dim = permute(data_mar_dim_frame,[3,1,2]);
shadow_ds_fr_mar_dim = permute(data_mar_dim_frame,[3,1,2]);
shadowMarkerNames = markerLabels;
framerate = 120;
peaks = [];

%right foot heel-toe strike
hs_to_ft_Data.rTO = [];
hs_to_ft_Data.rHS = [];

%left foot heel-toe strike
hs_to_ft_Data.lTO = [];
hs_to_ft_Data.lHS = [];

% The basic idea is to first situate the data by subtracting the x & y
% coordinates of the Root marker from each marker position at each frame,
% essentially setting the origin to the subject's root.
%
% The velocity of each foot in the X direction is then calculated. Zero
% crossings (within a band from Zero) are either toe-offs or heel strikes.
% Positive to Negative denotes heel strike, Negative to Positive denotes
% Toe off.

c3dData = shadow_ds_fr_mar_dim;

% Pull out right and left ankle data before they are zeroed and downsampled
% want all locations/velocities to be sum of z and x axes


rFootID = find(strcmp('RTOE', shadowMarkerNames));
rAnkX_noZ = squeeze(c3dData(:,rFootID,1)); % pull out rFootID marker as X vector
rAnkY_noZ = squeeze(c3dData(:,rFootID,2)); % pull out rFootID marker as Y vector
rAnkZ_noZ = squeeze(c3dData(:,rFootID,3)); % pull out rFootID marker as Z vector

lFootID = find(strcmp('LTOE', shadowMarkerNames));
lAnkX_noZ = squeeze(c3dData(:,lFootID,1)); % pull out lFootID marker as X vector
lAnkY_noZ = squeeze(c3dData(:,lFootID,2)); % pull out lFootID marker as Y vector
lAnkZ_noZ = squeeze(c3dData(:,lFootID,3)); % pull out lFootID marker as Z vector

%define root as 'Body'
BodyID = find(strcmp('SACR',shadowMarkerNames)); %find body marker
root = squeeze(c3dData(:,BodyID,:));


% zero the data first (it's not already zeroed since not downsampled)
for f = 1:numel(c3dData(:,1,1)) %f = Frame
    for m = 1:numel(c3dData(1,:,1)) %m = Marker
        c3dData(f,m,1) = c3dData(f,m,1) - root(f,1);
        c3dData(f,m,2) = c3dData(f,m,2) - root(f,2);
        c3dData(f,m,3) = c3dData(f,m,3) - root(f,3);
    end
end


rAnkX = squeeze(c3dData(:,rFootID,1)); % pull out rFootID marker as X vector
rAnkY = squeeze(c3dData(:,rFootID,2)); % pull out rFootID marker as Y vector
rAnkZ = squeeze(c3dData(:,rFootID,3)); % pull out rFootID marker as Z vector

lAnkX = squeeze(c3dData(:,lFootID,1)); % pull out lFootID marker as X vector
lAnkY = squeeze(c3dData(:,lFootID,2)); % pull out lFootID marker as Y vector
lAnkZ = squeeze(c3dData(:,lFootID,3)); % pull out lFootID marker as Z vector


%find frames wherein subject is moving
rootVel = diff(root(:,1))*mean(framerate)/1000;
posRootVel = abs(rootVel);
startFrame = 1;
endFrame = length(root);

%% Find frames where sub is walking
% thresh = .1;
% startFrame = 0;
% endFrame = 0;
%
% for ii = 1:length(posRootVel)
%
%     if(posRootVel(ii))>thresh & startFrame ==0
%         startFrame = ii;
%         ii = ii + 200;
%     end
%
%     if(posRootVel(ii))<thresh & startFrame > 0 & endFrame == 0
%         endFrame = ii;
%         break
%     end
%
% end
%
% if endFrame == 0
%     endFrame = length(posRootVel);
% end
%
% % %%% Debug Plot
% figure;clf;
% plot(posRootVel)
% hold on
% plot([startFrame endFrame], posRootVel([startFrame endFrame]), 'o')
%

%% Right and Left Ankle Marker Velocity
% add Xvel to Zvel to get 2d vel
rAnkVelX = diff(rAnkX);
rAnkVelZ = diff(rAnkZ);
rAnkVel2D = plus(rAnkVelX, rAnkVelZ);
hs_to_ft_Data.rAnkVel2D = rAnkVel2D;

lAnkVelX = diff(lAnkX);
lAnkVelZ = diff(lAnkZ);
lAnkVel2D = plus(lAnkVelX, lAnkVelZ);
hs_to_ft_Data.lAnkVel2D = lAnkVel2D;

for i = startFrame+1:endFrame-1
    %need to take absolute value to see if it is moving
    
    %Right foot toe offs
    if (rAnkVel2D(i-1) <= 0 && rAnkVel2D(i) > 0)
        hs_to_ft_Data.rTO(end+1) = i;
    end
    
    %Right foot heel strikes
    if (rAnkVel2D(i-1) >= 0 && rAnkVel2D(i) < 0)
        hs_to_ft_Data.rHS(end+1) = i;
    end
    
    %Left foot Toe offs
    if (lAnkVel2D(i-1) <= 0 && lAnkVel2D(i) > 0)
        hs_to_ft_Data.lTO(end+1) = i;
    end
    
    %Left foot heel strikes
    if (lAnkVel2D(i-1) >= 0 && lAnkVel2D(i) < 0)
        hs_to_ft_Data.lHS(end+1) = i;
    end
    
end


% % %remove TO's and HS's that occur when subject is not moving
% %
% % rootVel = tsmovavg( diff(root(:,1)).','s',30 ) *120/1000;
% %
% % ind = find(rootVel > 0.2); %ind = frames in which rootVel is greater than 0.2 m/s
%
% %remove TO's and HS's that are not listed in "ind"
% calcData.rTO = intersect(calcData.rTO,ind);
% calcData.rHS = intersect(calcData.rHS,ind);
%
% calcData.lTO = intersect(calcData.lTO,ind);
% calcData.lHS = intersect(calcData.lHS,ind);

% %Plots for debugging velocity
% figure(302)
% subplot(2,2,1)
% plot(rAnkVel2D,'r-o','MarkerSize',2)
% hold on
% plot(calcData.rTO,0,'mo')
% plot(calcData.rHS,0,'mx')
% grid on
% title('Right Ankle Velocity')
% % ylim([-10 10])
%
% subplot(2,2,2)
% plot(lAnkVel2D, 'b-o','MarkerSize',2)
% hold on
% plot(calcData.lTO,0,'mo')
% plot(calcData.lHS,0,'mx')
% grid on
% title('Left Ankle Velocity')
% ylim([-10 10])
%
% hold on

%% Identify the peaks in velocity data
[pks,locs] = findpeaks(rAnkVel2D,'MinPeakProminence',1);
peaks.rAnkVelPeak = [pks,locs];

[pks,locs] = findpeaks(lAnkVel2D,'MinPeakProminence',1);
peaks.lAnkVelPeak = [pks,locs];

%% Right and Left Ankle Marker Acceleration
% add Xvel to Zvel to get 2d vel
rAnkAccX = diff(rAnkVelX);
rAnkAccZ = diff(rAnkVelZ);
rAnkAcc2D = plus(rAnkAccX, rAnkAccZ);
hs_to_ft_Data.rAnkAcc2D = rAnkAcc2D;

lAnkAccX = diff(lAnkVelX);
lAnkAccZ = diff(lAnkVelZ);
lAnkAcc2D = plus(lAnkAccX, lAnkAccZ);
hs_to_ft_Data.lAnkAcc2D = lAnkAcc2D;

% for i = startFrame+1:endFrame-1
%     %need to take absolute value to see if it is moving
%
%     %Right foot toe offs
%     if rAnkAcc2D(i-1) <= 0 && rAnkAcc2D(i) > 0
%         calcData.rTO(end+1) = i;
%     end
%
%     %Right foot heel strikes
%     if (rAnkAcc2D(i-1) >= 0 && rAnkAcc2D(i) < 0)
%         calcData.rHS(end+1) = i;
%     end
%
%     %Left foot Toe offs
%     if (lAnkAcc2D(i-1) <= 0 && lAnkAcc2D(i) > 0)
%         calcData.lTO(end+1) = i;
%     end
%
%     %Left foot heel strikes
%     if (lAnkAcc2D(i-1) >= 0 && lAnkAcc2D(i) < 0)
%         calcData.lHS(end+1) = i;
%     end
% end

% %% Plots for debugging acceleration code
% % figure(394);
% subplot(2,2,3)
% plot(rAnkAcc2D,'r-o','MarkerSize',2)
% hold on
% plot(calcData.rTO,0,'mo')
% plot(calcData.rHS,0,'mx')
% title('Right Ankle Acceleration')
% % ylim([-1 1])
%
% subplot(2,2,4)
% plot(lAnkAcc2D, 'b-o','MarkerSize',2)
% hold on
% plot(calcData.lTO,0,'mo')
% plot(calcData.lHS,0,'mx')
% title('Left Ankle Acceleration')
% % ylim([-1 1])

%% Right and Left Ankle Marker Jerk
rAnkJerkX = diff(rAnkAccX);
rAnkJerkZ = diff(rAnkAccZ);
rAnkJerk2D = plus(rAnkJerkX, rAnkJerkZ);
rAnkJerk2D = (rAnkJerk2D).^2;
hs_to_ft_Data.rAnkJerk2D = rAnkJerk2D;

lAnkJerkX = diff(lAnkAccX);
lAnkJerkZ = diff(lAnkAccZ);
lAnkJerk2D = plus(lAnkJerkX, lAnkJerkZ);
lAnkJerk2D = (lAnkJerk2D).^2;
hs_to_ft_Data.lAnkJerk2D = lAnkJerk2D;

% % Plots for debugging acceleration code
% subplot(2,2,5)
% plot(rAnkJerk2D,'r-o','MarkerSize',2)
% hold on
% plot(calcData.rTO,0,'mo')
% plot(calcData.rHS,0,'mx')
% title('Right Ankle Jerk')
% % ylim([0 0.008])
%
% subplot(2,2,6)
% plot(lAnkJerk2D, 'b-o','MarkerSize',2)
% hold on
% plot(calcData.lTO,0,'mo')
% plot(calcData.lHS,0,'mx')
% title('Left Ankle Jerk')
% % ylim([0 0.035])

%% remove orphan Toe offs and heel stikes
% body threshold for movement instead of removing orphans

if hs_to_ft_Data.rHS(1)< hs_to_ft_Data.rTO(1)
    hs_to_ft_Data.rHS(1) = [];       %create struct for right heel strike data
end

if hs_to_ft_Data.rTO(end) > hs_to_ft_Data.rHS(end)
    hs_to_ft_Data.rTO(end) = [];     %create struct for ight toe strike data
end

if hs_to_ft_Data.lHS(1)< hs_to_ft_Data.lTO(1)
    hs_to_ft_Data.lHS(1) = [];       %create struct for left heel strike data
end

if hs_to_ft_Data.lTO(end) > hs_to_ft_Data.lHS(end)
    hs_to_ft_Data.lTO(end) = [];     %create struct for left toe strike data
end




if numel(hs_to_ft_Data.rTO) > numel(hs_to_ft_Data.rHS)
    if hs_to_ft_Data.rHS(1) - hs_to_ft_Data.rTO(1) > hs_to_ft_Data.rTO(1) - hs_to_ft_Data.rTO(2) %if the time between calcData.rTO(1) and calcData.rHS(1) is larger than calcData.rTO(1) and calcData.rTO(2), remove calcData.rTO(1)
        hs_to_ft_Data.rTO(1) = [];
    else hs_to_ft_Data.rTO(end) = []; %otherwise, the calcData.rTO(end) is the problem
    end
end

if numel(hs_to_ft_Data.lTO) > numel(hs_to_ft_Data.lHS)
    if hs_to_ft_Data.lHS(1) - hs_to_ft_Data.lTO(1) > hs_to_ft_Data.lTO(1) - hs_to_ft_Data.lTO(2) %if the time between calcData.lTO(1) and calcData.lHS(1) is larger than calcData.lTO(1) and calcData.lTO(2), remove calcData.lTO(1)
        hs_to_ft_Data.lTO(1) = [];
    else hs_to_ft_Data.lTO(end) = [];
    end
end


if numel(hs_to_ft_Data.rHS) > numel(hs_to_ft_Data.rTO)
    if hs_to_ft_Data.rHS(1) < hs_to_ft_Data.rTO(1)
        hs_to_ft_Data.rHS(1) = [];
    else    hs_to_ft_Data.rHS(end) = [];
    end
end

if numel(hs_to_ft_Data.lHS) > numel(hs_to_ft_Data.lTO)
    if hs_to_ft_Data.lHS(1) < hs_to_ft_Data.lTO(1)
        hs_to_ft_Data.lHS(1) = [];
    else hs_to_ft_Data.lHS(end) = [];
    end
end


rSteps = [];
lSteps = [];



rSteps = [hs_to_ft_Data.rTO; hs_to_ft_Data.rHS]';

rSteps(:,3) = 1; %tag right steps as '1'


lSteps = [hs_to_ft_Data.lTO; hs_to_ft_Data.lHS]';

lSteps(:,3) = 2; %tag left steps as '2'

allSteps = sortrows([rSteps; lSteps]);




order = 4;
cutoff = .1;
posRootVel = butterLowZero(order,cutoff,mean(framerate),posRootVel);

thresh = .1;
moving = posRootVel>thresh;

%
% figure;clf
% plot(posRootVel)
% hold on
% plot(moving./10,'o')

for i = 1:length(allSteps)
    if moving(allSteps(i,1)) == 0 %if the subject wasn't moving, nan the step and move on
        allSteps(i,:) = [nan nan nan];
        
    else
        if allSteps(i,3) == 1 %Right foot is on the ground
            step_hs_to_ft_XYZ(i,:) = [allSteps(i,1) allSteps(i,2) allSteps(i,3) squeeze((data_fr_mar_dim(allSteps(i,1),strcmp(markerLabels,'RTOE'),:)))'];
            
        elseif allSteps(i,3) == 2 %Left foot is on the round
            step_hs_to_ft_XYZ(i,:) = [allSteps(i,1) allSteps(i,2) allSteps(i,3) squeeze((data_fr_mar_dim(allSteps(i,1),strcmp(markerLabels,'LTOE'),:)))'];
        end
    end
end

%% Gut check for accuracy of steps

if numel(hs_to_ft_Data.rTO)~=numel(hs_to_ft_Data.lTO)
    assert("Take a look at ZeniStepFinder!")
end

if length(hs_to_ft_Data.rHS)~=length(hs_to_ft_Data.lHS)
    assert("Take a look at ZeniStepFinder!")
end

%
%
% Plot for debugging subject velocity
% figure(18763);
% clf;
%
% subplot(2,1,1)
% title('Right Foot Velocity');
%
% plot(rAnkVel2D,'r-o','MarkerSize',2)
% hold on
% plot(rSteps(:,2),0,'ko','MarkerSize',8)
% plot(rSteps(:,1),0,'kx','MarkerSize',8)
%
% plot(allSteps( allSteps(:,3)==1,1),0,'mx','MarkerSize',2)
% grid on
%
% subplot(2,1,2)
% title('Left Foot Velocity');
%
% plot(lAnkVel2D, 'b-o','MarkerSize',2)
% hold on
% plot(lSteps(:,2),0,'ko','MarkerSize',2)
% plot(lSteps(:,1),0,'kx','MarkerSize',2)
% plot(allSteps(allSteps(:,3)==2,1),0,'gx','MarkerSize',2)

grid on


