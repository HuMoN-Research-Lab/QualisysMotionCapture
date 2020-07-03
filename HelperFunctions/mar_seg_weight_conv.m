function [LHipFront_mod,LHipBack_mod,LThigh_mod] = mar_seg_weight_conv(LHipFront,...
    LHipBack,LThigh,LHipFront_weight,LHipBack_weight,LThigh_weight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Modify marker & segCenter locations depending on respective weight
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Apply weights to marker and segCenter locations
sumWeight = LHipFront_weight + LHipBack_weight + LThigh_weight;
if sumWeight <= 1
    for ii = 1:3
        LHipFront_mod(ii,:) = LHipFront(ii,:) .* LHipFront_weight;
        LHipBack_mod(ii,:) = LHipBack(ii,:) .* LHipBack_weight;
        LThigh_mod(ii,:) =      LThigh(ii,:) .* LThigh_weight;
    end
else
    assert(sumWeight > 1,'Sum of the weights is greater than 1!')
end

end