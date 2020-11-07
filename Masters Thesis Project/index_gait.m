function [LFoot_gait,RFoot_gait] = index_gait(LFoot,RFoot)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Index start and end of gait cycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial Conditions
LFoot_vely = LFoot.marVely;
RFoot_vely = RFoot.marVely;

%% Stance estimates
LFoot_stance = LFoot_vely >= 0.5;
RFoot_stance = RFoot_vely >= 0.5;



end
