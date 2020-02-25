function [leftThighCOMx,leftThighCOMy,leftThighCOMz,leftThighMean,leftLegMean] = CalculateCOM(marker_mar_dim_frame, markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CalculateCOM function outputs the COM for the whole body
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Center of Mass for head markers
%headID markerLabels: 1 - 4

%initial conditions for head data acquisition
% %More WTBD to acquire data from each label
% headL = strcmp(markerLabels, 'HeadL');
% headTop = strcmp(markerLabels, 'HeadTop');
% headR = strcmp(markerLabels, 'HeadR');
% headFront = strcmp(markerLabels, 'HeadFront');
% headIDs = headL:headFront;
% 
% headMean =  squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :),1))';
% %COM of Hip in x,y,z
% headCOMx = headMean(:,1);
% headCOMy = headMean(:,2);
% headCOMz = headMean(:,3);

headA = 1;
headB = 4;
headIDs = headA:headB;

if headB > 0
    headMean =  squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    headCOMx = headMean(:,1);
    headCOMy = headMean(:,2);
    headCOMz = headMean(:,3);
end

% headCOMx = headCOMx;
% headCOMy = headCOMy;
% headCOMz = headCOMz;

%% Center of Mass for shoulder markers
%initial conditions for the left shoulder data acquisition
%Uncertain why figure495 isn't showing up when plotting graph
% f = figure(495)
leftShoulderA = 5;
leftShoulderB = 6;
leftShoulderIDs = leftShoulderA:leftShoulderB;

if leftShoulderB > 0
    leftShoulderMean =  squeeze(mean(marker_mar_dim_frame(leftShoulderIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftShoulderCOMx = leftShoulderMean(:,1);
    leftShoulderCOMy = leftShoulderMean(:,2);
    leftShoulderCOMz = leftShoulderMean(:,3);
end

%initial conditions for the right shoulder data acquisition
rightShoulderA = 12;
rightShoulderB = 13;
rightShoulderIDs = rightShoulderA:rightShoulderB;

if rightShoulderB > 0
    rightShoulderMean =  squeeze(mean(marker_mar_dim_frame(rightShoulderIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightShoulderCOMx = rightShoulderMean(:,1);
    rightShoulderCOMy = rightShoulderMean(:,2);
    rightShoulderCOMz = rightShoulderMean(:,3);
end


%% Center of Mass for arm markers

%initial conditions for left arm data acquisition
leftArmA = 7;
leftArmB = 8;
leftArmIDs = leftArmA:leftArmB;

if leftArmB > 0
    leftArmMean =  squeeze(mean(marker_mar_dim_frame(leftArmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftArmCOMx = leftArmMean(:,1);
    leftArmCOMy = leftArmMean(:,2);
    leftArmCOMz = leftArmMean(:,3);
end

%initial conditions for right arm data acquisition
rightArmA = 14;
rightArmB = 15;
rightArmIDs = rightArmA:rightArmB;

if rightArmB > 0
    rightArmMean =  squeeze(mean(marker_mar_dim_frame(rightArmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightArmCOMx = rightArmMean(:,1);
    rightArmCOMy = rightArmMean(:,2);
    rightArmCOMz = rightArmMean(:,3);
end

%% Center of Mass for forearm markers

%initial conditions for left elbow data acquisition
leftForearmA = 8;
leftForearmB = 10;
leftForearmIDs = leftForearmA:leftForearmB;

if leftForearmB > 0
    leftForearmMean =  squeeze(mean(marker_mar_dim_frame(leftForearmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftForearmCOMx = leftForearmMean(:,1);
    leftForearmCOMy = leftForearmMean(:,2);
    leftForearmCOMz = leftForearmMean(:,3);
end

%initial conditions for right elbow data acquisition
rightForearmA = 15;
rightForearmB = 17;
rightForearmIDs = rightForearmA:rightForearmB;

if rightForearmB > 0
    rightForearmMean =  squeeze(mean(marker_mar_dim_frame(rightForearmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightForearmCOMx = rightForearmMean(:,1);
    rightForearmCOMy = rightForearmMean(:,2);
    rightForearmCOMz = rightForearmMean(:,3);
end


%% Center of Mass for hand markers

%initial conditions for left wrist data acquisition
leftHandA = 9;
leftHandB = 11;
leftHandIDs = leftHandA:leftHandB;

if leftHandB > 0
    leftHandMean =  squeeze(mean(marker_mar_dim_frame(leftHandIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftHandCOMx = leftHandMean(:,1);
    leftHandCOMy = leftHandMean(:,2);
    leftHandCOMz = leftHandMean(:,3);
end

%initial conditions for right wrist data acquisition
rightHandA = 16;
rightHandB = 18;
rightHandIDs = rightHandA:rightHandB;

if rightHandB > 0
    rightHandMean =  squeeze(mean(marker_mar_dim_frame(rightHandIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightHandCOMx = rightHandMean(:,1);
    rightHandCOMy = rightHandMean(:,2);
    rightHandCOMz = rightHandMean(:,3);
end


%% Center of Mass for hip markers
%initial conditions for hip data acquisition
hipA = 23;
hipB = 26;
hipsIDs = hipA:hipB;

if hipB > 0
    hipsMean =  squeeze(mean(marker_mar_dim_frame(hipsIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    hipsCOMx = hipsMean(:,1);
    hipsCOMy = hipsMean(:,2);
    hipsCOMz = hipsMean(:,3);
end

%% Center of Mass for thigh markers
%Not accurate because only has outside marker

%initial conditions for left thigh data acquisition
leftThighA = 27;
leftThighB = 28;
leftThighIDs = [leftThighA leftThighB];

if leftThighB > 0
    leftThighMean =  squeeze(mean(marker_mar_dim_frame(leftThighIDs, 1:3, :),1))';
    %thighCOM in the x, y, z
    leftThighCOMx = leftThighMean(:,1);
    leftThighCOMy = leftThighMean(:,2);
    leftThighCOMz = leftThighMean(:,3);
end

%initial conditions for right thigh data acquisition
rightThighA = 35;
rightThighB = 36;
rightThighIDs = [rightThighA rightThighB];

if rightThighB > 0
    rightThighMean =  squeeze(mean(marker_mar_dim_frame(rightThighIDs, 1:3, :),1))';
    %thighCOM in the x, y, z
    rightThighCOMx = rightThighMean(:,1);
    rightThighCOMy = rightThighMean(:,2);
    rightThighCOMz = rightThighMean(:,3);
end

% %calculates velocity of thigh
% thighVel =  [0 0 0; diff(thighMean)]; 
% thighAcc = [0 0 0; diff(thighVel)];

%% Center of Mass for leg markers
%Needs inside and outside marker for code to work

%initial conditions for left leg data acquisition
leftLegA = 28;
leftLegB = 30;
leftLegIDs = [leftLegA leftLegB];

if leftLegB > 0
    leftLegMean =  squeeze(mean(marker_mar_dim_frame(leftLegIDs, 1:3, :),1))';
    %legCOM in the x, y, z
    leftLegCOMx = leftLegMean(:,1);
    leftLegCOMy = leftLegMean(:,2);
    leftLegCOMz = leftLegMean(:,3);
end

%initial conditions for right leg data acquisition
%current marker names RShin
rightLegA = 36;
rightLegB = 38;
rightLegIDs = [rightLegA rightLegB];

if rightLegB > 0
    rightLegMean =  squeeze(mean(marker_mar_dim_frame(rightLegIDs, 1:3, :),1))';
    %legCOM in the x, y, z
    rightLegCOMx = rightLegMean(:,1);
    rightLegCOMy = rightLegMean(:,2);
    rightLegCOMz = rightLegMean(:,3);
end


%Why code can not reference legMean at this junction
%calculates velocity of thigh
% legVel =  [0 0 0; diff(legMean)]; 
% legAcc = [0 0 0; diff(legVel)];

%% Center of Mass for foot markers

%initial conditions for left foot data acquisition
leftFootA = 30;
leftFootB = 34;
leftFootIDs = leftFootA:leftFootB;

if leftFootB > 0
    leftFootMean =  squeeze(mean(marker_mar_dim_frame(leftFootIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftFootCOMx = leftFootMean(:,1);
    leftFootCOMy = leftFootMean(:,2);
    leftFootCOMz = leftFootMean(:,3);
end

%initial conditions for right foot data acquisition
rightFootA = 38;
rightFootB = 42;
rightFootIDs = rightFootA:rightFootB;

if rightFootB > 0
    rightFootMean =  squeeze(mean(marker_mar_dim_frame(rightFootIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightFootCOMx = rightFootMean(:,1);
    rightFootCOMy = rightFootMean(:,2);
    rightFootCOMz = rightFootMean(:,3);
end

% %plotter debugger
% debug = true; 
% 
% if debug
%     
%     for fr = 1
%     %clears the current figures to avoid plotting data over each other
%         clf
%     
%     %determines how many rows and columns a figure will have
%         numRows = 2;
%         numCols = 3;
%     
%         subplot(numRows, numCols, 1:3)
%     
%     %column 1(x), 2(y), 3(z)
%         plot3(marker_mar_dim_frame(:, 1, fr),...
%             marker_mar_dim_frame(:, 2, fr),...
%             marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
%     
%     %facilitates plotting hipIDs on top of points
%         hold on
%     
%     %plots column 1(x), 2(y), 3(z) for the hipIDs
%         plot3(marker_mar_dim_frame(rightFootIDs, 1, fr),...
%             marker_mar_dim_frame(rightFootIDs, 2, fr),...
%             marker_mar_dim_frame(rightFootIDs, 3, fr),'ro','MarkerFaceColor','r','MarkerSize',3)
%     
%     %plots approximate center of mass for the hips in 3D
%         plot3(rightFootMean(fr,1), rightFootMean(fr,2), rightFootMean(fr,3),'kp','MarkerFaceColor','m', 'MarkerSize',12)
%         hold on
%         axis equal
%     
%         grid on
%     
%         %optimal x y z graph limits
%         xlim([0 2e3])
%         ylim([-5e3 10e3])
%         zlim([0 3e3])
%     
%         %unsure of what this section means
%         drawnow
%     end
% end


% %% Debug plots
% 
% debug = true; 
% 
% if debug
%     
%     for fr = 1
%     %clears the current figures to avoid plotting data over each other
%         clf
%     
%     %determines how many rows and columns a figure will have
%         numRows = 2;
%         numCols = 3;
%     
%         subplot(numRows, numCols, 1:3)
%     
%     %column 1(x), 2(y), 3(z)
%         plot3(marker_mar_dim_frame(:, 1, fr),...
%             marker_mar_dim_frame(:, 2, fr),...
%             marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
%     
%     %facilitates plotting hipIDs on top of points
%         hold on
%     
%     %plots column 1(x), 2(y), 3(z) for the hipIDs
%         plot3(marker_mar_dim_frame(hipIDs, 1, fr),...
%             marker_mar_dim_frame(hipIDs, 2, fr),...
%             marker_mar_dim_frame(hipIDs, 3, fr),'ro','MarkerFaceColor','r','MarkerSize',3)
%     
%         plot3(marker_mar_dim_frame(thighIDs, 1, fr),...
%             marker_mar_dim_frame(thighIDs, 2, fr),...
%             marker_mar_dim_frame(thighIDs, 3, fr),'mo','MarkerFaceColor','m','MarkerSize',3)
%     
%     %plots approximate center of mass for the hips in 3D
%         plot3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3),'kp','MarkerFaceColor','m', 'MarkerSize',12)
%         
%         velScale = 100;
%     %quiver - for components x,y,z of the hip, the velocity vector arrows
%     %in 3d are are plotted
%         h_hipsVel = quiver3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3), hipsVel(fr,1)*velScale, hipsVel(fr,2)*velScale, hipsVel(fr,3)*velScale);
%         h_hipsVel.LineWidth = 3;
%         h_hipsVel.Color = 'r';
%         h_hipsVel.MaxHeadSize = 2;
%     
%         hold on
%         axis equal
%     
%         grid on
%     
%         %optimal x y z graph limits 
%         xlim([0 2e3])
%         ylim([-5e3 10e3])
%         zlim([0 3e3])
%     
%         %unsure of what this section means
%         drawnow
%     end
% end

