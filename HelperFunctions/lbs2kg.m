function [kgWeight] = lbs2kg(lbsWeight)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function converts lbs mass to kg mass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%input test subjects mass weight in lbs
% lbsWeight = totalWeight;
kgWeight = 0.453592 * lbsWeight;

%%Potentially unnecessary due to naming convention of code
% %Needs more work to incorporate code
% if mass_kg > 0;
%     totalMass = mass_kg;
% elseif mass_kg = 0;
%     totalMass = lb_to_kg;
% end