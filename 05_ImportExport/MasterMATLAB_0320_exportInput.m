%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Export and import multiple files
% Instructor: mikexcohen.com
%
%%


basefilename = 'testfile';
numfiles = 10;

% loop over all files
for filei = 1:numfiles
    
    % create string with name of file
    filename = [basefilename num2str(filei) '.mat'];
    
    % skip this iteration of the loop if the file exists
    if exist(filename,'file')
        fprintf('file %s exists.\n',filename);
        continue;
    end
    
    % generate some random data
    randomdata = randn(100);
    
    % write to output file (MATLAB .mat format)
    save(filename, 'randomdata')
end
    




%% an aside on the continue function

for i=1:10
    
    % skip this iteration if i is even
    if mod(i,2)==0, continue, end
    
    % print the number
    disp([ 'Iteration ' num2str(i) ])
end





%% now for importing data

% use wild-card (*) to find the files to import
files2import = dir('testfile*.mat');

% initialize as cell array - allDataCell
allDataC = cell(1,length(files2import));

% loop over file names
for filei=1:length(files2import)
    
    % import and store data
    load(files2import(filei).name); % loads randomdata varaiable to workspace 
    allDataC{1,filei} = randomdata;
    
    % for matrix storage, initialize on first iteration
    if filei == 1
        allDataM = zeros(length(files2import), size(randomdata,1), size(randomdata,2));
    end
        
    % and now populate the big matrix
    allDataM(filei,:,:) = randomdata;
    
end

%%

