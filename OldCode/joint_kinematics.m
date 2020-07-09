function joint_kinematics(marker_mar_dim_frame,segCenter,bodySegWeight,markerLabels,...
    LFoot,RFoot,LLeg,RLeg,LThigh,RThigh,hip)

%% Force evaluation at ankle joint
%Sum of forces in medio-lateral direction
%SumFx = Anklex = mass(foot)*accx(foot)
forceLAnkle =   (bodySegWeight.footMass)*LFoot.marAccx;
sum_FxLAnkle =  forceLAnkle;
LAnklePos =     getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');
pos_AnkleCOM_rel_FootCOM = LAnklePos - LFoot.marPos;

forceRAnkle =   (bodySegWeight.footmass)*RFoot.marAccx;
sum_FxLAnkle =  forceRAnkle;

end