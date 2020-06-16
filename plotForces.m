function plotForces(Force)%,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the force output for the force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Establish initial conditions
figure(325);

%Configuration of force data
forceConfig1 = Force.force_plate1(3,:);
forceConfig2 = Force.force_plate2(3,:);
forceConfig3 = Force.force_plate3(3,:);
% forceConfig4 = Force.force_plate4(3,:);
forceConfig5 = Force.force_plate5(3,:);

fp1 = forceConfig1;
fp2 = forceConfig2;
fp3 = forceConfig3;
% fp4 = forceConfig4;
fp5 = forceConfig5;

%% Plot force plate data
%First force plate
subplot(4,1,1)
plot(fp3);
title('Force Plate #1')
xlabel('Number of Frames')
ylabel('Force (N)')
hold on

%Second force plate
subplot(4,1,2)
plot(fp1);
title('Force Plate #2')
xlabel('Number of Frames')
ylabel('Force (N)')
hold on

%Third force plate
subplot(4,1,3)
plot(fp2);
title('Force Plate #3')
xlabel('Number of Frames')
ylabel('Force (N)')
hold on

%Fourth force plate
subplot(4,1,4)
plot(fp5);
title('Force Plate #4')
xlabel('Number of Frames')
ylabel('Force (N)')
hold on

% %Fifth force plate
% subplot(5,1,5)
% plot(fp5);
% title('Force Plate #5')
% hold on

end