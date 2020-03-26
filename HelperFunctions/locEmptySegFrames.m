function [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ)
%evalSegFrames find the location of the empty cells in a cell array

%% headCenter cell array evals
[row,col] = find(isnan(segCenter.headCenter_mar_dim_frame));
emptyFrames.headCenter = [col];
if emptyFrames.headCenter ~= 0
    disp('headCenter is missing data!');
end

%% ShoulderCenter cell array evals
[row,col] = find(isnan(segCenter.LShoulderCenter_mar_dim_frame));
emptyFrames.LShoulderCenter = [col];
if emptyFrames.LShoulderCenter ~= 0
    disp('LShoulderCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RShoulderCenter_mar_dim_frame));
emptyFrames.RShoulderCenter = [col];
if emptyFrames.RShoulderCenter ~= 0
    disp('RShoulderCenter is missing data!');
end

%% chestCenter cell array evals
[row,col] = find(isnan(segCenter.chestCenter_mar_dim_frame));
emptyFrames.chestCenter = [col];
if emptyFrames.chestCenter ~= 0
    disp('chestCenter is missing data!');
end

%% UpperArmCenter cell array evals
[row,col] = find(isnan(segCenter.LUpperArmCenter_mar_dim_frame));
emptyFrames.LUpperArmCenter = [col];
if emptyFrames.LUpperArmCenter ~= 0
    disp('LUpperArmCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RUpperArmCenter_mar_dim_frame));
emptyFrames.RUpperArmCenter = [col];
if emptyFrames.RUpperArmCenter ~= 0
    disp('RUpperArmCenter is missing data!');
end

%% ForearmCenter cell array evals
[row,col] = find(isnan(segCenter.LForearmCenter_mar_dim_frame));
emptyFrames.LForearmCenter = [col];
if emptyFrames.LForearmCenter ~= 0
    disp('LForearmCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RForearmCenter_mar_dim_frame));
emptyFrames.RForearmCenter = [col];
if emptyFrames.RForearmCenter ~= 0
    disp('RForearmCenter is missing data!');
end

%% HandCenter cell array evals
[row,col] = find(isnan(segCenter.LHandCenter_mar_dim_frame));
emptyFrames.LHandCenter = [col];
if emptyFrames.LHandCenter ~= 0
    disp('LHandCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RHandCenter_mar_dim_frame));
emptyFrames.RHandCenter = [col];
if emptyFrames.RHandCenter ~= 0
    disp('RHandCenter is missing data!');
end

%% hipCenter cell array evals
[row,col] = find(isnan(segCenter.hipCenter_mar_dim_frame));
emptyFrames.hipCenter = [col];
if emptyFrames.hipCenter ~= 0
    disp('hipCenter is missing data!');
end

%% ThighCenter cell array evals
[row,col] = find(isnan(segCenter.LThighCenter_mar_dim_frame));
emptyFrames.LThighCenter = [col];
if emptyFrames.LThighCenter ~= 0
    disp('LThighCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RThighCenter_mar_dim_frame));
emptyFrames.RThighCenter = [col];
if emptyFrames.RThighCenter ~= 0
    disp('RThighCenter is missing data!');
end

%% LegCenter cell array evals
[row,col] = find(isnan(segCenter.LLegCenter_mar_dim_frame));
emptyFrames.LLegCenter = [col];
if emptyFrames.LLegCenter ~= 0
    disp('LLegCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RLegCenter_mar_dim_frame));
emptyFrames.RLegCenter = [col];
if emptyFrames.RLegCenter ~= 0
    disp('RLegCenter is missing data!');
end

%% FootCenter cell array evals
[row,col] = find(isnan(segCenter.LFootCenter_mar_dim_frame));
emptyFrames.LFootCenter = [col];
if emptyFrames.LFootCenter ~= 0
    disp('LFootCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RFootCenter_mar_dim_frame));
emptyFrames.RFootCenter = [col];
if emptyFrames.RFootCenter ~= 0
    disp('RFootCenter is missing data!');
end

%% TotalCOMXYZ cell array evals
[row,col] = find(isnan(totalCOMXYZ));
emptyFrames.totalCOMXYZ = [col];

%assert(emptyFrames.totalCOMXYZ ~= 0,'TotalCOMXYZ is missing data!')
if emptyFrames.totalCOMXYZ ~= 0
    fprintf('TotalCOMXYZ is missing data!\n');
end

end

