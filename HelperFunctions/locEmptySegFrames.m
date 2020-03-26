function [segEval,emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ,numFrames)
%evalSegFrames find the location of the empty cells in a cell array

%% headCenter cell array evals
[row,col] = find(isnan(segCenter.headCenter_mar_dim_frame));
segEval.headCenter = [col];
if segEval.headCenter ~= 0
    disp('headCenter is missing data!');
end

%% ShoulderCenter cell array evals
[row,col] = find(isnan(segCenter.LShoulderCenter_mar_dim_frame));
segEval.LShoulderCenter = [col];
if segEval.LShoulderCenter ~= 0
    disp('LShoulderCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RShoulderCenter_mar_dim_frame));
segEval.RShoulderCenter = [col];
if segEval.RShoulderCenter ~= 0
    disp('RShoulderCenter is missing data!');
end

%% chestCenter cell array evals
[row,col] = find(isnan(segCenter.chestCenter_mar_dim_frame));
segEval.chestCenter = [col];
if segEval.chestCenter ~= 0
    disp('chestCenter is missing data!');
end

%% UpperArmCenter cell array evals
[row,col] = find(isnan(segCenter.LUpperArmCenter_mar_dim_frame));
segEval.LUpperArmCenter = [col];
if segEval.LUpperArmCenter ~= 0
    disp('LUpperArmCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RUpperArmCenter_mar_dim_frame));
segEval.RUpperArmCenter = [col];
if segEval.RUpperArmCenter ~= 0
    disp('RUpperArmCenter is missing data!');
end

%% ForearmCenter cell array evals
[row,col] = find(isnan(segCenter.LForearmCenter_mar_dim_frame));
segEval.LForearmCenter = [col];
if segEval.LForearmCenter ~= 0
    disp('LForearmCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RForearmCenter_mar_dim_frame));
segEval.RForearmCenter = [col];
if segEval.RForearmCenter ~= 0
    disp('RForearmCenter is missing data!');
end

%% HandCenter cell array evals
[row,col] = find(isnan(segCenter.LHandCenter_mar_dim_frame));
segEval.LHandCenter = [col];
if segEval.LHandCenter ~= 0
    disp('LHandCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RHandCenter_mar_dim_frame));
segEval.RHandCenter = [col];
if segEval.RHandCenter ~= 0
    disp('RHandCenter is missing data!');
end

%% hipCenter cell array evals
[row,col] = find(isnan(segCenter.hipCenter_mar_dim_frame));
segEval.hipCenter = [col];
if segEval.hipCenter ~= 0
    disp('hipCenter is missing data!');
end

%% ThighCenter cell array evals
[row,col] = find(isnan(segCenter.LThighCenter_mar_dim_frame));
segEval.LThighCenter = [col];
if segEval.LThighCenter ~= 0
    disp('LThighCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RThighCenter_mar_dim_frame));
segEval.RThighCenter = [col];
if segEval.RThighCenter ~= 0
    disp('RThighCenter is missing data!');
end

%% LegCenter cell array evals
[row,col] = find(isnan(segCenter.LLegCenter_mar_dim_frame));
segEval.LLegCenter = [col];
if segEval.LLegCenter ~= 0
    disp('LLegCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RLegCenter_mar_dim_frame));
segEval.RLegCenter = [col];
if segEval.RLegCenter ~= 0
    disp('RLegCenter is missing data!');
end

%% FootCenter cell array evals
[row,col] = find(isnan(segCenter.LFootCenter_mar_dim_frame));
segEval.LFootCenter = [col];
if segEval.LFootCenter ~= 0
    disp('LFootCenter is missing data!');
end

[row,col] = find(isnan(segCenter.RFootCenter_mar_dim_frame));
segEval.RFootCenter = [col];
if segEval.RFootCenter ~= 0
    disp('RFootCenter is missing data!');
end

%% TotalCOMXYZ cell array evals
[row,col] = find(isnan(totalCOMXYZ));
segEval.totalCOMXYZ = [col];

%assert(segEval.totalCOMXYZ ~= 0,'TotalCOMXYZ is missing data!')
if segEval.totalCOMXYZ ~= 0
    fprintf('TotalCOMXYZ is missing data!\n');
end

%% Compare TotalCOMXYZ eval to Individual Seg evals

%if segEval.totalCOMXYZ == segEval.headCenter:segEval.RFootCenter

% if segEval.totalCOMXYZ == segEval.headCenter
%     fprintf('headCenter is impacting TotalCOMXYZ results\n')
% end

% % % if segEval.totalCOMXYZ == segEval.chestCenter
% % %     fprintf('chestCenter is impacting TotalCOMXYZ results\n')
% % % end


% emptyCells = cellfun(@isempty,totalCOMXYZ);
% 
% find(cell2mat(cellfun(@(x)any(isnan(x)),totalCOMXYZ,'UniformOutput',false)))

% %Indexing empty cell arrays
% index = cellfun(@isempty,totalCOMXYZ,'uni',false);
% index = cellfun(@any,index);



end

