function [patchHandle, lineHandle] = shadedErrorBar(xvals, yvals, err)
%% takes in x-values, y-values, and error values, plots a shaded error bar graph and then spits out handles to the patch and line for later manipulation. Should work mostly similar to 'errorbar.m'

if nargin == 2 %user didn't provide xvalues
    err = yvals;
    yvals = xvals;
    xvals = 1:length(yvals);
end


upperBoundData = yvals+err;
lowerBoundData = yvals-err;


patchX = [xvals fliplr(xvals)]; %the 'flipLR' is necessary for it to draw the patch correctly. It's a connect-the-dots situation 
patchY = [upperBoundData fliplr(lowerBoundData)];

patchHandle = patch(patchX,patchY,'r');
patchHandle.FaceAlpha = .5; %define opacity of the shaded region (Alpha = 0 means transparent)


hold on
lineHandle = plot(xvals,yvals,'-','Color','r','LineWidth',2);
hold on
