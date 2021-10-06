%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Command statements
%      VIDEO: Random count-down timer (Poisson-like)
% Instructor: mikexcohen.com
%
%%

% set threshold
thresh = exp(-10);

% initialize initial value
[currval,startval] = deal( 10 );

% decay process
decayvar = nan(100,1000);

for repi=1:100
    
    currval = startval;
    counter = 0;
    
    % stay in loop as long as needed
    while currval>thresh

        % increase counter
        counter = counter + 1;

        % update decay variable
        decayvar(repi,counter) = currval;

        % decrease target by random fraction ([0 1])
        currval = currval * rand^(1/2);

    end
end

new = zeros(1,1000);
for i=1:1000
    
    new(1,i) = mean( decayvar( isfinite(decayvar(:, 1)), i) );

end

% plot the results
figure(1), clf
plot(nanmean(new,1),'ks-','linew',2,'markersize',15,'markerfacecolor','w')
xlabel('Iterations'), ylabel('Value')
title([ num2str(counter) ' iterations until threshold' ])

%%
