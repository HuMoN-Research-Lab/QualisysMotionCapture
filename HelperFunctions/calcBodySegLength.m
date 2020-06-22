function [bodySegLength] = calcBodySegLength(marker_mar_dim_frame,markerLabels,segCenter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calcs length of body segments based on location of markers(mm)
%Example 3.3 of page 377 of Research Methods in Biomechanics (2014)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calc length of thigh with hip and knee as references (preliminary units in mm)
hip_loc =               segCenter.hipCenter_mar_dim_frame(2:3,:);
LKnee_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');
LKnee_loc =             LKnee_loc_unfil(2:3,:); %acquire solely M/L and A/P position

RKnee_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');
RKnee_loc =             RKnee_loc_unfil(2:3,:); %acquire solely M/L and A/P position

LThigh_length_raw =             sqrt((LKnee_loc(1,:) - hip_loc(1,:)).^2 + (LKnee_loc(2,:) - hip_loc(2,:)).^2);
bodySegLength.LThigh_length =   mean(LThigh_length_raw)*10^-3; %converts units from mm to m
RThigh_length_raw =             sqrt((RKnee_loc(1,:) - hip_loc(1,:)).^2 + (RKnee_loc(2,:) - hip_loc(2,:)).^2);
bodySegLength.RThigh_length =   mean(RThigh_length_raw)*10^-3; %converts units from mm to m

%% Calc length of shank with knee and ankle as references (preliminary units in mm)
LAnkle_loc_unfil =      getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');
LAnkle_loc =            LAnkle_loc_unfil(2:3,:); %acquire solely M/L and A/P position

RAnkle_loc_unfil =      getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');
RAnkle_loc =            RAnkle_loc_unfil(2:3,:); %acquire solely M/L and A/P position

LShank_length_raw =             sqrt((LAnkle_loc(1,:) - LKnee_loc(1,:)).^2 + (LAnkle_loc(2,:) - LKnee_loc(2,:)).^2);
bodySegLength.LShank_length =   mean(LShank_length_raw)*10^-3; %converts units from mm to m
RShank_length_raw =             sqrt((RAnkle_loc(1,:) - RKnee_loc(1,:)).^2 + (RAnkle_loc(2,:) - RKnee_loc(2,:)).^2);
bodySegLength.RShank_length =   mean(RShank_length_raw)*10^-3; %converts units from mm to m

%% Calc length of foot with ankle and foot as references (preliminary units in mm)
LFoot_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LFoot_loc =             LFoot_loc_unfil(2:3,:); %acquire solely M/L and A/P position

RFoot_loc_unfil =       getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RFoot_loc =             RFoot_loc_unfil(2:3,:); %acquire solely M/L and A/P position

LFoot_length_raw =              sqrt((LFoot_loc(1,:) - LAnkle_loc(1,:)).^2 + (LFoot_loc(2,:) - LAnkle_loc(2,:)).^2);
bodySegLength.LFoot_length =    mean(LFoot_length_raw); %converts units from mm to m
RFoot_length_raw =              sqrt((RFoot_loc(1,:) - RAnkle_loc(1,:)).^2 + (RFoot_loc(2,:) - RAnkle_loc(2,:)).^2);
bodySegLength.RFoot_length =    mean(RFoot_length_raw); %converts units from mm to m


%% Thigh, leg, and foot proximal length
bodySegLength.LThigh_proxlength =      bodySegLength.LThigh_length .* 0.433;
bodySegLength.RThigh_proxlength =      bodySegLength.RThigh_length .* 0.433;
bodySegLength.LShank_proxlength =      bodySegLength.LShank_length .* 0.433;
bodySegLength.RShank_proxlength =      bodySegLength.RShank_length .* 0.433;
bodySegLength.LFoot_proxlength =       bodySegLength.LFoot_length .* 0.500;
bodySegLength.RFoot_proxlength =       bodySegLength.RFoot_length .* 0.500;


end