function [momInertia] = calcMomentOfInertia(bodySegWeight,bodySegLength,radGyra)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcMomentOfInertia calcs moment of inertia for body seg
%Parameters from Dempsters Body Segment Parameters
%Page 72 from Research Methods in Biomechanics by Gordon and Robertson
%(2014)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initial conditions
momInertia = [];

%% Calc Thigh Proximal Moment of Inertia
momInertia_LThighCOG =  bodySegWeight.thighMass .* (radGyra.LThighCOG)^2;
momInertia_RThighCOG =  bodySegWeight.thighMass .* (radGyra.RThighCOG)^2;
momInertia.LThighProx = momInertia_LThighCOG + ...
                        bodySegWeight.thighMass .* (bodySegLength.LThigh_proxlength)^2;
momInertia.RThighProx = momInertia_RThighCOG + ...
                        bodySegWeight.thighMass .* (bodySegLength.RThigh_proxlength)^2;

%% Calc Leg Proximal Moment of Inertia
momInertia_LLegCOG =    bodySegWeight.legMass .* (radGyra.LLegCOG)^2;
momInertia_RLegCOG =    bodySegWeight.legMass .* (radGyra.RLegCOG)^2;
momInertia.LLegProx =   momInertia_LLegCOG + ...
                        bodySegWeight.legMass .* (bodySegLength.LShank_proxlength)^2;
momInertia.RLegProx =   momInertia_RLegCOG + ...
                        bodySegWeight.legMass .* (bodySegLength.RShank_proxlength)^2;

%% Calc Foot Proximal Moment of Inertia
momInertia_LFootCOG =   bodySegWeight.footMass .* (radGyra.LFootCOG)^2;
momInertia_RFootCOG =   bodySegWeight.footMass .* (radGyra.RFootCOG)^2;
momInertia.LFootProx =  momInertia_LFootCOG + ...
                        bodySegWeight.footMass .* (bodySegLength.LFoot_proxlength)^2;
momInertia.RFootProx =  momInertia_RFootCOG + ...
                        bodySegWeight.footMass .* (bodySegLength.RFoot_proxlength)^2;

end