function[head,chest,hip,LThigh,RThigh,LLeg,RLeg,LFoot,RFoot] = calcMar_Vel_Acc_Jerk(segCenter,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calc vel, acc, jerk for specified segCenters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%question: how does the acc and jerk in x,y,z jerk differ for markers?

%% Initial structuring of markers of interest
head =      [];
chest =     [];
hip =       [];
LThigh =    [];
RThigh =    [];
LLeg =      [];
RLeg =      [];
LFoot =     [];
RFoot =     [];

%% Head vel, acc, and jerk calculations
%head individual (x y z) position
head_marPos =               segCenter.headCenter_mar_dim_frame;
head_marPosx =              head_marPos(1,:);
head_marPosy =              head_marPos(2,:);
head_marPosz =              head_marPos(3,:);
head.marPos =               head_marPos(trial_start_end);

%head individual (x y z)velocity
head.marVelx =              diff(head_marPosx(trial_start_end));
head.marVely =              diff(head_marPosy(trial_start_end));
head.marVelz =              diff(head_marPosz(trial_start_end));

%head individual (x y z) acceleration
head.marAccx =              diff(head.marVelx);
head.marAccy =              diff(head.marVely);
head.marAccz =              diff(head.marVelz);

%head individual (x y z) jerk
head.marJerkx =             diff(head.marAccx);
head.marJerky =             diff(head.marAccy);
head.marJerkz =             diff(head.marAccz);

%Total vel, acc, and jerk for head
head.totalmarVel =          plus(head.marVelx,head.marVely);
head.totalmarAcc =          diff(head.totalmarVel);
head.totalmarJerk =         diff(head.totalmarAcc);
head.totalmarJerk_abs =     abs(head.totalmarJerk);

%% Chest vel, acc, and jerk calculations
%chest individual (x y z) position
chest_marPos =              segCenter.chestCenter_mar_dim_frame;
chest_marPosx =             chest_marPos(1,:);
chest_marPosy =             chest_marPos(2,:);
chest_marPosz =             chest_marPos(3,:);
chest.marPos =              chest_marPos(trial_start_end);

%chest individual (x y z) velocity
chest.marVelx =             diff(chest_marPosx(trial_start_end));
chest.marVely =             diff(chest_marPosy(trial_start_end));
chest.marVelz =             diff(chest_marPosz(trial_start_end));

%chest individual (x y z) acceleration
chest.marAccx =             diff(chest.marVelx);
chest.marAccy =             diff(chest.marVely);
chest.marAccz =             diff(chest.marVelz);

%chest individual (x y z) jerk
chest.marJerkx =            diff(chest.marAccx);
chest.marJerky =            diff(chest.marAccy);
chest.marJerkz =            diff(chest.marAccz);

%chest total vel,acc, and jerk per trial
chest.totalmarVel =         plus(chest.marVelx,chest.marVely);
chest.totalmarAcc =         diff(chest.totalmarVel);
chest.totalmarJerk =        diff(chest.totalmarAcc);
chest.totalmarJerk_abs =    abs(chest.totalmarJerk);

%% Hips vel, acc, and jerk calculations
%hips individual (x y z) position
hip_marPos =              segCenter.hipCenter_mar_dim_frame;
hip_marPosx =             hip_marPos(1,:);
hip_marPosy =             hip_marPos(2,:);
hip_marPosz =             hip_marPos(3,:);
hip.marPos =              hip_marPos(trial_start_end);

%hip individual (x y z) velocity
hip.marVelx =             diff(hip_marPosx(trial_start_end));
hip.marVely =             diff(hip_marPosy(trial_start_end));
hip.marVelz =             diff(hip_marPosz(trial_start_end));

%hip individual (x y z) acceleration
hip.marAccx =             diff(hip.marVelx);
hip.marAccy =             diff(hip.marVely);
hip.marAccz =             diff(hip.marVelz);

%hip individual (x y z) jerk
hip.marJerkx =            diff(hip.marAccx);
hip.marJerky =            diff(hip.marAccy);
hip.marJerkz =            diff(hip.marAccz);

%hip total vel,acc, and jerk per trial
hip.totalmarVel =         plus(hip.marVelx,hip.marVely);
hip.totalmarAcc =         diff(hip.totalmarVel);
hip.totalmarJerk =        diff(hip.totalmarAcc);
hip.totalmarJerk_abs =    abs(hip.totalmarJerk);

%% LThigh & RThigh vel, acc, and jerk calculations
%LThigh individual (x y z) position
LThigh_marPos =              segCenter.LThighCenter_mar_dim_frame;
LThigh_marPosx =             LThigh_marPos(1,:);
LThigh_marPosy =             LThigh_marPos(2,:);
LThigh_marPosz =             LThigh_marPos(3,:);
LThigh.marPos =              LThigh_marPos(trial_start_end);

%LThigh individual (x y z) velocity
LThigh.marVelx =             diff(LThigh_marPosx(trial_start_end));
LThigh.marVely =             diff(LThigh_marPosy(trial_start_end));
LThigh.marVelz =             diff(LThigh_marPosz(trial_start_end));

%LThigh individual (x y z) acceleration
LThigh.marAccx =             diff(LThigh.marVelx);
LThigh.marAccy =             diff(LThigh.marVely);
LThigh.marAccz =             diff(LThigh.marVelz);

%LThigh individual (x y z) jerk
LThigh.marJerkx =            diff(LThigh.marAccx);
LThigh.marJerky =            diff(LThigh.marAccy);
LThigh.marJerkz =            diff(LThigh.marAccz);

%Total vel, acc, and jerk for LThigh
LThigh.totalmarVel =         plus(LThigh.marVelx,LThigh.marVely);
LThigh.totalmarAcc =         diff(LThigh.totalmarVel);
LThigh.totalmarJerk =        diff(LThigh.totalmarAcc);
LThigh.totalmarJerk_abs =    abs(LThigh.totalmarJerk);

%RThigh individual (x y z) position
RThigh_marPos =              segCenter.RThighCenter_mar_dim_frame;
RThigh_marPosx =             RThigh_marPos(1,:);
RThigh_marPosy =             RThigh_marPos(2,:);
RThigh_marPosz =             RThigh_marPos(3,:);
RThigh.marPos =              RThigh_marPos(trial_start_end);

%RThigh individual (x y z)velocity
RThigh.marVelx =             diff(RThigh_marPosx(trial_start_end));
RThigh.marVely =             diff(RThigh_marPosy(trial_start_end));
RThigh.marVelz =             diff(RThigh_marPosz(trial_start_end));

%RThigh individual (x y z) acceleration
RThigh.marAccx =             diff(RThigh.marVelx);
RThigh.marAccy =             diff(RThigh.marVely);
RThigh.marAccz =             diff(RThigh.marVelz);

%RThigh individual (x y z) jerk
RThigh.marJerkx =            diff(RThigh.marAccx);
RThigh.marJerky =            diff(RThigh.marAccy);
RThigh.marJerkz =            diff(RThigh.marAccz);

%Total vel, acc, and jerk for RThigh
RThigh.totalmarVel =         plus(RThigh.marVelx,RThigh.marVely);
RThigh.totalmarAcc =         diff(RThigh.totalmarVel);
RThigh.totalmarJerk =        diff(RThigh.totalmarAcc);
RThigh.totalmarJerk_abs =    abs(RThigh.totalmarJerk);

%% LLeg & RLeg vel, acc, and jerk calculations
%LLeg individual (x y z) position
LLeg_marPos =              segCenter.LLegCenter_mar_dim_frame;
LLeg_marPosx =             LLeg_marPos(1,:);
LLeg_marPosy =             LLeg_marPos(2,:);
LLeg_marPosz =             LLeg_marPos(3,:);
LLeg.marPos =              LLeg_marPos(trial_start_end);

%LLeg individual (x y z) velocity
LLeg.marVelx =             diff(LLeg_marPosx(trial_start_end));
LLeg.marVely =             diff(LLeg_marPosy(trial_start_end));
LLeg.marVelz =             diff(LLeg_marPosz(trial_start_end));

%LLeg individual (x y z) acceleration
LLeg.marAccx =             diff(LLeg.marVelx);
LLeg.marAccy =             diff(LLeg.marVely);
LLeg.marAccz =             diff(LLeg.marVelz);

%LLeg individual (x y z) jerk
LLeg.marJerkx =            diff(LLeg.marAccx);
LLeg.marJerky =            diff(LLeg.marAccy);
LLeg.marJerkz =            diff(LLeg.marAccz);

%Total vel, acc, and jerk for LLeg
LLeg.totalmarVel =         plus(LLeg.marVelx,LLeg.marVely);
LLeg.totalmarAcc =         diff(LLeg.totalmarVel);
LLeg.totalmarJerk =        diff(LLeg.totalmarAcc);
LLeg.totalmarJerk_abs =    abs(LLeg.totalmarJerk);

%RLeg individual (x y z) position
RLeg_marPos =              segCenter.RLegCenter_mar_dim_frame;
RLeg_marPosx =             RLeg_marPos(1,:);
RLeg_marPosy =             RLeg_marPos(2,:);
RLeg_marPosz =             RLeg_marPos(3,:);
RLeg.marPos =              RLeg_marPos(trial_start_end);

%RLeg individual (x y z)velocity
RLeg.marVelx =             diff(RLeg_marPosx(trial_start_end));
RLeg.marVely =             diff(RLeg_marPosy(trial_start_end));
RLeg.marVelz =             diff(RLeg_marPosz(trial_start_end));

%RLeg individual (x y z) acceleration
RLeg.marAccx =             diff(RLeg.marVelx);
RLeg.marAccy =             diff(RLeg.marVely);
RLeg.marAccz =             diff(RLeg.marVelz);

%RLeg individual (x y z) jerk
RLeg.marJerkx =            diff(RLeg.marAccx);
RLeg.marJerky =            diff(RLeg.marAccy);
RLeg.marJerkz =            diff(RLeg.marAccz);

%Total vel, acc, and jerk for RLeg
RLeg.totalmarVel =         plus(RLeg.marVelx,RLeg.marVely);
RLeg.totalmarAcc =         diff(RLeg.totalmarVel);
RLeg.totalmarJerk =        diff(RLeg.totalmarAcc);
RLeg.totalmarJerk_abs =    abs(RLeg.totalmarJerk);

%% LAnkle & RAnkle vel, acc, and jerk calculations
%LFoot individual (x y z) position
LFoot_marPos =              segCenter.LFootCenter_mar_dim_frame;
LFoot_marPosx =             LFoot_marPos(1,:);
LFoot_marPosy =             LFoot_marPos(2,:);
LFoot_marPosz =             LFoot_marPos(3,:);
LFoot.marPos =              LFoot_marPos(trial_start_end);


%LFoot individual (x y z) velocity
LFoot.marVelx =             diff(LFoot_marPosx(trial_start_end));
LFoot.marVely =             diff(LFoot_marPosy(trial_start_end));
LFoot.marVelz =             diff(LFoot_marPosz(trial_start_end));

%LFoot individual (x y z) acceleration
LFoot.marAccx =             diff(LFoot.marVelx);
LFoot.marAccy =             diff(LFoot.marVely);
LFoot.marAccz =             diff(LFoot.marVelz);

%LFoot individual (x y z) jerk
LFoot.marJerkx =            diff(LFoot.marAccx);
LFoot.marJerky =            diff(LFoot.marAccy);
LFoot.marJerkz =            diff(LFoot.marAccz);

%Total vel, acc, and jerk for LFoot
LFoot.totalmarVel =         plus(LFoot.marVelx,LFoot.marVely);
LFoot.totalmarAcc =         diff(LFoot.totalmarVel);
LFoot.totalmarJerk =        diff(LFoot.totalmarAcc);
LFoot.totalmarJerk_abs =    abs(LFoot.totalmarJerk);

%RFoot individual (x y z) position
RFoot_marPos =              segCenter.RFootCenter_mar_dim_frame;
RFoot_marPosx =             RFoot_marPos(1,:);
RFoot_marPosy =             RFoot_marPos(2,:);
RFoot_marPosz =             RFoot_marPos(3,:);
RFoot.marPos =              RFoot_marPos(trial_start_end);

%RFoot individual (x y z)velocity
RFoot.marVelx =             diff(RFoot_marPosx(trial_start_end));
RFoot.marVely =             diff(RFoot_marPosy(trial_start_end));
RFoot.marVelz =             diff(RFoot_marPosz(trial_start_end));

%RFoot individual (x y z) acceleration
RFoot.marAccx =             diff(RFoot.marVelx);
RFoot.marAccy =             diff(RFoot.marVely);
RFoot.marAccz =             diff(RFoot.marVelz);

%RFoot individual (x y z) jerk
RFoot.marJerkx =            diff(RFoot.marAccx);
RFoot.marJerky =            diff(RFoot.marAccy);
RFoot.marJerkz =            diff(RFoot.marAccz);

%Total vel, acc, and jerk for RFoot
RFoot.totalmarVel =         plus(RFoot.marVelx,RFoot.marVely);
RFoot.totalmarAcc =         diff(RFoot.totalmarVel);
RFoot.totalmarJerk =        diff(RFoot.totalmarAcc);
RFoot.totalmarJerk_abs =    abs(RFoot.totalmarJerk);

%% Plot marker of interest
% figure(50)
% subplot(1,3,1)
% plot(RFoot.marVelx)
% title('RFoot Velx')
% subplot(1,3,2)
% plot(RFoot.marVely)
% title('RFoot Vely')
% subplot(1,3,3)
% plot(RFoot.marVelz)
% title('RFoot Velz')

% figure(51)
% subplot(1,3,1)
% plot(RFoot.marAccx)
% title('RFoot Accx')
% subplot(1,3,2)
% plot(RFoot.marAccy)
% title('RFoot Accy')
% subplot(1,3,3)
% plot(RFoot.marAccz)
% title('RFoot Accz')

% figure(52)
% subplot(1,3,1)
% plot(RFoot.marJerkx)
% title('RFoot Jerkx')
% subplot(1,3,2)
% plot(RFoot.marJerky)
% title('RFoot Jerky')
% subplot(1,3,3)
% plot(RFoot.marJerkz)
% title('RFoot Jerkz')

% figure(55)
% subplot(1,3,1)
% plot(RFoot.totalmarVel)
% title('RFoot Total Vel')
% subplot(1,3,2)
% plot(RFoot.totalmarAcc)
% title('RFoot Total Acc')
% subplot(1,3,3)
% plot(RFoot.totalmarJerk_abs)
% title('RFoot Total Jerk')

end
