% KineMat demo of spatial reconstruction
% chr, December 09, 1996

clc
clear all
close all

disp(' ')
disp('3D RECONSTRUCTION')
disp('This program is a demonstration of the 3d reconstruction programs.')
disp('In this specific example, 27 markers viewed in 115 frames will be reconstructed.')
disp('of 3 cameras.')
disp(' ')
disp('Press any key to continue.')
pause
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp('_____(1) NORMALIZING THE CAMERA COORDINATES _____')
disp(' ')
disp('In this specific example, each 5 frames were digitized before and after')
disp('the stance phase, and the stance phase will be normalized to 101 data ')
disp('points (from 0 to 100%): [cam1,t1]=normalfu(r1cam1,101,5,5)')
disp('This will take some time...')
load r1cam1.raw; load r1cam2.raw; load r1cam3.raw;
[cam1,t1]=normalfu(r1cam1,101,5,5); disp('done with 1st camera')
[cam2,t2]=normalfu(r1cam2,101,5,5); disp('done with 2nd camera')
[cam3,t3]=normalfu(r1cam3,101,5,5); disp('done with 3rd camera')

%Cameras (locams) were running at slightly different speeds and it turned out that there
%are more data points (before and after stance phase):
cam3=cam3([2:size(cam3,1)-1],:);

disp('done')
disp('Press any key to continue.')
pause
disp(' ')

disp(' ')
disp('_____(3) CALCULATION OF DLT COEFFICIENTS _____')
disp(' [dltcoeff,avgres] = dltfu(Frame,LocalCamCoord)')
load r1cam1.cal; load r1cam2.cal; load r1cam3.cal;
load calframe.txt;
a1=dltfu(calframe,r1cam1(1:6,:));
a2=dltfu(calframe,r1cam2(1:6,:));
a3=dltfu(calframe,r1cam3(1:6,:));
A=[a1,a2,a3];
disp('done')
disp('Press any key to continue.')
pause
disp(' ')

disp(' ')
disp('_____(3) 3D RECONSTRUCTION  _____')
disp(' ')
disp('3D reconstruction of the 27 markers using the DLT coefficients and the')
disp('marker coordinates for the three cameras.')
disp('This may again take some time ...')
disp(' ')
H=[]; 
  rr=[1:2:size(cam1,2)-1]';
for i=1:size(rr,1)
    l1=cam1(:,rr(i,1):[rr(i,1)+1]);
    l2=cam2(:,rr(i,1):[rr(i,1)+1]);
    l3=cam3(:,rr(i,1):[rr(i,1)+1]);
    L=[l1,l2,l3];
    H(:,(i-1)*5+1:i*5)=reconfu(A,L);
end
disp('done')
disp(' ')
disp('Press any key to continue.')
pause
disp(' ')

disp('Displaying the first 10 frames of marker 1: X, Y, Z, residuals, cameras used')
H(1:10,1:5) 

disp('End of demo1')

