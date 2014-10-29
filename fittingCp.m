
global renorm_cp

fitfun = 'vector_d_cv_fit';
xstart = zeros(10,1);
insigma = ones(10,1);

[xmin, fmin, counteval, stopflag, out, bestever] = cmaes( ...
    fitfun, xstart, insigma);
%plot the output and found solution
