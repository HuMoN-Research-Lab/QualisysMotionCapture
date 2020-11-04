function [data] = locMissingData(pre_filter_marker_mar_dim_frame,markerLabels,numMarkers)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Located missing data from Qualisys
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %evalSegFrames find the location of the empty cells in a cell array

% %% headCenter cell array evals
% [row,col] = find(isnan(segCenter.headCenter_mar_dim_frame));
% emptyFrames.headCenter = [col];
% if emptyFrames.headCenter ~= 0
%     disp('headCenter is missing data!');
% end


for ii = 1:numMarkers %ref to numMarkers
    select_marker =             pre_filter_marker_mar_dim_frame(ii,:,:);
    squeeze_marker =            squeeze(select_marker);
    for jj = 1:3 %ref to dim
%         select_dim =    select_marker(jj,:);
        [row,col] =             find(isnan(squeeze_marker(jj,:)));
        if isempty(col)
            col = 0;
            nans_loc_cell{jj,ii} = col;
        else
            nans_loc_cell{jj,ii} = col;
        end
    end
end
for ii = 1:length(nans_loc_cell) %ref to each col cell
    for jj = 1:3 %ref to each row cell
        if nans_loc_cell{jj,ii} > 0
            disp('Missing Data Found!')
            missingData = getMarker(pre_filter_marker_mar_dim_frame(:,:,:),markerLabels,'Jon_LeftLegCluster3');
            for kk = 1:3
                new_data(kk,:) = fillmissing(missingData(kk,:),'movmean',5);
            end
            pre_filter_marker_mar_dim_frame(49,1:3,:) = new_data;% (1:3,1:2897);
            data = pre_filter_marker_mar_dim_frame;
        else
            data = pre_filter_marker_mar_dim_frame;
        end
    end
end

% for kk = 1:numMarkers
%     first_step(1,ii) =      cellfun(@isequal,{0},nans_loc_cell(1,kk));
%     second_step(1,ii) =     ~first_step;
% end
% 
% %Convert to double
% nans_loc =              cell2mat(nans_loc_cell);
% [rows cols] =           find(nans_loc>0);
% emptyFrames_loc = [rows cols];
% for kk = 1:length(nans_loc)
%     find(~isnan(nans_loc))
% end


% marker_mar_dim_frame(ii,:,:) = filteredData;
end