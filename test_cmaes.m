% test the cmae algorithm

%input
fitfun = 'test_fit';
xstart = 0.5;
insigma = 0.1;


%optimization
% [xmin, ...      % minimum search point of last iteration
% 	  fmin, ...      % function value of xmin
% 	  counteval, ... % number of function evaluations done
% 	  stopflag, ...  % stop criterion reached
% 	  out, ...     % struct with various histories and solutions
% 	  bestever ... % struct containing overall best solution (for convenience)
% 	 ] = cmaes( ...
%     fitfun, ...    % name of objective/fitness function
%     xstart, ...    % objective variables initial point, determines N
%     insigma, ...   % initial coordinate wise standard deviation(s)
%     inopts, ...    % options struct, see defopts below
%     varargin ) 

[xmin, fmin, counteval, stopflag, out, bestever] = cmaes( ...
    fitfun, xstart, insigma);


%plot the output and found solution
x = 0:0.001:1;
plot(x,test_fit(x));
hold; scatter(xmin,fmin,'or','filled'); hold