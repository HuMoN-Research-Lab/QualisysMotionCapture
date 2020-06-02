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
head.marPosx =             segCenter.headCenter_mar_dim_frame(1,:);
head.marPosy =             segCenter.headCenter_mar_dim_frame(2,:);
head.marPosz =             segCenter.headCenter_mar_dim_frame(3,:);

%head individual (x y z)velocity
head.marVelx =             diff(head.marPosx(trial_start_end));
head.marVely =             diff(head.marPosy(trial_start_end));
head.marVelz =             diff(head.marPosz(trial_start_end));

%head individual (x y z) acceleration
head.marAccx =             diff(head.marVelx);
head.marAccy =             diff(head.marVely);
head.marAccz =             diff(head.marVelz);

%head individual (x y z) jerk
head.marJerkx =            diff(head.marAccx);
head.marJerky =            diff(head.marAccy);
head.marJerkz =            diff(head.marAccz);

%Total vel, acc, and jerk for head
head.totalmarVel =         plus(head.marVelx,head.marVely);
head.totalmarAcc =         diff(head.totalmarVel);
head.totalmarJerk =        diff(head.totalmarAcc);
head.totalmarJerk_abs =    abs(head.totalmarJerk);

%% Chest vel, acc, and jerk calculations
%chest individual (x y z) position
chest.marPosx =             segCenter.chestCenter_mar_dim_frame(1,:);
chest.marPosy =             segCenter.chestCenter_mar_dim_frame(2,:);
chest.marPosz =             segCenter.chestCenter_mar_dim_frame(3,:);

%chest individual (x y z) velocity
chest.marVelx =             diff(chest.marPosx(trial_start_end));
chest.marVely =             diff(chest.marPosy(trial_start_end));
chest.marVelz =             diff(chest.marPosz(trial_start_end));

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
hip_marPosx =             segCenter.hipCenter_mar_dim_frame(1,:);
hip_marPosy =             segCenter.hipCenter_mar_dim_frame(2,:);
hip_marPosz =             segCenter.hipCenter_mar_dim_frame(3,:);

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
LThigh.marPosx =             segCenter.LThighCenter_mar_dim_frame(1,:);
LThigh.marPosy =             segCenter.LThighCenter_mar_dim_frame(2,:);
LThigh.marPosz =             segCenter.LThighCenter_mar_dim_frame(3,:);

%LThigh individual (x y z) velocity
LThigh.marVelx =             diff(LThigh.marPosx(trial_start_end));
LThigh.marVely =             diff(LThigh.marPosy(trial_start_end));
LThigh.marVelz =             diff(LThigh.marPosz(trial_start_end));

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
RThigh.marPosx =             segCenter.RThighCenter_mar_dim_frame(1,:);
RThigh.marPosy =             segCenter.RThighCenter_mar_dim_frame(2,:);
RThigh.marPosz =             segCenter.RThighCenter_mar_dim_frame(3,:);

%RThigh individual (x y z)velocity
RThigh.marVelx =             diff(RThigh.marPosx(trial_start_end));
RThigh.marVely =             diff(RThigh.marPosy(trial_start_end));
RThigh.marVelz =             diff(RThigh.marPosz(trial_start_end));

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
LLeg.marPosx =             segCenter.LLegCenter_mar_dim_frame(1,:);
LLeg.marPosy =             segCenter.LLegCenter_mar_dim_frame(2,:);
LLeg.marPosz =             segCenter.LLegCenter_mar_dim_frame(3,:);

%LLeg individual (x y z) velocity
LLeg.marVelx =             diff(LLeg.marPosx(trial_start_end));
LLeg.marVely =             diff(LLeg.marPosy(trial_start_end));
LLeg.marVelz =             diff(LLeg.marPosz(trial_start_end));

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
RLeg.marPosx =             segCenter.RLegCenter_mar_dim_frame(1,:);
RLeg.marPosy =             segCenter.RLegCenter_mar_dim_frame(2,:);
RLeg.marPosz =             segCenter.RLegCenter_mar_dim_frame(3,:);

%RLeg individual (x y z)velocity
RLeg.marVelx =             diff(RLeg.marPosx(trial_start_end));
RLeg.marVely =             diff(RLeg.marPosy(trial_start_end));
RLeg.marVelz =             diff(RLeg.marPosz(trial_start_end));

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
LFoot.marPosx =             segCenter.LFootCenter_mar_dim_frame(1,:);
LFoot.marPosy =             segCenter.LFootCenter_mar_dim_frame(2,:);
LFoot.marPosz =             segCenter.LFootCenter_mar_dim_frame(3,:);

%LFoot individual (x y z) velocity
LFoot.marVelx =             diff(LFoot.marPosx(trial_start_end));
LFoot.marVely =             diff(LFoot.marPosy(trial_start_end));
LFoot.marVelz =             diff(LFoot.marPosz(trial_start_end));

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
RFoot.marPosx =             segCenter.RFootCenter_mar_dim_frame(1,:);
RFoot.marPosy =             segCenter.RFootCenter_mar_dim_frame(2,:);
RFoot.marPosz =             segCenter.RFootCenter_mar_dim_frame(3,:);

%RFoot individual (x y z)velocity
RFoot.marVelx =             diff(RFoot.marPosx(trial_start_end));
RFoot.marVely =             diff(RFoot.marPosy(trial_start_end));
RFoot.marVelz =             diff(RFoot.marPosz(trial_start_end));

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
