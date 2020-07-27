function [skeleton] = import_tsv_file(skeleton_file)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function reads tsv file and outputs organized data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish output
skeleton = [];
fid = fopen(skeleton_file);
% C = ones(1,1:178);
C = textscan(fid,['%s' repmat('%s',1,178)], 'HeaderLines', 5); %178
fclose(fid);

%Misc data
skeleton_time =         C{1,1};
skeleton_frames =       C{1,2};

%% Hips Coordinates and Quaternians
% hips_raw = zeros(size(C{1,1},1),size(C{1,1},2));
for ii = 1:6
    for jj = 3:9
        hips_raw(:,jj) = C{1,jj};
    end
    hips_raw = hips_raw(:,3:9);
%     hips_index = zeros(size(hips_raw,1), size(hips_raw,2));
    hips_index = str2double(hips_raw);
end
hips_index(any(isnan(hips_index),2),:) = [];
skeleton.hips = hips_index;

%% Spine Coordinates and Quaternians
ref = 7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        spine_raw(:,jj) = C{1,jj};
    end
    spine_raw = spine_raw(:,ref:ref+6);
%     spine_index = zeros(size(spine_raw,1), size(spine_raw,2));
    spine_index = str2double(spine_raw);
end
spine_index(any(isnan(spine_index),2),:) = [];
skeleton.spine = spine_index;

ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        spine1_raw(:,jj) = C{1,jj};
    end
    spine1_raw = spine1_raw(:,ref:ref+6);
    spine1_index = str2double(spine1_raw);
end
spine1_index(any(isnan(spine1_index),2),:) = [];
skeleton.spine1 = spine1_index;

ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        spine2_raw(:,jj) = C{1,jj};
    end
    spine2_raw = spine2_raw(:,ref:ref+6);
    spine2_index = str2double(spine2_raw);
end
spine2_index(any(isnan(spine2_index),2),:) = [];
skeleton.spine2 = spine2_index;

%% LShoulder Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LShoulder_raw(:,jj) = C{1,jj};
    end
    LShoulder_raw = LShoulder_raw(:,ref:ref+6);
    LShoulder_index = str2double(LShoulder_raw);
end
LShoulder_index(any(isnan(LShoulder_index),2),:) = [];
skeleton.LShoulder = LShoulder_index;

%% LArm Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LArm_raw(:,jj) = C{1,jj};
    end
    LArm_raw = LArm_raw(:,ref:ref+6);
    LArm_index = str2double(LArm_raw);
end
LArm_index(any(isnan(LArm_index),2),:) = [];
skeleton.LArm = LArm_index;

%% LForearm Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LForearm_raw(:,jj) = C{1,jj};
    end
    LForearm_raw = LForearm_raw(:,ref:ref+6);
    LForearm_index = str2double(LForearm_raw);
end
LForearm_index(any(isnan(LForearm_index),2),:) = [];
skeleton.LForearm = LForearm_index;

%% LHand Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LHand_raw(:,jj) = C{1,jj};
    end
    LHand_raw = LHand_raw(:,ref:ref+6);
    LHand_index = str2double(LHand_raw);
end
LHand_index(any(isnan(LHand_index),2),:) = [];
skeleton.LHand = LHand_index;

%% RShoulder Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RShoulder_raw(:,jj) = C{1,jj};
    end
    RShoulder_raw = RShoulder_raw(:,ref:ref+6);
    RShoulder_index = str2double(RShoulder_raw);
end
RShoulder_index(any(isnan(RShoulder_index),2),:) = [];
skeleton.RShoulder = RShoulder_index;

%% RArm Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RArm_raw(:,jj) = C{1,jj};
    end
    RArm_raw = RArm_raw(:,ref:ref+6);
    RArm_index = str2double(RArm_raw);
end
RArm_index(any(isnan(RArm_index),2),:) = [];
skeleton.RArm = RArm_index;

%% RForearm Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RForearm_raw(:,jj) = C{1,jj};
    end
    RForearm_raw = RForearm_raw(:,ref:ref+6);
    RForearm_index = str2double(RForearm_raw);
end
RForearm_index(any(isnan(RForearm_index),2),:) = [];
skeleton.RForearm = RForearm_index;

%% RHand Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RHand_raw(:,jj) = C{1,jj};
    end
    RHand_raw = RHand_raw(:,ref:ref+6);
    RHand_index = str2double(RHand_raw);
end
RHand_index(any(isnan(RHand_index),2),:) = [];
skeleton.RHand = RHand_index;

%% Neck Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        Neck_raw(:,jj) = C{1,jj};
    end
    Neck_raw = Neck_raw(:,ref:ref+6);
    Neck_index = str2double(Neck_raw);
end
Neck_index(any(isnan(Neck_index),2),:) = [];
skeleton.Neck = Neck_index;

%% Head Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        Head_raw(:,jj) = C{1,jj};
    end
    Head_raw = Head_raw(:,ref:ref+6);
    Head_index = str2double(Head_raw);
end
Head_index(any(isnan(Head_index),2),:) = [];
skeleton.Head = Head_index;

%% LUpperLeg Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LUpperLeg_raw(:,jj) = C{1,jj};
    end
    LUpperLeg_raw = LUpperLeg_raw(:,ref:ref+6);
    LUpperLeg_index = str2double(LUpperLeg_raw);
end
LUpperLeg_index(any(isnan(LUpperLeg_index),2),:) = [];
skeleton.LUpperLeg = LUpperLeg_index;

%% LLeg Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LLeg_raw(:,jj) = C{1,jj};
    end
    LLeg_raw = LLeg_raw(:,ref:ref+6);
    LLeg_index = str2double(LLeg_raw);
end
LLeg_index(any(isnan(LLeg_index),2),:) = [];
skeleton.LLeg = LLeg_index;

%% LFoot Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LFoot_raw(:,jj) = C{1,jj};
    end
    LFoot_raw = LFoot_raw(:,ref:ref+6);
    LFoot_index = str2double(LFoot_raw);
end
LFoot_index(any(isnan(LFoot_index),2),:) = [];
skeleton.LFoot = LFoot_index;

%% LToeBase Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        LToeBase_raw(:,jj) = C{1,jj};
    end
    LToeBase_raw = LToeBase_raw(:,ref:ref+6);
    LToeBase_index = str2double(LToeBase_raw);
end
LToeBase_index(any(isnan(LToeBase_index),2),:) = [];
skeleton.LToeBase = LToeBase_index;

%% RUpperLeg Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RUpperLeg_raw(:,jj) = C{1,jj};
    end
    RUpperLeg_raw = RUpperLeg_raw(:,ref:ref+6);
    RUpperLeg_index = str2double(RUpperLeg_raw);
end
RUpperLeg_index(any(isnan(RUpperLeg_index),2),:) = [];
skeleton.RUpperLeg = RUpperLeg_index;

%% RLeg Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RLeg_raw(:,jj) = C{1,jj};
    end
    RLeg_raw = RLeg_raw(:,ref:ref+6);
    RLeg_index = str2double(RLeg_raw);
end
RLeg_index(any(isnan(RLeg_index),2),:) = [];
skeleton.RLeg = RLeg_index;

%% RFoot Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RFoot_raw(:,jj) = C{1,jj};
    end
    RFoot_raw = RFoot_raw(:,ref:ref+6);
    RFoot_index = str2double(RFoot_raw);
end
RFoot_index(any(isnan(RFoot_index),2),:) = [];
skeleton.RFoot = RFoot_index;

%% RToeBase Coordinates and Quaternians
ref = ref+7; %tsv spine index ref
for ii = 1:6
    for jj = ref:ref+6
        RToeBase_raw(:,jj) = C{1,jj};
    end
    RToeBase_raw = RToeBase_raw(:,ref:ref+6);
    RToeBase_index = str2double(RToeBase_raw);
end
RToeBase_index(any(isnan(RToeBase_index),2),:) = [];
skeleton.RToeBase = RToeBase_index;

end