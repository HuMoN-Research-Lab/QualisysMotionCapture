
% To read in a Table from a file, just pass the file path
data = readtable('VisInvis_sub1_Trjaectory.csv');

% Get a single trial. You can reference any column like a struct.
trial = data(data.Trial == 60,:);

% Because some data within a table can be a cell (i.e., string), you
%   sometimes need to use STRCMP to subset the table. This gets
%   all data from the "X" dimension.
dimension = data(strcmp(data.Dimension,'X'),:);

% Plot data from the trial above for the X dimension
plot(trial(strcmp(trial.Dimension,'X'),:).Position,...
    trial(strcmp(trial.Dimension,'X'),:).Velocity);