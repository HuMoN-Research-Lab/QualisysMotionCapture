function[angles,helicang] = rev_cardan(s1neut,s2neut,s1mov,s2mov,sequence)
% function[angles,helicang]=cardan(s1neut,s2neut,s1mov,s2mov,sequence)
% Description:	This program calculates the intersegmental motion expressed 
%               in terms of Cardan angles (joint coordinate system) and helical
%               angles (Woltring, 1994) between two segments.
% Input:	s1neut:   markers of segment 1 in anatomical position
%           s2neut:   markers of segment 2 in anatomical position
%           s1mov:    markers of segment 1 during the movement 
%           s2mov:    markers of segment 2 during the movement   
%           sequence: string e.g. 'xyz' would mean:
%                         - first rotation about x-axis of segment 1
%                         - y is floating axis
%                         - last rotation about z-axis of segment 2
%		Note that segment 1 and 2 may contain a redundant number of 
%		markers (>3).
% Output:	angles: amount of rotation about x,y,z axes (alpha,beta,gamma)
%		helicangles: helical angles (Woltring, 1994)
% Author:	Christoph Reinschmidt, HPL, The University of Calgary
% Date:		November, 1995
% Last Changes: November 28, 1996
% Version:	1.0
% References:	
%       (1) Grood, E.W., and Suntay, W.J. (1983) A joint coordinate 
%		    system for the clinical description of three-dimensional 
%		    motions: applications to the knee. 
%		    J. biomech. Engng 105, 136-144.
%		(2) Woltring, H.J. (1994) 3-D attitude representation of 
%           human joints: A standardization proposal, J. Biomechanics 27, 1399-1414.

[a1,b1]=size(s1mov);
[a2,b2]=size(s2mov);
[c1,d1]=size(s1neut);
[c2,d2]=size(s2neut);

%Are the matrices of interest the same size?
if ~((a1==a2) && (a1==c1) || (a2 == c2))
 disp('The matrices of the segments do not agree! Try again!'); return
end

for ii = 1:length(s1mov) %perform task for all frames
  % Calculating the Cardan angles
  %Combine neut and mov matrix together, * against other marker and A/b (')
%     pI =    [s2mov(:,ii) s2neut];
%     pIa =   soder(pI);
%     
%     pII =   [s1mov(:,ii) s1neut];
%     pIIa =  soder(pII);
    
    %input 1 (soder([s2mov(i,:);s2neut])); input 2
    %(soder([s1mov(i,:);s1neut])
    T1a = (rev_soder([s2mov(:,ii) s2neut])) * rev_soder([s1mov(:,ii) s1neut]);
%     T1a = (pIa) * pIIa;
    T1 = inv(T1a);
    
    eval(['angles(i,:)=r' sequence 'solv(T1);']);
    
    % Woltring's (1994) helical convention (helical angles)
    [n1,point1,phi1,t1] = screw(T1);
    
    helicang(ii,1:3) = n1(1:3,1)'.*phi1;
end
