function [momInertia] = calcMomentOfInertia(radGyra,bodySegWeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcMomentOfInertia calcs moment of inertia for body seg
%Parameters from Dempsters Body Segment Parameters
%Page 72 from Research Methods in Biomechanics by Gordon and Robertson
%(2014)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
momInertia = [];

%% Calc Thigh Moment of Inertia
momInertia.LThigh = bodySegWeight.thighMass .* (radGyra.LThighCOG)^2;
momInertia.RThigh = bodySegWeight.thighMass .* (radGyra.RThighCOG)^2;

momInertia.LLeg =   bodySegWeight.legMass .* (radGyra.LLegCOG)^2;
momInertia.RLeg =   bodySegWeight.legMass .* (radGyra.RLegCOG)^2;

momInertia.LFoot =   bodySegWeight.footMass .* (radGyra.LFootCOG)^2;
momInertia.RFoot =   bodySegWeight.footMass .* (radGyra.RFootCOG)^2;


end