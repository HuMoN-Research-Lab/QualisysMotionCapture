% function [ c3dData ] = loadC3dBtk( fid ) %uncomment to run this as a function


%%%
%%% Load a c3d file and put all the useful bits into a struct called "c3dData"
%%%
clear all
close all


addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)


for iter = 1:6
    
    switch iter
        case 1
            fid = 'trial011.c3d';
        case 2
            fid = 'trial042.c3d';
        case 3
            fid = 'trial015.c3d';
        case 4
            fid = 'trial001.c3d';
        case 5
            fid = 'trial020.c3d';
        case 6
            fid = 'trial002.c3d';
    end
    
    % load trial data using btk's weirdo methods
    acq = btkReadAcquisition(fid);
    mar = btkGetMarkers(acq);
    
    marNames = fieldnames(mar);
    %setup for Butterworth Filter (4th order low pass with 7HZ cutoff)
    order = 4;
    cutoff = 7;
    framerate = btkGetPointFrequency(acq);
    
    %initialize the variable for the marker, so it can be built within a for-loop. It is a 3D matrix with the dimensions are (Frame#,MarkerNumer,Dimension(XYZ))
    % e.g. c3d_fr_mar_dim (10:15, 2, 1:2) returns X and Y data for marker#2 on Frames 10:15
    c3d_fr_mar_dim = [];
    
    for m = 1:numel(marNames)
        if sum(sum(mar.(marNames{m}))) == 0
            c3d_fr_mar_dim(:,m,:) = nan(size(mar.(marNames{m}))); %if the marker is blank, replaces zeros with NaN's
        else
            
            mar.(marNames{m})(mar.(marNames{m})==0) = nan;
            c3d_fr_mar_dim(:,m,:) = butterLowZero(order, cutoff, framerate, mar.(marNames{m})); %Butterworth filter each marker's data and load it into the trial
        end
    end
    
    c3dData.c3dData_fr_mar_dim = c3d_fr_mar_dim;
    c3dData.framerate = framerate;
    c3dData.markerNames = marNames;
    c3dData.analogs = btkGetAnalogs(acq);
    c3dData.angles = btkGetAngles(acq);
    
    
    % %%example of how to sloppily pull out the data from a particular marker
    % rFootID = find(strcmp('RightFoot', c3dData.markerNames ));
    % rFootXYZ = squeeze(c3dData.c3dData_fr_mar_dim(:,rFootID,:)); % pull out RightFoot marker, note the use of "squeeze" to remove the singleton dimenstion
    
    
    [allSteps, step_hs_to_ft_XYZ]= ZeniStepFinder_ccpVid(c3d_fr_mar_dim, marNames);
        
    allSteps(isnan(allSteps(:,1)),:)= [];
    
    
    comXYZ = squeeze(c3d_fr_mar_dim(:,strcmp(marNames,'SACR'),:));
    
    lowVelFr = (diff(comXYZ(:,1))*framerate/1000) < 0.5;
    
    comXYZ(lowVelFr,:) = nan;
    
    cX = comXYZ(:,1)/1000;
    cY = comXYZ(:,2)/1000;
    cZ = comXYZ(:,3)/1000;
    
    cXv = diff(cX)*framerate;
    cYv = diff(cY)*framerate;
    cZv = diff(cZ)*framerate;
    
    cX(end) = [];
    cY(end) = [];
    cZ(end) = [];
    
    [pks, apexLocs] = findpeaks(cZ);
    
        for ss = 1:length(allSteps)
            if isnan(cXv(allSteps(ss,1))) || isnan(cXv(allSteps(ss,2)))
                allSteps(ss,1) = nan;
            end
        end
    
    allSteps(isnan(allSteps(:,1)),:) = [];
    
    if iter ==1
        apexLocs(1) = [];
    end
    
    if iter ==3
        apexLocs(end+1) = length(cX)
    end
    

    figure(iter)
    col = lines;
    rgb = eye(3);
    
    subplot(3,1,1)
    plot(cX, cXv,'LineWidth',1)
    hold on
    

    for ss = 1:min([length(allSteps) length(apexLocs)])
%         
%         if ss > length(apexLocs)
%             continue
%         end
%         
        plot(cX(allSteps(ss,1):allSteps(ss,2)), cXv(allSteps(ss,1):allSteps(ss,2)),'Color',col(ss,:),'LineWidth',3)
        
        plot(cX(allSteps(ss,1)), cXv(allSteps(ss,1)),'o','Color',rgb(allSteps(ss,3),:), 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
        plot(cX(allSteps(ss,2)), cXv(allSteps(ss,2)),'p','Color',rgb(allSteps(ss,3),:), 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
        
        plot(cX(apexLocs(ss)), cXv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))

    end
    %     axis square
    title('Sagittal Phase Portrait')
    xlabel('meters')
    ylabel('m/s')
    grid on
    
    axis([ -.5 5 0.4 1.8])
    
    subplot(3,1,2)
    plot(cY, cYv)
    hold on
    for ss = 1:min([length(allSteps) length(apexLocs)])
        
%         if ss > length(apexLocs)
%             continue
%         end
%         
        plot(cY(allSteps(ss,1):allSteps(ss,2)), cYv(allSteps(ss,1):allSteps(ss,2)),'Color',col(ss,:),'LineWidth',2)
        
        plot(cY(allSteps(ss,1)), cYv(allSteps(ss,1)),'o','Color',rgb(allSteps(ss,3),:),  'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
        plot(cY(allSteps(ss,2)), cYv(allSteps(ss,2)),'p','Color',rgb(allSteps(ss,3),:), 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
        
        plot(cY(apexLocs(ss)), cYv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))

    end
    %     axis square
    title('Lateral Phase Portrait')
    xlabel('meters')
    ylabel('m/s')
    grid on
    
    axis([-.05 .24 -.6 .4 ])
    
    
    subplot(3,1,3)
    plot(cZ, cZv)
    hold on
    for ss = 1:min([length(allSteps) length(apexLocs)])
        
%         if ss > length(apexLocs)
%             continue
%         end
        
        plot(cZ(allSteps(ss,1):allSteps(ss,2)), cZv(allSteps(ss,1):allSteps(ss,2)),'Color',col(ss,:),'LineWidth',2)
        
        plot(cZ(allSteps(ss,1)), cZv(allSteps(ss,1)),'o','Color',rgb(allSteps(ss,3),:),  'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
        plot(cZ(allSteps(ss,2)), cZv(allSteps(ss,2)),'p','Color',rgb(allSteps(ss,3),:), 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6)
    
        plot(cZ(apexLocs(ss)), cZv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))

    end
    %     axis square
    title('Vertical Phase Portrait')
    xlabel('meters')
    ylabel('m/s')
    grid on
    
    axis([ .86 .98 -.45 .6])
    
    f = gcf;
    
    f.Position = [  1325          49         527        1068]
end