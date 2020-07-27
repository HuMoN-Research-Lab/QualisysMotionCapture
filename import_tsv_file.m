function [skeleton] = import_tsv_file(skeleton_file)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function reads tsv file and outputs organized data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Establish output
skeleton = [];
fid = fopen(skeleton_file);
% C = ones(1,1:178);
C = textscan(fid,['%s' repmat('%s',1,178)], 'HeaderLines', 5); %178
fclose(fid);

%Misc data
skeleton_time =         C{1,1};
skeleton_frames =       C{1,2};

%% Hips Coordinates and Quaternians
% hips_raw = zeros(size(C{1,1},1),size(C{1,1},2));
% for jj = 3:8
%     for ii = 1:6
%         hips_raw(:,jj) = C{1,jj};
%     end
% end
% hips = str2double(hips_raw);
% for ii = 1:6 %ref to dim
%     for kk = 1:length(hips_raw) %ref to rows
%         hips_index = isnan(hips(kk,ii)); %hips(~
%     end
% end
% hips_index = hips(~isnan(hips));


hips_raw = C{1,3};
% hips = erase(hips,'Hips');
hips_raw(:,2) = C{1,4};
hips_raw(:,3) = C{1,5};
hips_raw(:,4) = C{1,6};
hips_raw(:,5) = C{1,7};
hips_raw(:,6) = C{1,8};
% hips_index(1:2897,1:6) = hips_raw(2:end,1:6);
% hips(1,1:5) = hips(1,2:6);
hips_index = str2double(hips_raw);

end