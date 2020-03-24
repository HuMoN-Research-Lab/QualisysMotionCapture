function [outputArg1,outputArg2] = plotMoCapTracer(segCenter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotMoCapTracer outputs plot of velocity and acceleration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Is it possible to put a func in plotting for loop?
% Unsure what the output should be in this case
% Should holdon be used after each new set of plotting instructions?
% How do you plot multiple figures
% Research what az and el mean
%% Hip Position
%Determines how many rows and columns a figure will have
%     numRows = 2;
%     numCols = 3;
%     
%     subplot(numRows, numCols, 1:3)


subplot(numRows, numCols, 4)
plot(segCenter.hipCenter_mar_dim_frame)
hold on
plot(fr, segCenter.hipCenter_mar_dim_frame(fr,1), 'ko')
plot(fr, segCenter.hipCenter_mar_dim_frame(fr,2), 'ro')
plot(fr, segCenter.hipCenter_mar_dim_frame(fr,3), 'bo')

%Equivalent to previous code except written concisely
%    plot([fr fr fr], segCenter.hipCenter_mar_dim_frame(fr,:), 'ko') 
%Plots hips velocity
%     subplot(numRows, numCols, 5)
%     plot(hipsVel)
%     hold on
%     
%     %Traces each x,y,z components with corresponding labels
%     plot(fr,hipsVel(fr,1), 'ko')
%     plot(fr,hipsVel(fr,2), 'ro')
%     plot(fr,hipsVel(fr,3), 'bo')
%     
%     %Plots hips acceleration
%     subplot(numRows, numCols, 6)
%     plot(hipsAcc)
%     hold on
%     
%     %Traces each x,y,z components with corresponding labels
%     plot(fr,hipsAcc(fr,1), 'ko')
%     plot(fr,hipsAcc(fr,2), 'ro')
%     plot(fr,hipsAcc(fr,3), 'bo')

end

