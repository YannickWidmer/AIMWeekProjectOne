function varargout = functionPoints(disc)
%FUNCTIONPOINTS   Points at which functions are discretized.
%   In COLLOC2, functions are discretized at 2nd kind points but equations are
%   enforced at 1st kind points, to avoid duplication at boundaries.

% Copyright 2014 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

pointsFun = @(n) chebtech2.chebpts(n);
[varargout{1:nargout}] = colloc.points(disc, pointsFun);

end