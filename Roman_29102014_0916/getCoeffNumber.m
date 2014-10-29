function num = getCoeffNumber(basisSize)

tril(symdec(basisSize,1)-1);
idx = find(tril(symdec(basisSize,1)-1) > 0);
num = length(idx)

