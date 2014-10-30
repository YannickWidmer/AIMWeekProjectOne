
global renorm_cp

fitfun = 'vector_d_cv_fit';
xstart = zeros(10,1);
insigma = 0.3*ones(10,1);

[xmin, fmin, counteval, stopflag, out, bestever] = cmaes( ...
    fitfun, xstart, insigma);
%plot the output and found solution

vector_d_cv_fit(bestever.x)

f = chebfun(bestever.x,'coeffs')
figure
plot(f)
hold on
scatter(renorm_cp_low_pressure(:,1),renorm_cp_low_pressure(:,2))
hold off