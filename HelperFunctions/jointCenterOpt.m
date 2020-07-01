function jointCenterOpt(segCenter_cal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Optimize Joint center location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identification of markers in use
%LMarkers
LHip = segCenter_cal.LHip_loc_fil;
LThigh = segCenter_cal.LThigh_loc_fil;
LKnee = segCenter_cal.LKnee_loc_fil;

%RMarkers
RHip = segCenter_cal.RHip_loc_fil;
RThigh = segCenter_cal.RThigh_loc_fil;
RKnee = segCenter_cal.RKnee_loc_fil;

%% Reformat LMarker data into x,y,z components
%x,y,z components for markers in thigh segment
LMarkersX_raw = [LHip(1,:);LThigh(1,:);RHip(1,:)]; %;LKnee(1,:)
LMarkersY_raw = [LHip(2,:);LThigh(2,:);RHip(2,:)]; %;LKnee(2,:)
LMarkersZ_raw = [LHip(3,:);LThigh(3,:);RHip(3,:)]; %;LKnee(3,:)

%Average position of markers around the joint
LMarkersX_mean = mean(LMarkersX_raw);
LMarkersY_mean = mean(LMarkersY_raw);
LMarkersZ_mean = mean(LMarkersZ_raw);

%% Create variables for function
%Joint center mean markers into vector notation
LHipJointMarkers_mean = [LMarkersX_mean; LMarkersY_mean; LMarkersZ_mean];

%First marker to evaluate joint center
firstMarker = LHip;

%Starting point of JointCenter guess
initialGuess = [0;0;0];

%% Error function initiation
%with JointCenterGuess being the average loc using select markers
LHipJointCenterError = @(JointCenterGuess) JointCenterErrorFun(firstMarker, JointCenterGuess, LHipJointMarkers_mean);

%% Settings for optimizer
opts = optimset('Display', 'iter','MaxFunEvals',50000, 'PlotFcns',{@optimplotx, @optimplotfval,@optimplotfirstorderopt});
A =     [];
b =     [];
Aeq =   [];
beq =   [];
lb =    0;
ub =    1;

%% Initiates optimizer and calibrates results
%initialGuess initiates optimizer
%jointCenter difference = Optimized joint center loc in x,y,z
[jointCenterDifference, jointCenterError] = fmincon(LHipJointCenterError, initialGuess,A,b,Aeq,beq,lb,ub,[],opts);

%Calibrates results considering initialGuess
LHipJointCenter = [(jointCenterDifference(1)+ LMarkersX_mean);...
    (jointCenterDifference(2)+ LMarkersY_mean);...
    (jointCenterDifference(3)+ LMarkersZ_mean)]; 

%% Visual representation of accuracy
figure(7447)
stepA = VideoWriter('Joint Center Optimization Results.mp4');
open(stepA);

for ii = 1:20:length(LHip)
    clf
    %    plot3([LHip(1,ii);LThigh(1,ii);LKnee(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
    %         [LHip(2,ii);LThigh(2,ii);LKnee(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
    %         [LHip(3,ii);LThigh(3,ii);LKnee(3,ii)],'b.','MarkerSize',15)                          %;LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)]
    
    plot3(LHip(1,ii),LHip(2,ii),LHip(3,ii),'b.','MarkerSize',15)
    hold on
    plot3(LThigh(1,ii),LThigh(2,ii),LThigh(3,ii),'g.','MarkerSize',15)
    plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',15);
    plot3(LHipJointCenter(1,ii),LHipJointCenter(2,ii),...
        LHipJointCenter(3,ii),'r.','MarkerSize',15)
    
    axis equal
    grid on
    
    xlim([0 2e3])
    ylim([-5e3 10e3])
    zlim([0 3e3])
    az = -30.8155;
    el = 6.8338;
    %     %Find az and el values of the current plot
    %     [az,el] = view
    view(az,el)
    legend('LHip','LThigh','LKnee','LHip Joint Center')
    drawnow
    
    frame = getframe(gcf);
    writeVideo(stepA,frame);
    
end
close(stepA)


end