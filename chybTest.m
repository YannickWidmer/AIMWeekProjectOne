clear all
close all

path(path, '.\chebfun-master');

LW = 'linewidth'; lw = 1.6;
MS = 'markersize';
FS = 'Fontsize'; fs = 16;

%ccheb = get(f,'coeffs');             % get the Chebyshev coefficients of f

% 1D

basisSize = 10

Cx = tril(rand(basisSize)-0.5)
% Cx(4,4) = 0
% Cx(3,3) = 1
% Cx(2,2) = 0
% Cx(1,1) = 0
cchebX = chebfun({{[], Cx}})
clf,plot(cchebX,'r',LW,lw)

Cy = tril(rand(basisSize)-0.5)
cchebY = chebfun({{[], Cy}})
clf,plot(cchebY,'r',LW,lw)


% 2D by outer product
cchebXY = cchebX*cchebY'

clf,plot(cchebXY)
clf,plot(diff(cchebXY,1,1))  % first diff along y direction
clf,plot(diff(cchebXY,1,2))  % first diff along x direction

clf,plot(diff(cchebXY,2,1))  % second diff along y direction
clf,plot(diff(cchebXY,2,2))  % second diff along x direction

[A,D,B] = chebcoeffs2(cchebXY)