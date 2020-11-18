function [empty_frames] = loc_empty_seg_frames(seg_center,total_body_COMXYZ)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%evalSegFrames find the location of the empty cells in a cell array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% headCenter cell array evals
[row,col] = find(isnan(seg_center.headCenter_mar_dim_frame));
empty_frames.headCenter = [col];
if empty_frames.headCenter ~= 0
    disp('headCenter is missing data!');
end

%% ShoulderCenter cell array evals
[row,col] = find(isnan(seg_center.LShoulderCenter_mar_dim_frame));
empty_frames.LShoulderCenter = [col];
if empty_frames.LShoulderCenter ~= 0
    disp('LShoulderCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RShoulderCenter_mar_dim_frame));
empty_frames.RShoulderCenter = [col];
if empty_frames.RShoulderCenter ~= 0
    disp('RShoulderCenter is missing data!');
end

%% chestCenter cell array evals
[row,col] = find(isnan(seg_center.chestCenter_mar_dim_frame));
empty_frames.chestCenter = [col];
if empty_frames.chestCenter ~= 0
    disp('chestCenter is missing data!');
end

%% UpperArmCenter cell array evals
[row,col] = find(isnan(seg_center.LUpperArmCenter_mar_dim_frame));
empty_frames.LUpperArmCenter = [col];
if empty_frames.LUpperArmCenter ~= 0
    disp('LUpperArmCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RUpperArmCenter_mar_dim_frame));
empty_frames.RUpperArmCenter = [col];
if empty_frames.RUpperArmCenter ~= 0
    disp('RUpperArmCenter is missing data!');
end

%% ForearmCenter cell array evals
[row,col] = find(isnan(seg_center.LForearmCenter_mar_dim_frame));
empty_frames.LForearmCenter = [col];
if empty_frames.LForearmCenter ~= 0
    disp('LForearmCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RForearmCenter_mar_dim_frame));
empty_frames.RForearmCenter = [col];
if empty_frames.RForearmCenter ~= 0
    disp('RForearmCenter is missing data!');
end

%% HandCenter cell array evals
[row,col] = find(isnan(seg_center.LHandCenter_mar_dim_frame));
empty_frames.LHandCenter = [col];
if empty_frames.LHandCenter ~= 0
    disp('LHandCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RHandCenter_mar_dim_frame));
empty_frames.RHandCenter = [col];
if empty_frames.RHandCenter ~= 0
    disp('RHandCenter is missing data!');
end

%% hipCenter cell array evals
[row,col] = find(isnan(seg_center.hipCenter_mar_dim_frame));
empty_frames.hipCenter = [col];
if empty_frames.hipCenter ~= 0
    disp('hipCenter is missing data!');
end

%% ThighCenter cell array evals
[row,col] = find(isnan(seg_center.LThighCenter_mar_dim_frame));
empty_frames.LThighCenter = [col];
if empty_frames.LThighCenter ~= 0
    disp('LThighCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RThighCenter_mar_dim_frame));
empty_frames.RThighCenter = [col];
if empty_frames.RThighCenter ~= 0
    disp('RThighCenter is missing data!');
end

%% LegCenter cell array evals
[row,col] = find(isnan(seg_center.LLegCenter_mar_dim_frame));
empty_frames.LLegCenter = [col];
if empty_frames.LLegCenter ~= 0
    disp('LLegCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RLegCenter_mar_dim_frame));
empty_frames.RLegCenter = [col];
if empty_frames.RLegCenter ~= 0
    disp('RLegCenter is missing data!');
end

%% FootCenter cell array evals
[row,col] = find(isnan(seg_center.LFootCenter_mar_dim_frame));
empty_frames.LFootCenter = [col];
if empty_frames.LFootCenter ~= 0
    disp('LFootCenter is missing data!');
end

[row,col] = find(isnan(seg_center.RFootCenter_mar_dim_frame));
empty_frames.RFootCenter = [col];
if empty_frames.RFootCenter ~= 0
    disp('RFootCenter is missing data!');
end

%% TotalCOMXYZ cell array evals
[row,col] = find(isnan(total_body_COMXYZ));
empty_frames.totalCOMXYZ = [col];

%assert(emptyFrames.totalCOMXYZ ~= 0,'TotalCOMXYZ is missing data!')
if empty_frames.totalCOMXYZ ~= 0
    fprintf('TotalCOMXYZ is missing data!\n');
end

end

