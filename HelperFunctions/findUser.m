function [mmHeight,kgMass] = findUser(userProfile,userName)
%userProfile finds corresponding height and weight of user from file

data = userProfile(userName,:);
mmHeight = data.(1);
kgMass = data.(2);

end