%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Import formatted text file
% Instructor: mikexcohen.com
%
%%

clc, clear, close all;

% pointer to the file
fid = fopen('datafile.txt');

%% read header

% ignore first line
IgnoreFirstLine = fgetl(fid);

% second line contains number of sensors
hdr_nSensors = regexp( fgetl(fid), '\t', 'split' );
nSensors = str2double(hdr_nSensors{3});

% third line contains number of time points
hdr_ntimepoints = regexp( fgetl(fid), '\t', 'split');
nPnts = str2double(hdr_ntimepoints{3});

% move pointer ahead until "Start data"
toggle = true;
while toggle==true
    
    % get a line of data
    aline = fgetl(fid);
    
    % test whether the line begins with "Start", and flip toggle
    if strcmpi(aline(1:5), 'Start')
        toggle=false;
    end
end

%% read data

% initialize matrix
data = zeros(nSensors, nPnts);

% set toggle and begin while loop
toggle = true;
while toggle
    
    % get a line of tab-delimited data
    aline = fgetl(fid);
    
    % check whether we're at the end of the data
    if strcmpi(aline(1:3), 'End')
        toggle = false;
    else
        aline = regexp( aline, '\t', 'split');
        sensorNumber = str2double(aline{2});
        timePoint = str2double(aline{4});
        val = str2double(aline{6});
        % put the data point into the matrix at the appropriate position
        data( sensorNumber , timePoint ) = val;
    end
    
end

% now we can plot the data
figure(1), clf
plot(data','linew',2)


% close the file
fclose(fid);