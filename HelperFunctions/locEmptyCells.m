function [emptyCellLoc] = locEmptyCells(segCenter,totalCOMXYZ,numFrames)
%locEmptyCells find the location of the empty cells in a cell array

% emptyCells = cellfun(@isempty,totalCOMXYZ);
% 
% find(cell2mat(cellfun(@(x)any(isnan(x)),totalCOMXYZ,'UniformOutput',false)))

%Indexing empty cell arrays
index = cellfun(@isempty,totalCOMXYZ,'uni',false);
index = cellfun(@any,index);
Data_text(index) = [];


end

