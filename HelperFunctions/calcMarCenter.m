function [segCenter] = calcMarCenter(marker_mar_dim_frame,markerLabels) %,markerID)
%calcMarCenter find the center position for each anatomical segment

%% Head Markers
%Store markers data into marTrajectory for the head
HeadL = getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadTop = getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadR = getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadFront = getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');

%x values located on corresponding column
headPosX(:,1) =                     HeadL(1,:)';
headPosX(:,2) =                     HeadTop(1,:)';
headPosX(:,3) =                     HeadR(1,:)';
headPosX(:,4) =                     HeadFront(1,:)';
headPosX =                          mean(headPosX,2);

%y values located on corresponding column
headPosY(:,1) =                     HeadL(2,:)';
headPosY(:,2) =                     HeadTop(2,:)';
headPosY(:,3) =                     HeadR(2,:)';
headPosY(:,4) =                     HeadFront(2,:)';
headPosY =                          mean(headPosY,2);

%z values located on corresponding column
headPosZ(:,1) =                     HeadL(3,:)';
headPosZ(:,2) =                     HeadTop(3,:)';
headPosZ(:,3) =                     HeadR(3,:)';
headPosZ(:,4) =                     HeadFront(3,:)';
headPosZ =                          mean(headPosZ,2);

%Center location for the head
segCenter.HeadCenter =              (headPosX).';
segCenter.HeadCenter(2,:) =         (headPosY).';
segCenter.HeadCenter(3,:) =         (headPosZ).';

%% LShoulder Markers
%Store markers data into segCenter for the LeftShoulder
LShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

%x values located on corresponding column
LShoulderPosX(:,1) =                LShoulderTop(1,:)';
LShoulderPosX(:,2) =                LShoulderBack(1,:)';
LShoulderPosX =                     mean(LShoulderPosX,2);

%y values located on corresponding column
LShoulderPosY(:,1) =                LShoulderTop(2,:)';
LShoulderPosY(:,2) =                LShoulderBack(2,:)';
LShoulderPosY =                     mean(LShoulderPosY,2);

%z values located on corresponding column
LShoulderPosZ(:,1) =                LShoulderTop(3,:)';
LShoulderPosZ(:,2) =                LShoulderBack(3,:)';
LShoulderPosZ =                     mean(LShoulderPosZ,2);

%Center location for the LShoulder
segCenter.LShoulderCenter =         (LShoulderPosX).';
segCenter.LShoulderCenter(2,:) =    (LShoulderPosY).';
segCenter.LShoulderCenter(3,:) =    (LShoulderPosZ).';

%% LUpperArm Markers
%Store markers data into segCenter for the LUpperArm
LArm = getMarker(marker_mar_dim_frame,markerLabels,'LArm');
LElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'LElbowOut');

%x values located on corresponding column
LUpperArmPosX(:,1) =                LArm(1,:)';
LUpperArmPosX(:,2) =                LElbowOut(1,:)';
LUpperArmPosX =                     mean(LUpperArmPosX,2);

%y values located on corresponding column
LUpperArmPosY(:,1) =                LArm(2,:)';
LUpperArmPosY(:,2) =                LElbowOut(2,:)';
LUpperArmPosY =                     mean(LUpperArmPosY,2);

%z values located on corresponding column
LUpperArmPosZ(:,1) =                LArm(3,:)';
LUpperArmPosZ(:,2) =                LElbowOut(3,:)';
LUpperArmPosZ =                     mean(LUpperArmPosZ,2);

%Center location for the LUpperArm
segCenter.LUpperArmCenter =         (LUpperArmPosX).';
segCenter.LUpperArmCenter(2,:) =    (LUpperArmPosY).';
segCenter.LUpperArmCenter(3,:) =    (LUpperArmPosZ).';

%% LForearm Markers
%Store markers data into segCenter for the LForearm
LWristOut = getMarker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristIn = getMarker(marker_mar_dim_frame,markerLabels,'LWristIn');

%x values located on corresponding column
LForearmPosX(:,1) =                 LElbowOut(1,:)';
LForearmPosX(:,2) =                 LWristOut(1,:)';
LForearmPosX(:,3) =                 LWristIn(1,:)';
LForearmPosX =                      mean(LForearmPosX,2);

%y values located on corresponding column
LForearmPosY(:,1) =                 LElbowOut(2,:)';
LForearmPosY(:,2) =                 LWristOut(2,:)';
LForearmPosX(:,3) =                 LWristIn(2,:)';
LForearmPosY =                      mean(LForearmPosY,2);

%z values located on corresponding column
LForearmPosZ(:,1) =                 LElbowOut(3,:)';
LForearmPosZ(:,2) =                 LWristOut(3,:)';
LForearmPosX(:,3) =                 LWristIn(3,:)';
LForearmPosZ =                      mean(LForearmPosZ,2);

%Center location for the LUpperArm
segCenter.LForearmCenter =          (LForearmPosX).';
segCenter.LForearmCenter(2,:) =     (LForearmPosY).';
segCenter.LForearmCenter(3,:) =     (LForearmPosZ).';

%% LHand Markers
%Store markers data into segCenter for the LHand
LHandOut = getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');

%x values located on corresponding column
LHandPosX(:,1) =                 LWristOut(1,:)';
LHandPosX(:,2) =                 LWristIn(1,:)';
LHandPosX(:,3) =                 LHandOut(1,:)';
LHandPosX =                      mean(LHandPosX,2);

%y values located on corresponding column
LHandPosY(:,1) =                 LWristOut(2,:)';
LHandPosY(:,2) =                 LWristIn(2,:)';
LHandPosY(:,3) =                 LHandOut(2,:)';
LHandPosY =                      mean(LHandPosY,2);

%z values located on corresponding column
LHandPosZ(:,1) =                 LWristOut(3,:)';
LHandPosZ(:,2) =                 LWristIn(3,:)';
LHandPosZ(:,3) =                 LHandOut(3,:)';
LHandPosZ =                      mean(LHandPosZ,2);

%Center location for the LHand
segCenter.LHandCenter =          (LHandPosX).';
segCenter.LHandCenter(2,:) =     (LHandPosY).';
segCenter.LHandCenter(3,:) =     (LHandPosZ).';

%% RShoulder Markers
%Store markers data into segCenter for the LeftShoulder
RShoulderTop = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderBack = getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

%x values located on corresponding column
RShoulderPosX(:,1) =                RShoulderTop(1,:)';
RShoulderPosX(:,2) =                RShoulderBack(1,:)';
RShoulderPosX =                     mean(RShoulderPosX,2);

%y values located on corresponding column
RShoulderPosY(:,1) =                RShoulderTop(2,:)';
RShoulderPosY(:,2) =                RShoulderBack(2,:)';
RShoulderPosY =                     mean(RShoulderPosY,2);

%z values located on corresponding column
RShoulderPosZ(:,1) =                RShoulderTop(3,:)';
RShoulderPosZ(:,2) =                RShoulderBack(3,:)';
RShoulderPosZ =                     mean(RShoulderPosZ,2);

%Center location for the RShoulder
segCenter.RShoulderCenter =         (RShoulderPosX).';
segCenter.RShoulderCenter(2,:) =    (RShoulderPosY).';
segCenter.RShoulderCenter(3,:) =    (RShoulderPosZ).';

%% RUpperArm Markers
%Store markers data into segCenter for the RUpperArm
RArm = getMarker(marker_mar_dim_frame,markerLabels,'RArm');
RElbowOut = getMarker(marker_mar_dim_frame,markerLabels,'RElbowOut');

%x values located on corresponding column
RUpperArmPosX(:,1) =                RArm(1,:)';
RUpperArmPosX(:,2) =                RElbowOut(1,:)';
RUpperArmPosX =                     mean(RUpperArmPosX,2);

%y values located on corresponding column
RUpperArmPosY(:,1) =                RArm(2,:)';
RUpperArmPosY(:,2) =                RElbowOut(2,:)';
RUpperArmPosY =                     mean(RUpperArmPosY,2);

%z values located on corresponding column
RUpperArmPosZ(:,1) =                RArm(3,:)';
RUpperArmPosZ(:,2) =                RElbowOut(3,:)';
RUpperArmPosZ =                     mean(RUpperArmPosZ,2);

%Center location for the RUpperArm
segCenter.RUpperArmCenter =         (RUpperArmPosX).';
segCenter.RUpperArmCenter(2,:) =    (RUpperArmPosY).';
segCenter.RUpperArmCenter(3,:) =    (RUpperArmPosZ).';

%% RForearm Markers
%Store markers data into segCenter for the RForearm
RWristOut = getMarker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristIn = getMarker(marker_mar_dim_frame,markerLabels,'RWristIn');

%x values located on corresponding column
RForearmPosX(:,1) =                 RElbowOut(1,:)';
RForearmPosX(:,2) =                 RWristOut(1,:)';
RForearmPosX(:,3) =                 RWristIn(1,:)';
RForearmPosX =                      mean(RForearmPosX,2);

%y values located on corresponding column
RForearmPosY(:,1) =                 RElbowOut(2,:)';
RForearmPosY(:,2) =                 RWristOut(2,:)';
RForearmPosX(:,3) =                 RWristIn(2,:)';
RForearmPosY =                      mean(RForearmPosY,2);

%z values located on corresponding column
RForearmPosZ(:,1) =                 RElbowOut(3,:)';
RForearmPosZ(:,2) =                 RWristOut(3,:)';
RForearmPosX(:,3) =                 RWristIn(3,:)';
RForearmPosZ =                      mean(RForearmPosZ,2);

%Center location for the RForearm
segCenter.RForearmCenter =          (RForearmPosX).';
segCenter.RForearmCenter(2,:) =     (RForearmPosY).';
segCenter.RForearmCenter(3,:) =     (RForearmPosZ).';

%% RHand Markers
%Store markers data into segCenter for the RHand
RHandOut = getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');

%x values located on corresponding column
RHandPosX(:,1) =                 RWristOut(1,:)';
RHandPosX(:,2) =                 RWristIn(1,:)';
RHandPosX(:,3) =                 RHandOut(1,:)';
RHandPosX =                      mean(RHandPosX,2);

%y values located on corresponding column
RHandPosY(:,1) =                 RWristOut(2,:)';
RHandPosY(:,2) =                 RWristIn(2,:)';
RHandPosY(:,3) =                 RHandOut(2,:)';
RHandPosY =                      mean(RHandPosY,2);

%z values located on corresponding column
RHandPosZ(:,1) =                 RWristOut(3,:)';
RHandPosZ(:,2) =                 RWristIn(3,:)';
RHandPosZ(:,3) =                 RHandOut(3,:)';
RHandPosZ =                      mean(RHandPosZ,2);

%Center location for the RHand
segCenter.RHandCenter =          (RHandPosX).';
segCenter.RHandCenter(2,:) =     (RHandPosY).';
segCenter.RHandCenter(3,:) =     (RHandPosZ).';
end
