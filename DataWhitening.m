% define the two random variables
% -------------------------------

A = sin(linspace(0,50, 1000));              % A
B = sin(linspace(0,37, 1000)+5);            % B

figure; % figure 1
subplot(2,1,1); plot(A); title('A en fonction du temps'); 
subplot(2,1,2); plot(B); title('B en fonction du temps'); 
% figure 
figure; plot(A,B, '.'); title('Valeur de B en fonction de la valeur de A'); xlabel('Valeur de A'); ylabel('Valeur de B');  % plot the variables
set(gca, 'xlim', [-1.5 1.5], 'ylim', [-1.5 1.5]);  % redefines limits of the graph

% mix linearly these two variables
% --------------------------------
M1 = A + 0.75*B;   % mixing 1
M2 = 1.2*A + 2*B;  % mixing 2
figure; 
subplot(2,1,1); plot(M1); title('Premier mélange en fonction du temps'); % figure 
subplot(2,1,2); plot(M2); title('Second mélange en fonction du temps'); % figure 
% figure 
figure; plot(M1,M2, '.'); title('Mélange 2 en fonction du mélange 1'); xlabel('Valeur de M1'); ylabel('Valeur de M2');                     % plot the mixing
set(gca, 'xlim', [-2 2], 'ylim', [-4 4]);            % redefines limits of the graph

% withen the data
% ---------------
x = [M1;M2]
% x' is the transpose of x
c=cov(x')		 % covariance
sq=inv(sqrtm(c));        % inverse of square root
mx=mean(x');             % mean
xx=x-mx'*ones(1,1000); % subtract the mean
xx=2*sq*xx;              
cov(xx')                 % the covariance is now a diagonal matrix
figure; 
plot(xx(1,:));
figure; 
plot(xx(2,:));
figure;
plot(xx(1,:), xx(2,:), '.');

% show projections
% ----------------
figure; % figure 
axes('position', [0.2 0.2 0.8 0.8]); plot(xx(1,:), xx(2,:), '.'); title('test'); hold on;
axes('position', [0   0.2 0.2 0.8]); hist(xx(1,:));  set(gca, 'view', [90 90]);
axes('position', [0.2 0   0.8 0.2]); hist(xx(2,:));

% show projections
% ----------------
figure; % figure 
axes('position', [0.2 0.2 0.8 0.8]); plot(A,B, '.'); hold on;
axes('position', [0   0.2 0.2 0.8]); hist(B);
set(gca, 'xdir', 'reverse'); set(gca, 'view', [90 90]);
axes('position', [0.2 0   0.8 0.2]); hist(A);

