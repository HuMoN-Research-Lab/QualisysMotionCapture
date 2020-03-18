function [height,weight] = findUser(userProfileDoc,userName)
%userProfile finds corresponding height and weight of user from file

userParameters = readcell([userProfileDoc '.xlsx']);

%strfind(userParameters,userName)
%Searches for height and weight depending on user name


end

