function [segEvals,impactedTotalCOM] = evalSegFrames(segCenter,totalCOMXYZ,numFrames)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%evalSegFrames evaluates which cells are impacting totalCOMXYZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Locate Head tracker empty frames
segEvals.head = ismissing(segCenter.headCenter_mar_dim_frame);

%% Locate LShoulder tracker empty frames
segEvals.LShoulder = ismissing(segCenter.LShoulderCenter_mar_dim_frame);

%% Locate RShoulder tracker empty frames
segEvals.RShoulder = ismissing(segCenter.RShoulderCenter_mar_dim_frame);

%% Locate Chest tracker empty frames
segEvals.chest = ismissing(segCenter.chestCenter_mar_dim_frame);

%% Locate LUpperArm tracker empty frames
segEvals.LUpperArm = ismissing(segCenter.LUpperArmCenter_mar_dim_frame);

%% Locate RUpperArm tracker empty frames
segEvals.RUpperArm = ismissing(segCenter.RUpperArmCenter_mar_dim_frame);

%% Locate LForearm tracker empty frames
segEvals.LForearm = ismissing(segCenter.LForearmCenter_mar_dim_frame);

%% Locate RForearm tracker empty frames
segEvals.RForearm = ismissing(segCenter.RForearmCenter_mar_dim_frame);

%% Locate LHand tracker empty frames
segEvals.LHand = ismissing(segCenter.LHandCenter_mar_dim_frame);

%% Locate RHand tracker empty frames
segEvals.RHand = ismissing(segCenter.RHandCenter_mar_dim_frame);

%% Locate Hip tracker empty frames
segEvals.hip = ismissing(segCenter.hipCenter_mar_dim_frame);

%% Locate LThigh tracker empty frames
segEvals.LThigh = ismissing(segCenter.LThighCenter_mar_dim_frame);

%% Locate RThigh tracker empty frames
segEvals.RThigh = ismissing(segCenter.RThighCenter_mar_dim_frame);

%% Locate LLeg tracker empty frames
segEvals.LLeg = ismissing(segCenter.LLegCenter_mar_dim_frame);

%% Locate RLeg tracker empty frames
segEvals.RLeg = ismissing(segCenter.RLegCenter_mar_dim_frame);

%% Locate LFoot tracker empty frames
segEvals.LFoot = ismissing(segCenter.LFootCenter_mar_dim_frame);

%% Locate RFoot tracker empty frames
segEvals.RFoot = ismissing(segCenter.RFootCenter_mar_dim_frame);

%% Locate TotalCOMXYZ tracker empty frames
segEvals.totalCOMXYZ = ismissing(totalCOMXYZ);

%% segEvals
impactedTotalCOM.chest = cell(1,numFrames);

for a = 1:numFrames
    if segEvals.totalCOMXYZ(a) == segEvals.chest(a)
        %if totalCOMXYZ is being impacted by chest
        %Find cells that are the same and tell me
        %Compare the frames and disregard other totalCOMXYZ frames that
        %are not effected
        %impactedTotalCOM.chest should give me the 
        
        impactedTotalCOM.chest = segEvals.chest(a);
        %impactedTotalCOM.chest(1,a) = cell(segEvals.totalCOMXYZ(a) == segEvals.chest(a)); %numFrames(a);
        
        %output should tell me which frames are impacting results
        %fprintf('\nchestCenter is impacting TotalCOMXYZ frame\n Frame: %d\n',a);
       % headStorage(:) = a;
    end
    
    %comparedFrames.chest{a} = currentFrame;
end





%% Compare TotalCOMXYZ eval to Individual Seg evals

%if emptyFrames.totalCOMXYZ == emptyFrames.headCenter:emptyFrames.RFootCenter

% if emptyFrames.totalCOMXYZ == emptyFrames.headCenter
%     fprintf('headCenter is impacting TotalCOMXYZ results\n')
% end

% % % if emptyFrames.totalCOMXYZ == emptyFrames.chestCenter
% % %     fprintf('chestCenter is impacting TotalCOMXYZ results\n')
% % % end


% emptyCells = cellfun(@isempty,totalCOMXYZ);
% 
% find(cell2mat(cellfun(@(x)any(isnan(x)),totalCOMXYZ,'UniformOutput',false)))

% %Indexing empty cell arrays
% index = cellfun(@isempty,totalCOMXYZ,'uni',false);
% index = cellfun(@any,index);


