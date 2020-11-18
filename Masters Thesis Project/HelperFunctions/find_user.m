function [mm_height,kg_mass] = find_user(userProfile,userName)
%userProfile finds corresponding height and weight of user from file

data = userProfile(userName,:);
mm_height = data.(1);
kg_mass = data.(2);

end