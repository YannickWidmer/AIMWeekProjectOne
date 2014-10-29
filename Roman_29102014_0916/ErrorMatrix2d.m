function error = ErrorMatrix2d(Coeffs, data_prepared )
% @ data Prepared 3,n matrix first entrys are the x coordinates the second
% is the y and the last is the value

f = chebfun2(Coeffs,'coeffs');

error = feval(f,data_prepared(1,:),data_prepared(2,:))'-data_prepared(3,:);


end

