%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Command statements
%      VIDEO: Day of the week
% Instructor: mikexcohen.com
%
%%

% "A" is the year
A = 2018;

% here's the formula
day1Jan = mod(1+5*mod(A-1,4)+4*mod(A-1,100)+6*mod(A-1,400),7);

% match that with the correct string
switch day1Jan
    case 0, day = 'Sunday';
    case 1, day = 'Monday';
    case 2, day = 'Tuesday';
    case 3, day = 'Wedensday';
    case 4, day = 'Thursday';
    case 5, day = 'Friday';
    case 6, day = 'Saturday';
end

% find this year
thisYear = clock;
thisYear = thisYear(1);

% print the information using appropriate grammar!
if A > thisYear
    fprintf('  1 January %g will be a %s\n',A,day);
else
    fprintf('  1 January %g was a %s\n',A,day);
end


% bonus: avoid the switch-case!

%%
