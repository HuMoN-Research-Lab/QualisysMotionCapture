
% function [rightTO_HS, leftTO_HS] = ZeniStepFinder(shadow_fr_mar_dim,shadowMarkerNames, avg_fps)

function [allSteps, step_hs_to_ft_XYZ] = ZeniStepFinder_ccpVid(c3d_fr_mar_dim, marNames)

shadow_ds_fr_mar_dim = c3d_fr_mar_dim;
shadowMarkerNames = marNames;
avg_fps = 120;

% The basic idea is to first situate the data by subtracting the x & y
% coordinates of the Root marker from each marker position at each frame,
% essentially setting the origin to the subject's root.
%
% The velocity of each foot in the X direction is then calculated. Zero
% crossings (within a band from Zero) are either toe-offs or heel strikes.
% Positive to Negative denotes heel strike, Negative to Positive denotes
% Toe off.


%working for threshold and working for new data and then check signs in directional walking

%define frames of interes as only frames when the person is moving --> for
%loop
%x=body velocity in 2d not zeroed because need movement and not relative
%movement
%frInt = x>___
%X(frInt) = new X
%interesct function
% framesOfInterest = 11000:13500;
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
rootVel = diff(root(:,1))*mean(avg_fps)/1000;
posRootVel = abs(rootVel);

%% Right and Left Ankle markers
% add Xvel to Zvel to get 2d vel
rAnkVelX = diff(rAnkX);
rAnkVelZ = diff(rAnkZ);
rAnkVel2D = plus(rAnkVelX, rAnkVelZ);

lAnkVelX = diff(lAnkX);
lAnkVelZ = diff(lAnkZ);
lAnkVel2D = plus(lAnkVelX, lAnkVelZ);



%Find frames where sub is walking


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
startFrame = 1;
endFrame = length(root);

rTO = [];
rHS = [];

lTO = [];
lHS = [];


for i = startFrame+1:endFrame-1
    %need to take absolute value to see if it is moving
    
    %Right foot toe offs
    if (rAnkVel2D(i-1) <= 0 && rAnkVel2D(i) > 0)
        rTO(end+1) = i;
        
    end
    
    %Left foot Toe offs
    if (lAnkVel2D(i-1) <= 0 && lAnkVel2D(i) > 0)
        lTO(end+1) = i;
        
    end
    
    
    
    
    if (rAnkVel2D(i-1) >= 0 && rAnkVel2D(i) < 0)
        rHS(end+1) = i;
    end
    
    %Left foot heel strikes
    if (lAnkVel2D(i-1) >= 0 && lAnkVel2D(i) < 0)
        lHS(end+1) = i;
        
    end
    
    
    
end


% % %remove TO's and HS's that occur when subject is not moving
% %
% % rootVel = tsmovavg( diff(root(:,1)).','s',30 ) *120/1000;
% %
% % ind = find(rootVel > 0.2); %ind = frames in which rootVel is greater than 0.2 m/s
%
% %remove TO's and HS's that are not listed in "ind"
% rTO = intersect(rTO,ind);
% rHS = intersect(rHS,ind);
%
% lTO = intersect(lTO,ind);
% lHS = intersect(lHS,ind);



% % Uncomment for debugging Plots
% subplot(2,1,1)
% plot(rAnkVel2D,'r-o','MarkerSize',2)
% hold on
% plot(rTO,0,'mo')
% plot(rHS,0,'mx')
% grid on
% 
% subplot(212)
% plot(lAnkVel2D, 'b-o','MarkerSize',2)
% hold on
% plot(lTO,0,'mo')
% plot(lHS,0,'mx')
% grid on

%% remove orphan Toe offs and heel stikes
% body threshold for movement instead of removing orphans

if rHS(1)< rTO(1)
    rHS(1) = [];
end

if rTO(end) > rHS(end)
    rTO(end) = [];
end

if lHS(1)< lTO(1)
    lHS(1) = [];
end

if lTO(end) > lHS(end)
    lTO(end) = [];
end




if numel(rTO) > numel(rHS)
    if rHS(1) - rTO(1) > rTO(1) - rTO(2) %if the time between rTO(1) and rHS(1) is larger than rTO(1) and rTO(2), remove rTO(1)
        rTO(1) = [];
    else rTO(end) = []; %otherwise, the rTO(end) is the problem
    end
end

if numel(lTO) > numel(lHS)
    if lHS(1) - lTO(1) > lTO(1) - lTO(2) %if the time between lTO(1) and lHS(1) is larger than lTO(1) and lTO(2), remove lTO(1)
        lTO(1) = [];
    else lTO(end) = [];
    end
end


if numel(rHS) > numel(rTO)
    if rHS(1) < rTO(1)
        rHS(1) = [];
    else    rHS(end) = [];
    end
end

if numel(lHS) > numel(lTO)
    if lHS(1) < lTO(1)
        lHS(1) = [];
    else lHS(end) = [];
    end
end










rSteps = [];
lSteps = [];



rSteps = [rTO; rHS]';

rSteps(:,3) = 1; %tag right steps as '1'


lSteps = [lTO; lHS]';

lSteps(:,3) = 2; %tag left steps as '2'

allSteps = sortrows([rSteps; lSteps]);




order = 4;
cutoff = .1;
posRootVel = butterLowZero(order,cutoff,mean(avg_fps),posRootVel);

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
            step_hs_to_ft_XYZ(i,:) = [allSteps(i,1) allSteps(i,2) allSteps(i,3) squeeze((c3d_fr_mar_dim(allSteps(i,1),strcmp(marNames,'RTOE'),:)))'];
            
        elseif allSteps(i,3) == 2 %Left foot is on the round
            step_hs_to_ft_XYZ(i,:) = [allSteps(i,1) allSteps(i,2) allSteps(i,3) squeeze((c3d_fr_mar_dim(allSteps(i,1),strcmp(marNames,'LTOE'),:)))'];
        end
    end
end



% 
% 
% % Uncomment for debugging Plots
% figure;clf;
% subplot(2,1,1)
% plot(rAnkVel2D,'r-o','MarkerSize',2)
% hold on
% plot(rSteps(:,2),0,'ko','MarkerSize',8)
% plot(rSteps(:,1),0,'kx','MarkerSize',8)
% 
% plot(allSteps( allSteps(:,3)==1,1),0,'mx','MarkerSize',2)
% 
% grid on
% 
% subplot(212)
% plot(lAnkVel2D, 'b-o','MarkerSize',2)
% hold on
% plot(lSteps(:,2),0,'ko','MarkerSize',2)
% plot(lSteps(:,1),0,'kx','MarkerSize',2)
% plot(allSteps( allSteps(:,3)==2,1),0,'gx','MarkerSize',2)
% 
% grid on


