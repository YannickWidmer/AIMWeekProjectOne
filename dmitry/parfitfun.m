function vecres = parfitfun(matv)
n = 36;

global renorm_cv renorm_cp renorm_pressure renorm_w
parfor i=1:size(matv, 2)
    vecres(i) = fitfun(matv(:,i), renorm_cv, renorm_cp, renorm_pressure, renorm_w);
end;