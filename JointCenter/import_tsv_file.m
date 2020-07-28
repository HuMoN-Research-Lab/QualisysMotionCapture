function [skeleton_mar_dim_frame,skeleton_seg_names] = import_tsv_file(skeleton_file,frame_rate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function reads tsv file and outputs organized data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish initial conditions for calculations
order = 4;
cutoff = 7;
skeleton_seg_names = {'Hips' 'Spine' 'Spine1' 'Spine2' 'LShoulder' 'LUpperArm'...
    'LForearm' 'LHand' 'RShoulder' 'RUpperArm' 'RForearm' 'RHand' 'Neck' 'Head'...
    'LUpperLeg' 'LLeg' 'LFoot' 'LToeBase' 'RUpperLeg' 'RLeg' 'RFoot' 'RToeBase'};    

fid = fopen(skeleton_file);
% C = ones(1,1:178);
C = textscan(fid,['%s' repmat('%s',1,178)], 'HeaderLines', 5); %178
fclose(fid);

% %Misc data
% skeleton_time =         C{1,1};
% skeleton_frames =       C{1,2};

%% Hips Coordinates and Quaternians
% hips_raw = zeros(size(C{1,1},1),size(C{1,1},2));
ref = 3;
seg_names_id = 1;
hips_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        hips_raw(jj,:) = C{1,jj}';
    end
    hips_raw = hips_raw(ref:ref+6,:);
    hips_index = str2double(hips_raw);
end
%Deletes headers
hips_index(:,any(isnan(hips_index),1)) = [];

filtered_data = zeros(3,length(hips_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, hips_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% Spine Coordinates and Quaternians
ref = 7;
seg_names_id = seg_names_id + 1;
spine_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        spine_raw(jj,:) = C{1,jj}';
    end
    spine_raw = spine_raw(ref:ref+6,:);
    spine_index = str2double(spine_raw);
end
%Deletes headers
spine_index(:,any(isnan(spine_index),1)) = [];

filtered_data = zeros(3,length(spine_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, spine_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

ref = ref+7;
seg_names_id = seg_names_id + 1;
spine1_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        spine1_raw(jj,:) = C{1,jj}';
    end
    spine1_raw = spine1_raw(ref:ref+6,:);
    spine1_index = str2double(spine1_raw);
end
spine1_index(:,any(isnan(spine1_index),1)) = [];

filtered_data = zeros(3,length(spine1_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, spine1_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

ref = ref+7;
seg_names_id = seg_names_id + 1;
spine2_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        spine2_raw(jj,:) = C{1,jj}';
    end
    spine2_raw = spine2_raw(ref:ref+6,:);
    spine2_index = str2double(spine2_raw);
end
spine2_index(:,any(isnan(spine2_index),1)) = [];

filtered_data = zeros(3,length(spine2_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, spine2_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LShoulder Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LShoulder_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LShoulder_raw(jj,:) = C{1,jj}';
    end
    LShoulder_raw = LShoulder_raw(ref:ref+6,:);
    LShoulder_index = str2double(LShoulder_raw);
end
LShoulder_index(:,any(isnan(LShoulder_index),1)) = [];

filtered_data = zeros(3,length(LShoulder_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LShoulder_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LArm Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LArm_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LArm_raw(jj,:) = C{1,jj}';
    end
    LArm_raw = LArm_raw(ref:ref+6,:);
    LArm_index = str2double(LArm_raw);
end
LArm_index(:,any(isnan(LArm_index),1)) = [];

filtered_data = zeros(3,length(LArm_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LArm_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LForearm Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LForearm_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LForearm_raw(jj,:) = C{1,jj}';
    end
    LForearm_raw = LForearm_raw(ref:ref+6,:);
    LForearm_index = str2double(LForearm_raw);
end
LForearm_index(:,any(isnan(LForearm_index),1)) = [];

filtered_data = zeros(3,length(LForearm_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LForearm_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LHand Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LHand_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LHand_raw(jj,:) = C{1,jj}';
    end
    LHand_raw = LHand_raw(ref:ref+6,:);
    LHand_index = str2double(LHand_raw);
end
LHand_index(:,any(isnan(LHand_index),1)) = [];

filtered_data = zeros(3,length(LHand_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LHand_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RShoulder Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RShoulder_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RShoulder_raw(jj,:) = C{1,jj}';
    end
    RShoulder_raw = RShoulder_raw(ref:ref+6,:);
    RShoulder_index = str2double(RShoulder_raw);
end
RShoulder_index(:,any(isnan(RShoulder_index),1)) = [];

filtered_data = zeros(3,length(RShoulder_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RShoulder_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RArm Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RArm_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RArm_raw(jj,:) = C{1,jj}';
    end
    RArm_raw = RArm_raw(ref:ref+6,:);
    RArm_index = str2double(RArm_raw);
end
RArm_index(:,any(isnan(RArm_index),1)) = [];

filtered_data = zeros(3,length(RArm_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RArm_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RForearm Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RForearm_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RForearm_raw(jj,:) = C{1,jj}';
    end
    RForearm_raw = RForearm_raw(ref:ref+6,:);
    RForearm_index = str2double(RForearm_raw);
end
RForearm_index(:,any(isnan(RForearm_index),1)) = [];

filtered_data = zeros(3,length(RForearm_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RForearm_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RHand Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RHand_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RHand_raw(jj,:) = C{1,jj}';
    end
    RHand_raw = RHand_raw(ref:ref+6,:);
    RHand_index = str2double(RHand_raw);
end
RHand_index(:,any(isnan(RHand_index),1)) = [];

filtered_data = zeros(3,length(RHand_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RHand_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% Neck Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
Neck_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        Neck_raw(jj,:) = C{1,jj}';
    end
    Neck_raw = Neck_raw(ref:ref+6,:);
    Neck_index = str2double(Neck_raw);
end
Neck_index(:,any(isnan(Neck_index),1)) = [];

filtered_data = zeros(3,length(Neck_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, Neck_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% Head Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
Head_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        Head_raw(jj,:) = C{1,jj}';
    end
    Head_raw = Head_raw(ref:ref+6,:);
    Head_index = str2double(Head_raw);
end
Head_index(:,any(isnan(Head_index),1)) = [];

filtered_data = zeros(3,length(Head_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, Head_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LUpperLeg Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LUpperLeg_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LUpperLeg_raw(jj,:) = C{1,jj}';
    end
    LUpperLeg_raw = LUpperLeg_raw(ref:ref+6,:);
    LUpperLeg_index = str2double(LUpperLeg_raw);
end
LUpperLeg_index(:,any(isnan(LUpperLeg_index),1)) = [];

filtered_data = zeros(3,length(LUpperLeg_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LUpperLeg_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LLeg Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LLeg_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LLeg_raw(jj,:) = C{1,jj}';
    end
    LLeg_raw = LLeg_raw(ref:ref+6,:);
    LLeg_index = str2double(LLeg_raw);
end
LLeg_index(:,any(isnan(LLeg_index),1)) = [];

filtered_data = zeros(3,length(LLeg_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LLeg_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LFoot Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LFoot_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LFoot_raw(jj,:) = C{1,jj}';
    end
    LFoot_raw = LFoot_raw(ref:ref+6,:);
    LFoot_index = str2double(LFoot_raw);
end
LFoot_index(:,any(isnan(LFoot_index),1)) = [];

filtered_data = zeros(3,length(LFoot_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LFoot_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% LToeBase Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
LToeBase_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        LToeBase_raw(jj,:) = C{1,jj}';
    end
    LToeBase_raw = LToeBase_raw(ref:ref+6,:);
    LToeBase_index = str2double(LToeBase_raw);
end
LToeBase_index(:,any(isnan(LToeBase_index),1)) = [];

filtered_data = zeros(3,length(LToeBase_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, LToeBase_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RUpperLeg Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RUpperLeg_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RUpperLeg_raw(jj,:) = C{1,jj}';
    end
    RUpperLeg_raw = RUpperLeg_raw(ref:ref+6,:);
    RUpperLeg_index = str2double(RUpperLeg_raw);
end
RUpperLeg_index(:,any(isnan(RUpperLeg_index),1)) = [];

filtered_data = zeros(3,length(RUpperLeg_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RUpperLeg_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RLeg Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RLeg_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RLeg_raw(jj,:) = C{1,jj}';
    end
    RLeg_raw = RLeg_raw(ref:ref+6,:);
    RLeg_index = str2double(RLeg_raw);
end
RLeg_index(:,any(isnan(RLeg_index),1)) = [];

filtered_data = zeros(3,length(RLeg_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RLeg_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RFoot Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RFoot_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RFoot_raw(jj,:) = C{1,jj}';
    end
    RFoot_raw = RFoot_raw(ref:ref+6,:);
    RFoot_index = str2double(RFoot_raw);
end
RFoot_index(:,any(isnan(RFoot_index),1)) = [];

filtered_data = zeros(3,length(RFoot_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RFoot_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

%% RToeBase Coordinates and Quaternians
ref = ref+7;
seg_names_id = seg_names_id + 1;
RToeBase_raw = cell(7,length(C{1}));
for ii = 1:6
    for jj = ref:ref+6
        RToeBase_raw(jj,:) = C{1,jj}';
    end
    RToeBase_raw = RToeBase_raw(ref:ref+6,:);
    RToeBase_index = str2double(RToeBase_raw);
end
RToeBase_index(:,any(isnan(RToeBase_index),1)) = [];

filtered_data = zeros(3,length(RToeBase_index));
for jj = 1:3 %ref to x, y, z dim
    [select_dim] =          butterLowZero(order, cutoff, frame_rate, RToeBase_index(jj,:));
    filtered_data(jj,:) =   select_dim;
end
skeleton_mar_dim_frame(seg_names_id,:,:) = filtered_data;

end