% function [ c3dData ] = loadC3dBtk( fid ) %uncomment to run this as a function


%%%
%%% Load a c3d file and put all the useful bits into a struct called "c3dData"
%%%
clear all
close all

addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

recordVideo = true;



for iter = 1:3
    close all
    
    cd('Documents/GitHub/MationCapture_MATLABCode/COMPhaseSpacePlanning');
    %     cd('C:\Users\jonma\Dropbox\ResearchProjects\COMPhaseSpacePlanning\sub01\c3d')
    
    switch iter
        
        case 1
            condTitle = 'Free Walking';
            fid = 'trial011.mat';
            
        case 2
            condTitle = 'Full Vision';
            fid = 'trial042.mat';
            
        case 3
            condTitle = 'Limited Vision';
            fid = 'trial015.mat';
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
    % e.g. data_fr_mar_dim (10:15, 2, 1:2) returns X and Y data for marker#2 on Frames 10:15
    data_fr_mar_dim = [];
    
    for m = 1:numel(marNames)
        if sum(sum(mar.(marNames{m}))) == 0
            data_fr_mar_dim(:,m,:) = nan(size(mar.(marNames{m}))); %if the marker is blank, replaces zeros with NaN's
        else
            
            mar.(marNames{m})(mar.(marNames{m})==0) = nan;
            data_fr_mar_dim(:,m,:) = butterLowZero(order, cutoff, framerate, mar.(marNames{m})); %Butterworth filter each marker's data and load it into the trial
        end
    end
    
    master.data_fr_mar_dim = data_fr_mar_dim;
    data.framerate = framerate;
    data.markerNames = marNames;
    data.analogs = btkGetAnalogs(acq);
    data.angles = btkGetAngles(acq);
    
    
    % %%example of how to sloppily pull out the data from a particular marker
    % rFootID = find(strcmp('RightFoot', c3dData.markerNames ));
    % rFootXYZ = squeeze(c3dData.c3dData_fr_mar_dim(:,rFootID,:)); % pull out RightFoot marker, note the use of "squeeze" to remove the singleton dimenstion
    
    
    [allSteps, step_fr_ft_XYZ]= ZeniStepFinder_ccpVid(data_fr_mar_dim, marNames);
    
    %% Plot
    
    
    
    data_fr_mar_dim(:,strcmp(marNames,'RBAK'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'RBAK'),:))));
    
    data_fr_mar_dim(:,strcmp(marNames,'RTHI'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'RTHI'),:))));
    data_fr_mar_dim(:,strcmp(marNames,'LTHI'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'LTHI'),:))));
    
    data_fr_mar_dim(:,strcmp(marNames,'RFIN'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'RFIN'),:))));
    data_fr_mar_dim(:,strcmp(marNames,'LFIN'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'LFIN'),:))));
    data_fr_mar_dim(:,strcmp(marNames,'STER'),:) = nan(size(squeeze(data_fr_mar_dim(:,strcmp(marNames,'STER'),:))));
    
    %     col = [0   0   0  ;
    %         0   0   0  ;
    %         0   0   0  ;
    %         0   0   0  ;
    %         57  82  255;
    %         235 36  39 ;
    %         103 201 217;
    %         183 79  156;]./255;
    
    col = lines;
    global di fr az el play
    
    if recordVideo
        cd('Documents/GitHub/MationCapture_MATLABCode/COMPhaseSpacePlanning/videos');
        switch getenv('computername')
            case     'DESKTOP-06PJ7UD' %Matthis Office PC
                cd('C:\Users\jonma\Dropbox\ResearchProjects\COMPhaseSpacePlanning\vids')
        end
        
        
        videoFileName = condTitle;
        %         if exist(strcat(videoFileName,'.avi'), 'file') == 2
        %             result = input('video file exists - over write? y/n: ','s');
        %             if result == 'y'
        %                 beep
        %             else
        %                 return
        %             end
        %         end
        %
        writerObj = VideoWriter(strcat(videoFileName,'_slow'),'MPEG-4');
        %         writerObj = VideoWriter(videoFileName);
        writerObj.FrameRate = 30;
        writerObj.Quality = 100;
        %
        open(writerObj);
        %         figure('units','normalized','outerposition',[0.05 0.05 .9 .9]);
        %
    else
        %         figure(1)
        %         set(gca, 'Position',[0.13 0.11 0.775 0.815])
        clf
    end
    
    figure(1)
    f = gcf;
    f.Position = [1 5 1920 1100];
    
    
    
    
    
    
    
    
    %     step_fr_ft_XYZ(step_fr_ft_XYZ(:,1) < startFrame, :) = [];
    
    stepFr = step_fr_ft_XYZ(:,1);
    stepDur = diff(stepFr);
    
    m1 = find(strcmp(marNames,'LFHD'));
    m2 = find(strcmp(marNames,'RFHD'));
    m3 = find(strcmp(marNames,'LBHD'));
    m4 = find(strcmp(marNames,'RBHD'));
    
    m5 = find(strcmp(marNames,'C7'));
    m21 =  find(strcmp(marNames,'SACR'));
    m10 =  find(strcmp(marNames,'LSHO'));
    m9 =  find(strcmp(marNames,'RBAK'));
    m11 =  find(strcmp(marNames,'LELB'));
    m12 =  find(strcmp(marNames,'LWRA'));
    m15 = find(strcmp(marNames,'RSHO'));
    m16 =  find(strcmp(marNames,'RELB'));
    m17 =  find(strcmp(marNames,'RWRA'));
    m23 =  find(strcmp(marNames,'LKNE'));
    m29 =  find(strcmp(marNames,'RKNE'));
    m26 =  find(strcmp(marNames,'LHEE'));
    m27 =  find(strcmp(marNames,'LTOE'));
    m32 =  find(strcmp(marNames,'RHEE'));
    m33 =  find(strcmp(marNames,'RTOE'));
    
    m19 = find(strcmp(marNames,'LASI'));
    m20 = find(strcmp(marNames,'RASI'));
    
    head = [ m1];
    neck = [ m1 m5];
    spine = [m5  m21];
    
    pelvis = [m21 ];
    
    lsho = [m5 m10  ];
    larm = [m9 m10 m11 m12 ];
    
    rsho = [m5 m15 ];
    rarm = [ m15 m16  m17 ];
    
    
    lupleg =  [m21 m23 ];
    llowleg = [m23 m26 m27 ];
    
    rupleg = [ m21 m29 ];
    rlowleg = [m29 m32 m33 ];
    
    %     incMar =  [ 1 5 9 10 11 12 15 16 17 21 23  25 26 27 29 31 32 33];
    incMar =  [ m1 m5 m9 m10 m11 m12 m15 m16 m17 m21 m23  m26 m27 m29 m32 m33 ];
    
    data_fr_mar_dim(:,m1,:) = mean(data_fr_mar_dim(:,[m1 m2 m3 m4],:),2); %new head
    
    data_fr_mar_dim(:,m5,:) = mean(data_fr_mar_dim(:,[m15 m10],:),2); %new chest
    
    data_fr_mar_dim(:,m21,:) = mean(data_fr_mar_dim(:,[m19 m20 m21 m21 m21],:),2); %new pelvis
    
    
    comXYZ = squeeze(data_fr_mar_dim(:,strcmp(marNames,'SACR'),:));
    
    lowVelFr = (diff(comXYZ(:,1))*framerate/1000) < 0.1;
    
    comXYZ(lowVelFr,:) = nan;
    
    cX = comXYZ(:,1)/1000;
    cY = comXYZ(:,2)/1000;
    cZ = comXYZ(:,3)/1000;
    
    cXv = [0; diff(cX)*framerate];
    cYv = [0; diff(cY)*framerate];
    cZv = [0; diff(cZ)*framerate];
    %
    %     cXv(end) = [];
    %     cYv(end) = [];
    %     cZv(end) = [];
    %
    %     [pks, apexLocs] = findpeaks(cZ);
    
    for ss = 1:length(allSteps)
        if isnan(cXv(allSteps(ss,1))) || isnan(cXv(allSteps(ss,2)))
            allSteps(ss,1) = nan;
        end
    end
    
    step_fr_ft_XYZ(isnan(allSteps(:,1)),:) =[];
    allSteps(isnan(allSteps(:,1)),:) = [];
    
    apexLocs = round(mean(allSteps(:,[2 1]),2));
    
    
    startFrame = max([1 allSteps(1,1)-5]);
    endFrame = min([length(comXYZ) allSteps(end,2)+5]);
    
    
    
    
    play = true;
    fr = startFrame;
    di = 1;
    az = 28;
    el = 19;
    
    %     if iter ==1
    %         apexLocs(1) = [];
    %     end
    %
    %     if iter ==3
    %         apexLocs(end+1) = length(cX)
    %     end
    
    while play
        clf
        fr = fr + di;
        if fr < 1
            fr = 1;
        elseif fr >endFrame
            play = false;
        end
        
        subplot(3,3,1:6)
        
        
        %%% plotsteps
        %         plot3(step_fr_ft_XYZ(:,3), step_fr_ft_XYZ(:,4), step_fr_ft_XYZ(:,5)*0,'r.','MarkerSize',100,'MarkerFaceColor','r')
        
        
        
        
        
        
        if iter == 3
            rw = 1000;
            ang=0:0.01:2*pi;
            xwp=rw*cos(ang);
            ywp=rw*sin(ang);
            comX = comXYZ(fr,1);
            comY = comXYZ(fr,2);
            z = 40;%step_fr_ft_XYZ(st,5);
            hold on
            
            p =  patch(comX+xwp,comY+ywp, ones(length(xwp),1)*z, [1 1 1]);
            p.FaceColor = 'none';
            p.LineWidth = 2;
        end
        
        
        if iter ~= 1
            r = 100;
            for st = 1: length(step_fr_ft_XYZ(:,1))
                if st > 1
                    
                    ang=0:0.01:2*pi;
                    xp=r*cos(ang);
                    yp=r*sin(ang);
                    x = step_fr_ft_XYZ(st,4)-50;
                    y = step_fr_ft_XYZ(st,5)-50;
                    z = 40;%step_fr_ft_XYZ(st,5);
                    hold on
                    
                    if iter == 3 && sqrt( (comX - x)^2 + (comY-y)^2) > rw;
                        continue
                    else
                        p =  patch(x+xp,y+yp, ones(length(xp),1)*z, [1 1 1]);
                        
                        p.LineStyle = '-';
                        p.LineWidth = 2;
                        p.EdgeColor= col(st-1,:);
                        p.FaceColor= col(st-1,:);
                    end
                    
                end
            end
            for st = 1: length(step_fr_ft_XYZ(:,1))%draw dotted line circles on each step
                if st > 1
                    ang=0:0.01:2*pi;
                    xp=r*cos(ang);
                    yp=r*sin(ang);
                    x = step_fr_ft_XYZ(st,4)-50;
                    y = step_fr_ft_XYZ(st,5)-50;
                    z = 40;%step_fr_ft_XYZ(st,5);
                    hold on
                    
                    
                    p =  patch(x+xp,y+yp, ones(length(xp),1)*z, [1 1 1]);
                    
                    p.LineStyle = '-';
                    p.LineWidth = 1.5;
                    p.EdgeColor= 'k';
                    p.FaceColor= 'none';
                end
            end
        end
        %Plot skeleton
        
        
        
        
        
        c = 0;
        
        for cc = 1:length(allSteps)
            if fr > allSteps(cc,1) && fr<allSteps(cc,2)
                c = col(cc,:);
            end
        end
        
        if c == 0
            c = [.3 .3 .3];
        end
        
        
        linWidth = 4;
        plot3(data_fr_mar_dim(fr,head,1),data_fr_mar_dim(fr,head,2),data_fr_mar_dim(fr,head,3),'Color',c,'LineWidth',linWidth)
        hold on
        plot3(data_fr_mar_dim(fr,neck,1),data_fr_mar_dim(fr,neck,2),data_fr_mar_dim(fr,neck,3),'Color',c,'LineWidth',linWidth)
        
        plot3(data_fr_mar_dim(fr,spine,1),data_fr_mar_dim(fr,spine,2),data_fr_mar_dim(fr,spine,3),'Color',c,'LineWidth',linWidth)
        
        plot3(data_fr_mar_dim(fr,pelvis,1),data_fr_mar_dim(fr,pelvis,2),data_fr_mar_dim(fr,pelvis,3),'Color',c,'LineWidth',linWidth)
        
        plot3(data_fr_mar_dim(fr,rsho,1),data_fr_mar_dim(fr,rsho,2),data_fr_mar_dim(fr,rsho,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,rarm,1),data_fr_mar_dim(fr,rarm,2),data_fr_mar_dim(fr,rarm,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,rupleg,1),data_fr_mar_dim(fr,rupleg,2),data_fr_mar_dim(fr,rupleg,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,rlowleg,1),data_fr_mar_dim(fr,rlowleg,2),data_fr_mar_dim(fr,rlowleg,3),'Color',c,'LineWidth',linWidth)
        
        
        plot3(data_fr_mar_dim(fr,lsho,1),data_fr_mar_dim(fr,lsho,2),data_fr_mar_dim(fr,lsho,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,larm,1),data_fr_mar_dim(fr,larm,2),data_fr_mar_dim(fr,larm,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,lupleg,1),data_fr_mar_dim(fr,lupleg,2),data_fr_mar_dim(fr,lupleg,3),'Color',c,'LineWidth',linWidth)
        plot3(data_fr_mar_dim(fr,llowleg,1),data_fr_mar_dim(fr,llowleg,2),data_fr_mar_dim(fr,llowleg,3),'Color',c,'LineWidth',linWidth)
        
        
        
        plot3(data_fr_mar_dim(fr,incMar,1),data_fr_mar_dim(fr,incMar,2),data_fr_mar_dim(fr,incMar,3),'ko','MarkerFaceColor','k','MarkerSize',6);
        
        
        
        g_x = meshgrid(-5000:500:5000);
        g_y = meshgrid(-5000:500:5000)';
        
        grHeight= 0; %the Y values denote vertical position
        g_z = zeros(length(g_x),length(g_x))+grHeight ;
        surface(g_x, g_y, g_z,'FaceColor','none','EdgeColor',[.3 .3 .3])
        
        
        
        
        xLim =  [-500 5000];
        yLim =  [-1500 1500];
        zLim =  [-100 2000];
        
        axis([xLim yLim zLim])
        
        set(gca,'xtick',[])
        set(gca,'xticklabel',[])
        set(gca,'ytick',[])
        set(gca,'yticklabel',[])
        set(gca,'ztick',[])
        set(gca,'zticklabel',[])
        
        daspect([1,1,1])
        %     axis equal
        t1 =  title(condTitle);
        t1.FontSize = 42;
        t1.FontWeight = 'bold';
        
        if round((fr - startFrame)/120*1000) < 100
            xl =  xlabel(strcat('Elapsed time (ms): 00', num2str(round((fr - startFrame)/120*1000))));
        elseif round((fr - startFrame)/120*1000) >= 100 && round((fr - startFrame)/120*1000) < 1000
            xl =  xlabel(strcat('Elapsed time (ms): 0', num2str(round((fr - startFrame)/120*1000))));
            %             xl =  xlabel(strcat('Elapsed time (ms): ', num2str(fr)));
            
        else
            xl =  xlabel(strcat('Elapsed time (ms): ', num2str(round((fr - startFrame)/120*1000))));
            %                         xl =  xlabel(strcat('Elapsed time (ms): ', num2str(fr)));
        end
        
        xl.FontSize = 16;
        xl.HorizontalAlignment = 'center';
        
        view(az,el)
        
        
        
        
        
        
        
        
        
        
        
        
        %%
        rgb = eye(3);
        
        subplot(3,3,7)
        plot(cX, cXv,'LineWidth',1)
        hold on
        
        
        for ss = 1:min([length(allSteps) length(apexLocs)])
            %
            %         if ss > length(apexLocs)
            %             continue
            %         end
            %
            plot(cX(min([ fr allSteps(ss,1)]):min([fr allSteps(ss,2)])), cXv(min([ fr allSteps(ss,1)]):min([ fr allSteps(ss,2)])),'Color',col(ss,:),'LineWidth',3)
            
            if allSteps(ss,2) < fr;  plot(cX(allSteps(ss,2)), cXv(allSteps(ss,2)),'ko', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            if allSteps(ss,1) < fr; plot(cX(allSteps(ss,1)), cXv(allSteps(ss,1)),'kp', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            
            %             plot(cX(apexLocs(ss)), cXv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))
            
        end
        plot(cX(fr), cXv(fr),'ko','MarkerFaceColor','w')
        %         axis square
        title('Sagittal Phase Portrait')
        xlabel('meters')
        ylabel('m/s')
        grid on
        
        axis([ -.5 5 0.4 1.8])
        
        subplot(3,3,8)
        plot(cY, cYv)
        hold on
        for ss = 1:min([length(allSteps) length(apexLocs)])
            
            %         if ss > length(apexLocs)
            %             continue
            %         end
            %
            plot(cY(min([ fr allSteps(ss,1)]):min([fr allSteps(ss,2)])), cYv(min([ fr allSteps(ss,1)]):min([ fr allSteps(ss,2)])),'Color',col(ss,:),'LineWidth',3)
            
            if allSteps(ss,2) < fr;  plot(cY(allSteps(ss,2)), cYv(allSteps(ss,2)),'ko', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            if allSteps(ss,1) < fr; plot(cY(allSteps(ss,1)), cYv(allSteps(ss,1)),'kp', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            
            %             plot(cY(apexLocs(ss)), cYv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))
            
        end
        
        plot(cY(fr), cYv(fr),'ko','MarkerFaceColor','w')
        
        
        %         axis square
        title('Lateral Phase Portrait')
        xlabel('meters')
        ylabel('m/s')
        grid on
        
        axis([-.05 .24 -.6 .4 ])
        
        
        subplot(3,3,9)
        plot( cZv, cZ)
        hold on
        for ss = 1:min([length(allSteps) length(apexLocs)])
            
            %         if ss > length(apexLocs)
            %             continue
            %         end
            
            plot( cZv(min([ fr allSteps(ss,1)]):min([ fr allSteps(ss,2)])), cZ(min([ fr allSteps(ss,1)]):min([fr allSteps(ss,2)])),'Color',col(ss,:),'LineWidth',3)
            
            if allSteps(ss,2) < fr;  plot(cZv(allSteps(ss,2)), cZ(allSteps(ss,2)), 'ko', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            if allSteps(ss,1) < fr; plot(cZv(allSteps(ss,1)), cZ(allSteps(ss,1)), 'kp', 'MarkerFaceColor',rgb(allSteps(ss,3),:),'MarkerSize',6); end
            
            %             plot(cZ(apexLocs(ss)), cZv(apexLocs(ss)), '^','Color', 'k', 'MarkerFaceColor', col(ss,:))
            
        end
        plot( cZv(fr), cZ(fr),'ko','MarkerFaceColor','w')
        %         axis square
        title('Vertical Phase Portrait')
        xlabel('m/s')
        ylabel('meters')
        
        grid on
        
        axis([ -.45 .6 .85 1])
        %%
        
        
        drawnow
        hold off
        
        if recordVideo
            frame = getframe(gcf);
            writeVideo(writerObj,frame);
        end
        
        
        if fr == length(squeeze(data_fr_mar_dim(:,1,1)));
            break
        end
        
    end
    
    if recordVideo
        close(writerObj)
    end
    
    
end




