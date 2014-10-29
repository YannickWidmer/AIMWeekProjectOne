function [ cchebXY ] = alphaO(coeffX,coeffY,tauRange,deltaRange,basisSize,idx)

coeffMatrix = zeros(basisSize*basisSize,1);
coeffMatrix(idx) = coeffX;
Cx = reshape(coeffMatrix,basisSize,basisSize);

coeffMatrix = zeros(basisSize*basisSize,1);
coeffMatrix(idx) = coeffY;
Cy = reshape(coeffMatrix,basisSize,basisSize);

cchebX = chebfun({{[], Cx}},tauRange);
figure,clf,plot(cchebX,'r'),title('tau basis polynominals')

cchebY = chebfun({{[], Cy}},deltaRange);
figure,clf,plot(cchebY,'r'),title('delta basis polynominals')

% return outer product
cchebXY = cchebX*cchebY';
figure,clf,plot(cchebXY),title('outer product')

end
