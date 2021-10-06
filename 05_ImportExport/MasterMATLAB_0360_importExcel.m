%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Import and export Excel-format data
% Instructor: mikexcohen.com
%
%%

% list data folder and file
dataFolder = 'C:\Users\asus\Desktop\MATLAB COHEN\05_ImportExport\';
dataFile   = 'sensordata.xlsx';

% import data file using xlsread
% always work with rawData
[numData, txtData, rawData] = xlsread([dataFolder dataFile]);

% check sizes and outputs
whos 


%% extract key data

% starting line
startline = find(strcmpi(rawData(:,1),'Start data'));

% get list of sensor IDs
sensorID = cell2mat( rawData(startline+1:end-1, 2) );

% get list of time points
timepoints = cell2mat( rawData(startline+1:end-1, 4) );

% now get all of the data
datatemp = cell2mat( rawData(startline+1:end-1, 6) );

% a list of unique sensor numbers would also be useful
uchans = unique(sensorID);
utimes = unique(timepoints);

% initialize data matrix
datamat = nan( length(uchans),length(utimes) );

%% populate and plot

% populate one line at a time
for linei=1:length(sensorID)
    
    % line-specific channel and time point
    datamat(sensorID(linei),timepoints(linei)) = datatemp(linei);
end

% plot
figure(1), clf
plot(datamat','s-','markerfacecolor','w','linewidth',1.2)


%% bonus: identify missing data

% find where datamat is nan
% output is a number, e.g. 149
% you need to convert this number to valid indices with ind2sub
missingdata = find(isnan(datamat));

% loop over all missing time points
for i=1:length(missingdata)
    
    % convert index to subscript to find channel/time point
    [missChan, missTime] = ind2sub(size(datamat),missingdata(1));
    
    % print message
    fprintf('Channel %g timepoint %g has a missing value!\n', ...
        missChan, missTime);
end

%%
