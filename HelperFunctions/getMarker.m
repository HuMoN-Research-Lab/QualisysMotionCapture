function [markerXYZ] = getMarker(marker_mar_dim_frame,markerLabels,markerID)
%getMarker pulls out individual marker from marker matrix based on ID

markerXYZ = squeeze(marker_mar_dim_frame(~cellfun(@isempty, strfind(markerLabels,markerID)),1:3,:));

end