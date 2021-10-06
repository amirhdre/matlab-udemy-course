%% 
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Command statements
%      VIDEO: Create an upper-triangular matrix
% Instructor: mikexcohen.com
%
%%

% size of square matrix
m = 70;

% initialize matrix
outmat = zeros(m);
outmat2 = zeros(m);

% loop over rows and columns
for i=1:m
    for j=1:m
        
        % test whether row index is less than column index
        if i<j
            outmat(i,j) = 1.03^sqrt(i*j);
        else
            outmat2(i,j) = 1.03^m - 1.03^sqrt(i*j);
        end
            
    end
end

outmat2 = outmat2 + outmat;

figure(1), clf
subplot(121)
imagesc(outmat)
axis square, title('Upper-triangular matrix')
set(gca,'xtick',[],'ytick',[],'clim',[0 1.03^m])

subplot(122)
imagesc(outmat2)
axis square, title('Full Matrix')
set(gca,'xtick',[],'ytick',[],'clim',[0 1.03^m])

%%
