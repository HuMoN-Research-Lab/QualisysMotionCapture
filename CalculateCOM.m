function [thighCOMx,thighCOMy,thighCOMz] = CalculateCOM(marker_mar_dim_frame, markerLabels)
%CalculateCOM function acquires the .mat file and outputs the COM for the
%whole body 

% marker_mar_dim_frame = data.Trajectories.Labeled.Data;
% markerLabels = data.Trajectories.Labeled.Labels;

%% Anthropometry Table (segment mass/total mass)
%Converts lbs mass into kg mass
mass_lbs = 160;
lb_to_kg = 0.453592*mass_lbs;
totalMass = lb_to_kg;

%upper extremity segments by total mass of body
handTotalSegMass = 0.0060*totalMass;
forearmTotalSegMass = 0.0160*totalMass;
upperArmTotalSegMass = 0.0280*totalMass;
upperExtremityTotalSegMass = 0.0500*totalMass;

%COM by segment length for hand,forearm, upper arm (proximal & distal)
proximalHandCOM = 0.506*totalMass;
distalHandCOM = 0.494*totalMass;

proximalForearmCOM = 0.430*totalMass;
distalForearmCOM = 0.570*totalMass;

proximalUpperArmCOM = 0.436*totalMass;
distalUpperArmCOM = 0.564*totalMass;

proximalUpperExtremityCOM = 0.470*totalMass;
distalUpperExtremityCOM = 0.530*totalMass;

%lower extremity segment mass by total mass of body
footTotalSegMass = 0.0145;
legTotalSegMass = 0.0465;
thighTotalSegMass = 0.1000;
lowerExtremityTotalSegMass = 0.1610;

%COM by segment length for foot,leg,leg,thigh,lower extremity (proximal & distal)
proximalFootCOM = 0.500*totalMass;
distalFootCOM = 0.500*totalMass;

proximalLegCOM = 0.433*totalMass;
distalLegCOM = 0.567*totalMass;

proximalThighCOM = 0.433*totalMass;
distalThighCOM = 0.567*totalMass;

proximalLowerExtremityCOM = 0.447*totalMass;
distalLowerExtremityCOM = 0.553*totalMass;

%upper torso segment mass by total mass of body
headTotalSegMass = 0.0810*totalMass;
shoulderTotalSegMass = 0.0158*totalMass;
thoraxTotalSegMass = 0.2160*totalMass;
abdomenTotalSegMass = 0.1390*totalMass;
pelvisTotalSegMass = 0.1420*totalMass;
trunkTotalSegMass = 0.4970*totalMass;

%COM by segment length for head,shoulder,thorax,abdomen,pelvis,trunk (proximal & distal)
proximalHeadCOM = 1.000*totalMass;
distalHeadCOM = 0*totalMass;

proximalShoulderCOM = 0.712*totalMass;
distalShoulderCOM = 0.288*totalMass;

proximalThoraxCOM = 0.820*totalMass;
distalThoraxCOM = 0.180*totalMass;

proximalAbdomenCOM = 0.440*totalMass;
distalAbdomenCOM = 0.560*totalMass;

proximalPelvisCOM = 0.105*totalMass;
distalPelvisCOM = 0.895*totalMass;

proximalTrunkCOM = 0.495*totalMass;
distalTrunkCOM = 0.505*totalMass;

%% Anthropometry Dempsters Table (segment mass/total mass)
%Dempsters Body Segment Parameters

dempster = [handTotalSegMass proximalHandCOM distalHandCOM;
    forearmTotalSegMass proximalForearmCOM distalForearmCOM;
    upperArmTotalSegMass proximalUpperArmCOM distalUpperArmCOM;
    upperExtremityTotalSegMass proximalUpperExtremityCOM distalUpperExtremityCOM;
    footTotalSegMass proximalFootCOM distalFootCOM;
    legTotalSegMass proximalLegCOM distalLegCOM; 
    thighTotalSegMass proximalThighCOM distalThighCOM;
    lowerExtremityTotalSegMass proximalLowerExtremityCOM distalLowerExtremityCOM;
    headTotalSegMass proximalHeadCOM distalHeadCOM;
    shoulderTotalSegMass proximalShoulderCOM distalShoulderCOM;
    thoraxTotalSegMass proximalThoraxCOM distalThoraxCOM;
    abdomenTotalSegMass proximalAbdomenCOM distalAbdomenCOM;
    pelvisTotalSegMass proximalPelvisCOM distalPelvisCOM;
    trunkTotalSegMass proximalTrunkCOM distalTrunkCOM];

%% Center of Mass for head markers
%headID markerLabels: 1 - 4

%initial conditions for head data acquisition
headI = 1;
headJ = 4;
headIDs = headI:headJ;

if headJ > 0
    headMean =  squeeze(mean(marker_mar_dim_frame(headIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    headCOMx = headMean(:,1);
    headCOMy = headMean(:,2);
    headCOMz = headMean(:,3);
end

%% Center of Mass for shoulder markers
%initial conditions for the left shoulder data acquisition
leftShoulderI = 5;
leftShoulderJ = 6;
leftShoulderIDs = leftShoulderI:leftShoulderJ;

if leftShoulderJ > 0
    leftShoulderMean =  squeeze(mean(marker_mar_dim_frame(leftShoulderIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftShoulderCOMx = leftShoulderMean(:,1);
    leftShoulderCOMy = leftShoulderMean(:,2);
    leftShoulderCOMz = leftShoulderMean(:,3);
end

%initial conditions for the right shoulder data acquisition
rightShoulderI = 12;
rightShoulderJ = 13;
rightShoulderIDs = rightShoulderI:rightShoulderJ;

if rightShoulderJ > 0
    rightShoulderMean =  squeeze(mean(marker_mar_dim_frame(rightShoulderIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightShoulderCOMx = rightShoulderMean(:,1);
    rightShoulderCOMy = rightShoulderMean(:,2);
    rightShoulderCOMz = rightShoulderMean(:,3);
end

%% Center of Mass for arm markers

%initial conditions for left arm data acquisition
leftArmI = 7;
leftArmJ = 0;
leftArmIDs = leftArmI:leftArmJ;

if leftArmJ > 0
    leftArmMean =  squeeze(mean(marker_mar_dim_frame(leftArmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftArmCOMx = leftArmMean(:,1);
    leftArmCOMy = leftArmMean(:,2);
    leftArmCOMz = leftArmMean(:,3);
end

%initial conditions for right arm data acquisition
rightArmI = 14;
rightArmJ = 0;
rightArmIDs = rightArmI:rightArmJ;

if rightArmJ > 0
    rightArmMean =  squeeze(mean(marker_mar_dim_frame(rightArmIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightArmCOMx = rightArmMean(:,1);
    rightArmCOMy = rightArmMean(:,2);
    rightArmCOMz = rightArmMean(:,3);
end

%% Center of Mass for elbow markers

%initial conditions for left elbow data acquisition
leftElbowI = 8;
leftElbowJ = 0;
leftElbowIDs = leftElbowI:leftElbowJ;

if leftElbowJ > 0
    leftElbowMean =  squeeze(mean(marker_mar_dim_frame(leftElbowIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftElbowCOMx = leftElbowMean(:,1);
    leftElbowCOMy = leftElbowMean(:,2);
    leftElbowCOMz = leftElbowMean(:,3);
end

%initial conditions for right elbow data acquisition
rightElbowI = 15;
rightElbowJ = 0;
rightElbowIDs = rightElbowI:rightElbowJ;

if rightElbowJ > 0
    rightElbowMean =  squeeze(mean(marker_mar_dim_frame(rightElbowIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightElbowCOMx = rightElbowMean(:,1);
    rightElbowCOMy = rightElbowMean(:,2);
    rightElbowCOMz = rightElbowMean(:,3);
end

%% Center of Mass for wrist markers

%initial conditions for left wrist data acquisition
leftWristI = 8;
leftWristJ = 0;
leftWristIDs = leftWristI:leftWristJ;

if leftWristJ > 0
    leftWristMean =  squeeze(mean(marker_mar_dim_frame(leftWristIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    leftWristCOMx = leftWristMean(:,1);
    leftWristCOMy = leftWristMean(:,2);
    leftWristCOMz = leftWristMean(:,3);
end

%initial conditions for right wrist data acquisition
rightWristI = 15;
rightWristJ = 0;
rightWristIDs = rightWristI:rightWristJ;

if rightWristJ > 0
    rightWristMean =  squeeze(mean(marker_mar_dim_frame(rightWristIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    rightWristCOMx = rightWristMean(:,1);
    rightWristCOMy = rightWristMean(:,2);
    rightWristCOMz = rightWristMean(:,3);
end

%% Center of Mass for hip markers
%initial conditions for hip data acquisition
hipI = 23;
hipJ = 26;
hipsIDs = hipI:hipJ;

if hipJ > 0
    hipsMean =  squeeze(mean(marker_mar_dim_frame(hipsIDs, 1:3, :),1))';
    %COM of Hip in x,y,z
    hipsCOMx = hipsMean(:,1);
    hipsCOMy = hipsMean(:,2);
    hipsCOMz = hipsMean(:,3);
end

%% Center of Mass for thigh markers
%Not accurate because only has outside marker

%initial conditions for left thigh data acquisition
leftThighI = 27;
leftThighJ = 0;
leftThighIDs = [leftThighI leftThighJ];

if leftThighJ > 0
    leftThighMean =  squeeze(mean(marker_mar_dim_frame(leftThighIDs, 1:3, :),1))';
    %thighCOM in the x, y, z
    leftThighCOMx = leftThighMean(:,1);
    leftThighCOMy = leftThighMean(:,2);
    leftThighCOMz = leftThighMean(:,3);
end

%initial conditions for right thigh data acquisition
rightThighI = 0;
rightThighJ = 35;
rightThighIDs = [rightThighI rightThighJ];

if rightThighJ > 0
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
%current marker names LShin
leftLegI = 28;
leftLegJ = 0;
leftLegIDs = [leftLegI leftLegJ];

if leftLegJ > 0
    leftLegMean =  squeeze(mean(marker_mar_dim_frame(leftLegIDs, 1:3, :)),1)';
    %legCOM in the x, y, z
    leftLegCOMx = leftLegMean(:,1);
    leftLegCOMy = leftLegMean(:,2);
    leftLegCOMz = leftLegMean(:,3);
end

%initial conditions for right leg data acquisition
%current marker names RShin
rightLegI = 36;
rightLegJ = 0;
rightLegIDs = [rightLegI rightLegJ];

if rightLegJ > 0
    rightLegMean =  squeeze(mean(squeeze(marker_mar_dim_frame(rightLegIDs, 1:3, :)),1))';
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
leftFootI = 30;
leftFootJ = 34;
leftFootIDs = leftFootI:leftFootJ;

if leftFootJ > 0
    leftFootMean =  squeeze(mean(squeeze(marker_mar_dim_frame(leftFootIDs, 1:3, :)),1))';
    %COM of Hip in x,y,z
    leftFootCOMx = leftFootMean(:,1);
    leftFootCOMy = leftFootMean(:,2);
    leftFootCOMz = leftFootMean(:,3);
end

%initial conditions for right foot data acquisition
rightFootI = 38;
rightFootJ = 42;
rightFootIDs = rightFootI:rightFootJ;

if rightFootJ > 0
    rightFootMean =  squeeze(mean(squeeze(marker_mar_dim_frame(rightFootIDs, 1:3, :)),1))';
    %COM of Hip in x,y,z
    rightFootCOMx = rightFootMean(:,1);
    rightFootCOMy = rightFootMean(:,2);
    rightFootCOMz = rightFootMean(:,3);
end

%% Debug plots

debug = true; 

if debug
    
    for fr = 1
    %clears the current figures to avoid plotting data over each other
        clf
    
    %determines how many rows and columns a figure will have
        numRows = 2;
        numCols = 3;
    
        subplot(numRows, numCols, 1:3)
    
    %column 1(x), 2(y), 3(z)
        plot3(marker_mar_dim_frame(:, 1, fr),...
            marker_mar_dim_frame(:, 2, fr),...
            marker_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
    
    %facilitates plotting hipIDs on top of points
        hold on
    
    %plots column 1(x), 2(y), 3(z) for the hipIDs
        plot3(marker_mar_dim_frame(hipIDs, 1, fr),...
            marker_mar_dim_frame(hipIDs, 2, fr),...
            marker_mar_dim_frame(hipIDs, 3, fr),'ro','MarkerFaceColor','r','MarkerSize',3)
    
        plot3(marker_mar_dim_frame(thighIDs, 1, fr),...
            marker_mar_dim_frame(thighIDs, 2, fr),...
            marker_mar_dim_frame(thighIDs, 3, fr),'mo','MarkerFaceColor','m','MarkerSize',3)
    
    %plots approximate center of mass for the hips in 3D
        plot3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3),'kp','MarkerFaceColor','m', 'MarkerSize',12)
        
        velScale = 100;
    %quiver - for components x,y,z of the hip, the velocity vector arrows
    %in 3d are are plotted
        h_hipsVel = quiver3(hipsMean(fr,1), hipsMean(fr,2), hipsMean(fr,3), hipsVel(fr,1)*velScale, hipsVel(fr,2)*velScale, hipsVel(fr,3)*velScale);
        h_hipsVel.LineWidth = 3;
        h_hipsVel.Color = 'r';
        h_hipsVel.MaxHeadSize = 2;
    
        hold on
        axis equal
    
        grid on
    
        %optimal x y z graph limits 
        xlim([0 2e3])
        ylim([-5e3 10e3])
        zlim([0 3e3])
    
        %unsure of what this section means
        drawnow
    end
end
