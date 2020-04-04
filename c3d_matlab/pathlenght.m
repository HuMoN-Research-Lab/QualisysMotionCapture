%% pathlength.m
% Copyright (C) 2009 by Mag. Jürgen Pfusterschmied
% Estimate path length of Centre of Presure
% Note that a exact standing duration is needed
% COP Calculation from source: http://www.kwon3d.com/theory/grf/cop.html

clear all;

%% Options 
t = 200;      % standing duration
startT = 1;  % start 
    
c3d = c3dserver; % Start C3D Server 
setappdata(0,'UseNativeSystemDialogs',false) % Hack for many Files
[fname, pname] = uigetfile({'*.c3d','Vicon Files (*.c3d)'}, 'Choose Files:','MultiSelect', 'on'); % Open Files with GUI Window

for i = 1:length(fname),     

    %% -------- Load C3D File ---------  
    filename = [pname, fname{i}]; % Save Filename and Filepath
    
    %% -------- Load File Informations ---------  
    pRet = c3d.Open(filename,3); % Load File in C3D Server
    nFirst = c3d.GetVideoFrame(0); % First Video Frame
    nLast = c3d.GetVideoFrame(1); % Last Video Frame
    vRate = c3d.GetVideoFrameRate(); % Video sampling frequenzy
    nRatio = c3d.GetAnalogVideoRatio(); % Sampling ratio Video/Force
    aRate = vRate * nRatio; % Sampling frequenzy analoge data
    nAnalog = c3d.GetAnalogChannels; % Number of used analog Channels
  
    % Get count of used analoge channel
    analogeIndex = c3d.GetParameterIndex('ANALOG', 'LABELS');
    analogeLength = c3d.GetParameterLength(analogeIndex);

     if analogeLength < 1,
         h = warndlg('Sorry, no analog Data available!','!! Warning !!');
     else
         
    % loading Force Data from c3d File (0=Fx, 1=Fy,2=Fz, 3=Mx, 4=My, 5=Mz)
    forceData(:,1) = c3d.GetAnalogDataEx(0,0,1,'0',0,1,'0'); % load Fx Force Data 
    forceData(:,2) = c3d.GetAnalogDataEx(1,0,1,'0',0,1,'0'); % load Fy Force Data 
    forceData(:,3) = c3d.GetAnalogDataEx(2,0,1,'0',0,1,'0'); % load Fz Force Data 
    momentData(:,1) = c3d.GetAnalogDataEx(3,0,1,'0',0,1,'0'); % load Mx Moment Data 
    momentData(:,2) = c3d.GetAnalogDataEx(4,0,1,'0',0,1,'0'); % load My Moment Data 
    momentData(:,3) = c3d.GetAnalogDataEx(5,0,1,'0',0,1,'0'); % load Mz Moment Data
    
    % Transform Cell to matrix
    forceData = cell2mat(forceData);
    momentData = cell2mat(momentData);
     
    % Check Standing duration
    if length(forceData) < startT + t,
         h = errordlg('Sorry, input Data are to short for a duration of 20 sec.','!! Error !!');
         break;
    else
    % Cut off data to t datapoints
    forceData = forceData(startT:startT+t,:);
    momentData = momentData(startT:startT+t,:);
        
        %% Origin AMTI LG6-2000
        Ax = -0.2794;    % Origin x
        Ay = -2.6162;    % Origin y
        Az = 60.706;     % Origin z
        

        %% COP x,y and torque vector Tz
        % COP Calculation from source: http://www.kwon3d.com/theory/grf/cop.html
        x =  -(momentData(:,2) + Az .* forceData(:,1)) ./  forceData(:,3) + Ax ;
        y =  (momentData(:,1) - Az .* forceData(:,2)) ./ forceData(:,3) + Ay ;

        % Center X and Y to the local Center of the Force Plate
        centerX = -304.9-x;
        centerY = -609.8+y;


            %% Calculating PathLength
            for counter = 1:length(centerX)-1 % Loses of last Datapoint because of Differential
                 pathL(counter,1) = abs(centerX(counter+1,1) - centerX(counter,1));        %x
                 pathL(counter,2) = abs(centerY(counter+1,1) - centerY(counter,1));        %y
                 pathLength(counter,1) = sqrt(pathL(counter,1)^2+pathL(counter,2)^2);      %resulated path length
            end

            % Absolute Paths
            pathLx(i) = sum(pathL(:,1));       % Pathlength X
            pathLy(i) = sum(pathL(:,2));       % Pathlength Y
            pathLength(i) = sum(pathLength);   % Pathlength
        end
     end
     clear forceData;
     clear momentData;  
end
