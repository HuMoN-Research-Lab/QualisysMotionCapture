% KineMat demo of motion analysis (Calculation of Cardan angles).
% chr, December 09, 1996


clc
clear all
close all
disp(' ______________________________')
disp('| CALCULATION OF CARDAN ANGLES |')
disp(' ______________________________')

disp(' ');
disp('Loading of 3d coordinates of a running trial and of a trial where the')
disp('coordinates are in anatomical coordinate system (neutral/standing trial).')
load result;
disp('Press any key to continue')
% pause

disp(' ');
disp(' ');
disp('Assigning coordinates to segments (s1neutr, s2neutr, s1mov, s2mov)');
disp(' ');
femneut=neutral(1,marker(1:3));
tibneut=neutral(1,marker(4:6));
femmov=H(:,marker(1:3));
tibmov=H(:,marker(4:6));
disp('[angles,helicang]=cardan(femneut,tibneut,femmov,tibmov,zxy)')
[angles,helicang]=cardan(femneut,tibneut,femmov,tibmov,'zxy');
disp(' ');
disp(' ');

disp('Press any key to continue')
pause
disp(' ');
disp(' ');
disp('PLOTTING THE ANGLES ');
disp('(Cardan angles and helical angles (Woltring, 1994, J. Biomechanics)');
disp(' ');
subplot(3,1,1)
hold on, plot(t,angles(:,1)), plot(t,helicang(:,1),'r--')
title('Knee Angles: Cardan Angles (-) , Helical Angles (--)')
xlabel('Stance [%]'); ylabel('Abduction [deg]');
axis([-5 105 0 15]), grid on

subplot(3,1,2)
hold on, plot(t,angles(:,2)), plot(t,helicang(:,2),'r--')
xlabel('Stance [%]'); ylabel('Ext. Knee Rot. [deg]');
axis([-5 105 -15 0]), grid on

subplot(3,1,3)
grid on, hold on, plot(t,angles(:,3)), plot(t,helicang(:,3),'r--')
xlabel('Stance [%]'); ylabel('Flexion [deg]');
axis([-5 105 0 40]), grid on

disp(' ')
disp('End Demo')
