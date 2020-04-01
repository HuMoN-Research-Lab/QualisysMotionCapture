% % %% Script Version
% clear all
% close all
% subNum = 1; % input('Enter Subject number: ');

%%%%%%%function version
function [a] = loadSubDataVisInvis(subNum)

figure(1)
hold on
plot(subNum, 0, 'o')
drawnow 

%%Lazy initialization for lazy analysis of GEC pilot data
accCond1 = [nan nan];
accCond2 = [nan nan];
accCond3 = [nan nan];
accCond4 = [nan nan];
accCond5 = [nan nan];
accCond6 = [nan nan];
accCond7 = [nan nan];

velCond0 = nan;
velCond1 = nan;
velCond2 = nan;
velCond3 = nan;
velCond4 = nan;
velCond5 = nan;
velCond6 = nan;
velCond7 = nan;

allActualVis_acc_cond = nan(1,3);
allActualInvis_acc_cond = nan(1,3);

allCalcVis_visAccCond = [];
allCalcInvis_invisAccCond  = [];
allTimeVisble_visCond = [];

predTraj_cond = cell(1,8);

if ispc
    a.basePath = 'C:/Users/matthis/Dropbox/Experiments/VisInvis';
    cd(a.basePath);
elseif ismac
%     a.basePath = '/Users/jonmatthis/Dropbox/Experiments/VisInvis';
    a.basePath = '/Users/Sean/Dropbox/VisInvis';
    cd(a.basePath);
end

%%Add the folders relevant to the visInvis experiment to the path
addpath(genpath(cd))
a.path = cd;

a.exp = 5 ;% VisInvis - Fall2013
firstTrial = 1; %input('Enter first trial number: ');
lastTrial = 192; %input('Enter last trial number: ');
trialsPerCond = 12;

a.firstTrial = firstTrial;
a.lastTrial = lastTrial;
a.trialsPerCond = trialsPerCond;

% %%Function Mode
% function [a] = loadSubDataVisInvis(subNum, trialRange)
% close all

a.subNum = subNum;
a.exp = 5; % experiment #5 = VisInvis Trigger

% if trialRange(1) == 0 || (trialRange(1) == 1 && trialRange(2) == 200)
%     full = true;
%     firstTrial = 1;
%     lastTrial = 200;
% else
%     full = false;
%     firstTrial = trialRange(1);
%     lastTrial = trialRange(end);
% end

a.trialNumbers = (firstTrial:lastTrial);

a.subID = buildSubID(subNum);

a.c3dPath = strcat(a.basePath,'/Data/',a.subID,'/c3d');
a.logFilePath = strcat(a.basePath,'/Data/',a.subID,'/LogFiles');
a.subFolderPath = strcat(a.basePath,'/Data/',a.subID);


%% Load Obstacle Info
% [a.obsFields]  = loadObstacles; %maybe someday adapt this code to be "loadobstacles"


[a]  = loadBlockInfo_Targets(a);

%% Load Subject Mass
[a.mass] = loadSubjectMass(a);

tic

for trialNumber = firstTrial : lastTrial
    %
    trialName = buildTrialName(trialNumber);
    
    %% Load c3d data
    %     cd(buildDataPath(a.exp, a.subID))
    
    [a.(trialName).c3dData_fr_mrk_dim  a.(trialName).framerate  a.(trialName).c3dMarkerNames]= loadc3dData(a.c3dPath, trialNumber);
    
    
    c3dData = a.(trialName).c3dData_fr_mrk_dim;
    rToeInd = ismember(a.(trialName).c3dMarkerNames, 'RTOE');
    a.(trialName).unRotRToeX = c3dData(:, rToeInd, 1);
    a.(trialName).unRotRToeY = c3dData(:, rToeInd, 2);
    
    lToeInd = ismember(a.(trialName).c3dMarkerNames, 'LTOE');
    a.(trialName).unRotLToeX = c3dData(:, lToeInd, 1);
    a.(trialName).unRotLToeY = c3dData(:, lToeInd, 2);
    
    
    %% Rotate world so that x is now direction of motion
    %     [a.(trialName).c3dData_fr_mrk_dim a.(trialName).unRotStartEndXY] = rotateTrial(a,trialName);
    
    %
    %     if trialNumber == firstTrial
    %         %% Find Leg Length
    %         [a.legLength] =  findLegLength(a, trialName);
    %     end
    %
    %     %% Find Step Starts (Toe Off) and Step Ends (Heel Strike) for each trial
    %
    %     %Old step finder (based on O'Connor 2007)
    %     %     [a.(trialName).rightStepsTO_HS a.(trialName).leftStepsTO_HS] = findSteps(a, trialName);
    %
    %% New step finder (6/25/2012, based on Zeni 2008)
    [a.(trialName).rightStepsTO_HS a.(trialName).leftStepsTO_HS] = findStepsZeni(a, trialName);
    
    %% load AllSteps
    rtSteps = a.(trialName).rightStepsTO_HS;
    rtSteps(:,3) = 1; %Code right steps with a "1"
    
    lftSteps = a.(trialName).leftStepsTO_HS;
    lftSteps(:,3) = 2; %Code right steps with a "2"
    
    allSteps = [rtSteps; lftSteps];
    a.(trialName).allSteps = sortrows(allSteps);
    
    
    %     %     %% uncomment to display step starts end
    %     %     sort([a.(trialName).rightStepsTO_HS; a.(trialName).leftStepsTO_HS])
    %
    %     %% Find Step Lengths each trial
    %
    %         [a.(trialName).stepLenWid ] =  findStepLengths(a, trialName);
    %     %% Find average step duration
    %
    %         [a.(trialName).stepDurSS a.(trialName).stepDurDS] = calcStepDur(a,trialName);
    %
    %     %% Calc foot jerk
    %     %     [a.(trialName).footJerk]= calcFootJerk(a, trialName);
    %
    %
    %     %% Perform COM-based analyses
    %
    %
    
    %
    %     %%calculate Xcom (Hof 2005, Rosenblatt 2010) in XY plane for each trial
    %     %     [a.(trialName).xcomXY]  =  calcXcom(a, trialName);
    %
    %
    %     %     [a.(trialName).comVelXYZ a.(trialName).velAvg a.(trialName).comAccXYZ a.(trialName).comJerkXYZ] =...
    %     %         comVelAccJerk(a, trialName);
    %
    %     %     [a.(trialName).headAccXYZ a.(trialName).headJerkXYZ] = headAccJerk(a, trialName);
    %
    %     %     [a.(trialName).mosAll] = calcMoS(a,trialName,trialNumber);
    %     %
    %     %      %Plot COM & XcoM w/ footsteps
    %     %      plotXcom(a,trialName, trialNumber);
    %
    %     %%Approximate COP from kinematic data
    %     %     [a.(trialName).cop_step ] = calcCOP(a, trialName);
    %
    %     %% Calculate passive COM trajectory and compare with actual
    %
    %     %     [ a.(trialName).predTrajErrTotal a.(trialName).predTraj_tr_XYZ a.(trialName).predTrajErrXYZ] =...
    %     %         calcPassiveComTraj(a, trialName);
    %
    %     %% Calculate COM ML range (to prove to R1 that subjects walked in a straight line)
    %     %     [a.(trialName).comRangeML] = calcComRangeML(a,trialName);
    %
    %
    %     %% Calculate energy recovery
    %     %     [a.(trialName).energyRecovery] = calcEnergyRecovery(a,trialName);
    %
    %
    %     %% calc change in Leg length within each step
    %     %     [a.(trialName).deltaL a.(trialName).deltaLAvg] = calcDeltaLegLength(a, trialName);
    %
    %
    %     %% Calculate force grid for each step (based on Capture Point (Pratt), doesn't save right now, only plots)
    %     %         loadForceGrid(a, trialName)
    %     %      plotFootholdsForceGrid(a, trialNumber)
    %     %     %%Calculate Lagrangian for something or another (Doesn't work, I think)
    %     %      [a.energyLoss ] = calcEnergyLoss(a, trialName);
    %
    %     % %% Play trial / Make Movie
    %     %         playTrial(a)
    %     %         playTrial_pendlum(a, trialName)
    %
    
    %     %%
    
    %%calculate COM position for each trial
    [a.(trialName).comXYZ]  =  calcCOM_plugInGait(a, trialName);
    
    % Calculate passive COM trajectory and compare with actual
    
    [ a.(trialName).predTrajErr a.(trialName).predTraj_tr_XYZ a.(trialName).predTrajErrXYZ] =...
        calcPassiveComTraj(a, trialName);
    
    c = a.(trialName).condition+1;
    if c > 10
        c = c-10;
    end
    predTraj_cond{c} = [predTraj_cond{c} a.(trialName).predTrajErr];
    
    [a.(trialName).targetVis_timeNum] = targetVisibility(a, trialName);
    
    [ a.(trialName).target1_timeAcc a.(trialName).allAcc] = targetAccuracy(a, trialName);
    
    [a.(trialName).tLogFeet a.(trialName).logRtFootXYZ a.(trialName).logLftFootXYZ] = logFeet(a, trialName);
    
    %     [a.(trialName).time] = calcTimeStamp(a, trialName);
    
    % [a.(trialName).time_zeroLag] = calcTimeStamp_zeroLag(a, trialName);
    [a.(trialName).time_zeroLag] = calcTimeStamp_endBoxMethod(a, trialName);
    
    [a.(trialName).actualVis_acc_cond, a.(trialName).idealVis_acc_cond, a.(trialName).timeVisible_lagged] = calcActualVisibilityAccuracy(a, trialName);
    [a.(trialName).actualInvis_acc_cond, a.(trialName).idealInvis_acc_cond] = calcActualInvisibilityAccuracy(a, trialName);
    
    [a.(trialName).walkingSpeed] = calcWalkingSpeed(a, trialName);
    
    
    allCalcVis_visAccCond = [allCalcVis_visAccCond; a.(trialName).actualVis_acc_cond];
    allCalcInvis_invisAccCond = [allCalcInvis_invisAccCond; a.(trialName).actualInvis_acc_cond];
    allTimeVisble_visCond = [allTimeVisble_visCond; a.(trialName).timeVisible_lagged];
end
cd (a.basePath)
cd Data/OutputFiles

eval(sprintf('save %s_calcVisInvis.mat allCalcVis_visAccCond allCalcInvis_invisAccCond allTimeVisble_visCond predTraj_cond',a.subID));

cd (a.basePath)

% % % % % % % % % % % % % %     %% simple load trial data
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     %     allActualInvis_acc_cond = [allActualInvis_acc_cond; a.(trialName).actualInvis_acc_cond];
% % % % % % % % % % % % % %     %     allActualVis_acc_cond = [allActualVis_acc_cond; a.(trialName).actualVis_acc_cond];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     while numel(a.(trialName).allAcc(:,2)) ~= 4
% % % % % % % % % % % % % %         a.(trialName).allAcc(end+1,:) = nan;
% % % % % % % % % % % % % %         if numel(a.(trialName).allAcc(:,2)) == 3
% % % % % % % % % % % % % %             a.(trialName).allAcc(end,3) = 5;
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %         if numel(a.(trialName).allAcc(:,2)) == 4
% % % % % % % % % % % % % %             a.(trialName).allAcc(end,3) = 6;
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %     end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     if mod(a.(trialName).condition, 10) == 0
% % % % % % % % % % % % % %         velCond0(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 1
% % % % % % % % % % % % % %         velCond1(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond1(end+1, :) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 2
% % % % % % % % % % % % % %         velCond2(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond2(end+1, :) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 3
% % % % % % % % % % % % % %         velCond3(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond3(end+1,:) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 4
% % % % % % % % % % % % % %         velCond4(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond4(end+1,:) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 5
% % % % % % % % % % % % % %         velCond5(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond5(end+1,:) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 6
% % % % % % % % % % % % % %         velCond6(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond6(end+1,:) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %     elseif mod(a.(trialName).condition, 10) == 7
% % % % % % % % % % % % % %         velCond7(end+1) = a.(trialName).walkingSpeed;
% % % % % % % % % % % % % %         for i = 1:numel(a.(trialName).allAcc(:,2))
% % % % % % % % % % % % % %             accCond7(end+1,:) = a.(trialName).allAcc(i,2:3);
% % % % % % % % % % % % % %         end
% % % % % % % % % % % % % %     end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % end
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % %% %% %% Pull out Target 3 and Target 6 data
% % % % % % % % % % % % % % accCond1_t3 = accCond1( accCond1(:,2) == 3);
% % % % % % % % % % % % % % accCond2_t3 = accCond2( accCond2(:,2) == 3);
% % % % % % % % % % % % % % accCond3_t3 = accCond3( accCond3(:,2) == 3);
% % % % % % % % % % % % % % accCond4_t3 = accCond4( accCond4(:,2) == 3);
% % % % % % % % % % % % % % accCond5_t3 = accCond5( accCond5(:,2) == 3);
% % % % % % % % % % % % % % accCond6_t3 = accCond6( accCond6(:,2) == 3);
% % % % % % % % % % % % % % accCond7_t3 = accCond7( accCond7(:,2) == 3);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % accCond1_t4 = accCond1( accCond1(:,2) == 4);
% % % % % % % % % % % % % % accCond2_t4 = accCond2( accCond2(:,2) == 4);
% % % % % % % % % % % % % % accCond3_t4 = accCond3( accCond3(:,2) == 4);
% % % % % % % % % % % % % % accCond4_t4 = accCond4( accCond4(:,2) == 4);
% % % % % % % % % % % % % % accCond5_t4 = accCond5( accCond5(:,2) == 4);
% % % % % % % % % % % % % % accCond6_t4 = accCond6( accCond6(:,2) == 4);
% % % % % % % % % % % % % % accCond7_t4 = accCond7( accCond7(:,2) == 4);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % accCond1_t5 = accCond1( accCond1(:,2) == 5);
% % % % % % % % % % % % % % accCond2_t5 = accCond2( accCond2(:,2) == 5);
% % % % % % % % % % % % % % accCond3_t5 = accCond3( accCond3(:,2) == 5);
% % % % % % % % % % % % % % accCond4_t5 = accCond4( accCond4(:,2) == 5);
% % % % % % % % % % % % % % accCond5_t5 = accCond5( accCond5(:,2) == 5);
% % % % % % % % % % % % % % accCond6_t5 = accCond6( accCond6(:,2) == 5);
% % % % % % % % % % % % % % accCond7_t5 = accCond7( accCond7(:,2) == 5);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % accCond1_t6 = accCond1( accCond1(:,2) == 6);
% % % % % % % % % % % % % % accCond2_t6 = accCond2( accCond2(:,2) == 6);
% % % % % % % % % % % % % % accCond3_t6 = accCond3( accCond3(:,2) == 6);
% % % % % % % % % % % % % % accCond4_t6 = accCond4( accCond4(:,2) == 6);
% % % % % % % % % % % % % % accCond5_t6 = accCond5( accCond5(:,2) == 6);
% % % % % % % % % % % % % % accCond6_t6 = accCond6( accCond6(:,2) == 6);
% % % % % % % % % % % % % % accCond7_t6 = accCond7( accCond7(:,2) == 6);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % allAcc_t3 = [accCond1_t3 accCond2_t3 accCond3_t3 accCond4_t3 accCond5_t3 accCond6_t3 accCond7_t3 ];
% % % % % % % % % % % % % % allAcc_t4 = [accCond1_t4 accCond2_t4 accCond3_t4 accCond4_t4 accCond5_t4 accCond6_t4 accCond7_t3 ];
% % % % % % % % % % % % % % allAcc_t5 = [accCond1_t5 accCond2_t5 accCond3_t5 accCond4_t5 accCond5_t5 accCond6_t5 accCond7_t5 ];
% % % % % % % % % % % % % % allAcc_t6 = [accCond1_t6 accCond2_t6 accCond3_t6 accCond4_t6 accCond5_t6 accCond6_t6 accCond7_t6 ];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % %% Plot target3 & Target6 Accuracy
% % % % % % % % % % % % % % %
% % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % figure(subNum*10+8)
% % % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % % errorbar(mean(allAcc_t3), std(allAcc_t3), 'bo', 'LineWidth', 3);
% % % % % % % % % % % % % % % title('Target 3 - Stepping Accuracy Mean (mm) by Condition (Effective Invis/Vis)')
% % % % % % % % % % % % % % % set(gca,'XTickLabel',{'','FV','1.0/2.0','1.5/2.5','0/1.0','1.0/1.5','0.5/2.0','1.0/2.5',''});
% % % % % % % % % % % % % % % grid on;
% % % % % % % % % % % % % % %
% % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % figure(subNum*10+9)
% % % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % % errorbar(mean(allAcc_t6), std(allAcc_t6), 'bo', 'LineWidth', 3);
% % % % % % % % % % % % % % % title('Target 6 - Stepping Accuracy Mean (mm) by Condition (Effective Invis/Vis)')
% % % % % % % % % % % % % % % set(gca,'XTickLabel',{'','FV','1.0/2.0','1.5/2.5','0/1.0','1.0/1.5','0.5/2.0','1.0/2.5',''});
% % % % % % % % % % % % % % % grid on;
% % % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond1 = nanmean(accCond1);
% % % % % % % % % % % % % % stdAccCond1 = nanstd(accCond1);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond2 = nanmean(accCond2);
% % % % % % % % % % % % % % stdAccCond2 = nanstd(accCond2);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond3 = nanmean(accCond3);
% % % % % % % % % % % % % % stdAccCond3 = nanstd(accCond3);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond4 = nanmean(accCond4);
% % % % % % % % % % % % % % stdAccCond4 = nanstd(accCond4);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond5 = nanmean(accCond5);
% % % % % % % % % % % % % % stdAccCond5 = nanstd(accCond5);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond6 = nanmean(accCond6);
% % % % % % % % % % % % % % stdAccCond6 = nanstd(accCond6);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanAccCond7 = nanmean(accCond7);
% % % % % % % % % % % % % % stdAccCond7 = nanstd(accCond7);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % allAccCond = [accCond1; accCond2; accCond3; accCond4; accCond5; accCond6; accCond7]';
% % % % % % % % % % % % % % meanAccAllCond = [meanAccCond1; meanAccCond2; meanAccCond3; meanAccCond4; meanAccCond5; meanAccCond6; meanAccCond7];
% % % % % % % % % % % % % % stdAccAllCond = [stdAccCond1; stdAccCond2; stdAccCond3; stdAccCond4; stdAccCond5; stdAccCond6; stdAccCond7];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % %remove dummy NaN on first row
% % % % % % % % % % % % % % allAccCond(1,:) = [];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond0 = nanmean(velCond0);
% % % % % % % % % % % % % % stdVelCond0 = nanstd(velCond0);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond1 = nanmean(velCond1);
% % % % % % % % % % % % % % stdVelCond1 = nanstd(velCond1);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond2 = nanmean(velCond2);
% % % % % % % % % % % % % % stdVelCond2 = nanstd(velCond2);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond3 = nanmean(velCond3);
% % % % % % % % % % % % % % stdVelCond3 = nanstd(velCond3);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond4 = nanmean(velCond4);
% % % % % % % % % % % % % % stdVelCond4 = nanstd(velCond4);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond5 = nanmean(velCond5);
% % % % % % % % % % % % % % stdVelCond5 = nanstd(velCond5);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond6 = nanmean(velCond6);
% % % % % % % % % % % % % % stdVelCond6 = nanstd(velCond6);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % meanVelCond7 = nanmean(velCond7);
% % % % % % % % % % % % % % stdVelCond7 = nanstd(velCond7);
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % allVelCond = [velCond1; velCond2; velCond3; velCond4; velCond5; velCond6; velCond7]';
% % % % % % % % % % % % % % meanVelAllCond = [meanVelCond0; meanVelCond1; meanVelCond2; meanVelCond3; meanVelCond4; meanVelCond5; meanVelCond6; meanVelCond7];
% % % % % % % % % % % % % % stdVelAllCond = [stdVelCond0; stdVelCond1; stdVelCond2; stdVelCond3; stdVelCond4; stdVelCond5; stdVelCond6; stdVelCond7];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % %remove dummy NaN on first row
% % % % % % % % % % % % % % allVelCond(1,:) = [];
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % figure(subNum*10+1)
% % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % errorbar(meanAccAllCond, stdAccAllCond, 'bo', 'LineWidth', 3);
% % % % % % % % % % % % % % title('Stepping Accuracy Mean (mm) by Condition (Effective Invis/Vis)')
% % % % % % % % % % % % % % set(gca,'XTickLabel',{'','FV','1.0/2.0','1.5/2.5','0/1.0','1.0/1.5','0.5/2.0','1.0/2.5',''});
% % % % % % % % % % % % % % grid on;
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % figure(subNum*10+2)
% % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % bar(stdAccAllCond)
% % % % % % % % % % % % % % title('Stepping Accuracy Variability (Std Dev, mm) by Condition (Effective Invis/Vis)')
% % % % % % % % % % % % % % set(gca,'XTickLabel',{'FV','1.0/2.0','1.5/2.5','0/1.0','1.0/1.5','0.5/2.0','1.0/2.5'});
% % % % % % % % % % % % % % grid on;
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % figure(subNum*10+3)
% % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % errorbar(meanVelAllCond, stdVelAllCond, 'ro', 'LineWidth', 3);
% % % % % % % % % % % % % % title('Mean Walking Speed (m/s) by Condition (Effective Invis/Vis)')
% % % % % % % % % % % % % % set(gca,'XTickLabel',{'','FV','1.0/2.0','1.5/2.5','0/1.0','1.0/1.5','0.5/2.0','1.0/2.5',''});
% % % % % % % % % % % % % % grid on;
% % % % % % % % % % % % % %
% % % % % % % % % % % % % % cd (a.basePath)
% % % % % % % % % % % % % % cd Data/OutputFiles
% % % % % % % % % % % % % %
% % % % % % % % % % % eval(sprintf('save %s.mat allAcc_t3 allAcc_t4 allAcc_t5 allAcc_t6 allActualInvis_acc_cond allActualVis_acc_cond allAccCond meanAccAllCond stdAccAllCond allVelCond meanVelAllCond stdVelAllCond',a.subID));

cd (a.basePath)
toc
%
% if full
%     [a.meanLen a.stdLen a.meanWid a.stdWid a.meanDurDS a.stdDurDS a.meanDurSS a.stdDurSS] = plotStepParameters(a);
%
%     [ a.allStepAcc a.meanAcc a.stdAcc a.numMissed] = plotTargetAccuracy(a);
%
%     [a.accBin a.accBinMean] = binTargetAccuracy(a);
%
%     [a.meanVisPerCond] = calcMeanVisPerCond(a);
%
%     cd(buildBasicPath);
%     cd InvisibilityTrigger
%
%     if ismac
%         cd Data/OutputFiles
%     elseif ispc
%         cd Data\OutputFiles
%     end
%
%
%     everyStep_vis_acc_trig = [];
%
%     for i = firstTrial : lastTrial
%         everyStep_vis_acc_trig = [everyStep_vis_acc_trig; a.(buildTrialName(i)).actualVis_acc_trig];
%     end
% %
% %     for i = 1:numel(everyStep_vis_acc_trig(:,1))
% %         if everyStep_vis_acc_trig(i,1) > 3
% %             everyStep_vis_acc_trig(i,1) = everyStep_vis_acc_trig(i,1)-9;
% %         end
% %     end
%     a.everyStep_vis_acc_trig = everyStep_vis_acc_trig;
%
%     allStepAcc = a.allStepAcc;
%     meanAcc = a.meanAcc;
%     stdAcc = a.stdAcc;
%     accBin = a.accBin;
%     accBinMean = a.accBinMean;
%     meanVisPerCond = a.meanVisPerCond;
%     numMissed = a.numMissed;
%     meanLen = a.meanLen;
%     stdLen = a.stdLen;
%     meanWid = a.meanWid;
%     stdWid = a.stdWid;
%     meanDurSS =  a.meanDurDS;
%     stdDurSS =  a.stdDurDS;
%     meanDurDS = a.meanDurSS;
%     stdDurDS = a.stdDurSS;
%
%     eval(sprintf('save %s.mat everyStep_vis_acc_trig meanDurSS stdDurSS meanDurDS stdDurDS meanLen stdLen meanWid stdWid allStepAcc meanAcc stdAcc accBin accBinMean meanVisPerCond numMissed',a.subID));
% end


figure(subNum*100)
subplot(211)
bar(cellfun(@mean, predTraj_cond),'b')
subplot(212)
bar(cellfun(@std, predTraj_cond),'r')


