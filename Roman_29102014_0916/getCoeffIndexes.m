function [ idx ] = getCoeffIndexes(basisSize)

tril(symdec(basisSize,1)-1);
idx = find(tril(symdec(basisSize,1)-1) > 0);

end

