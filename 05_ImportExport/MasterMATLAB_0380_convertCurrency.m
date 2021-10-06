%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Importing and exporting data
%      VIDEO: Convert US$ to Euros using up-to-date info
% Instructor: mikexcohen.com
%
%%

% read data from a website
htmldata = urlread('https://transferwise.com/gb/currency-converter/usd-to-eur-rate?amount=1');

% the data is the entire html file;
% we need to find the right spot
startplace = strfind(htmldata,'data-rate="EUR"');

% then convert the conversion factor into a number
us2euro = 

% now use that value to convert
numCurr = 50;
fprintf('US$%g = %g Euros; ',
fprintf('%g Euros = US$%g.\n',

%% note

% urlread cannot import from sites that have certain security features, e.g.:
urlread('https://www.udemy.com/user/mike-x-cohen/');

% you could use a system url read, e.g., curl on linux

%%
