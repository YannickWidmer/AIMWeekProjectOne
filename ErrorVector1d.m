function error = ErrorVector1d( Coeffs, data_prepared )
% @data_prepared n,2!!!!!!! matrix with first location and second the value

if size(data_prepared,2) ~= 2
    if size(data_prepared,1) == 2
        data_prepared = data_prepared';
    else warning('The data_preparde has the wrong dimension it should be n,2')
    end
end

if size(Coeffs,2) ~= 1
    if size(Coeffs,1) == 1
        Coeffs = Coeffs';
    else warning(' The Coeffs is multidimensional but it shouldnt be')
    end
end
f = chebfun(Coeffs,'coeffs');
error = feval(f, data_prepared(:,1))-data_prepared(:,2);
end

