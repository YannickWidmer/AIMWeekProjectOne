function toterr = fitfun(v, renorm_cv, renorm_cp, renorm_pressure, renorm_w)
toterr = 0;

tempN = 6;
densN = 6;

Ca0 = [1]';
a0 = chebfun(Ca0, 'coeffs');

C = reshape(v, tempN, densN);
ar = chebfun2(C, 'coeffs');

% p-rho-T
p_rhoRT = 1 + renorm_pressure(:, 2) .* feval(diffy(ar, 1), renorm_pressure(:,1), renorm_pressure(:, 2));
toterr = toterr + sum( ((p_rhoRT - renorm_pressure(:,3)) ./ renorm_pressure(:,3)) .^2 );

% Cp
% a0_tt = feval(diff(a0, 2),      renorm_cp(:,1));
% ar_tt = feval(diffx(ar, 2),     renorm_cp(:,1), renorm_cp(:, 2));
% ar_d =  feval(diffy(ar, 1),     renorm_cp(:,1), renorm_cp(:, 2));
% ar_dt = feval(diffx(diffy(ar)), renorm_cp(:,1), renorm_cp(:, 2));
% ar_dd = feval(diffy(ar, 2),     renorm_cp(:,1), renorm_cp(:, 2));
% 
% cp = -renorm_cp(:, 1).^2 .* (a0_tt + ar_tt) + ...
%     (1 + renorm_cp(:, 2) .* (ar_d - renorm_cp(:,1).*ar_dt)).^2  ./ ...
%     (1 + renorm_cp(:, 2) .* (2.*ar_d + renorm_cp(:, 2).*ar_dd));
% toterr = toterr + sum( ((cp - renorm_cp(:, 3)) ./ renorm_cp(:, 3)) .^2 );
% 
% % Cv
% a0_tt_cv = feval(diff(a0, 2),      renorm_cv(:,1));
% ar_tt_cv = feval(diffx(ar, 2),     renorm_cv(:,1), renorm_cv(:, 2));
% 
% cv = -renorm_cv(:,1).^2 .* (a0_tt_cv + ar_tt_cv);
% toterr = toterr + sum( ((cv - renorm_cv(:, 3)) ./ renorm_cv(:, 3)) .^2 );
% 
% % w
% ar_d_w =  feval(diffy(ar, 1),     renorm_w(:,1), renorm_w(:, 2));
% ar_dd_w = feval(diffy(ar, 2),     renorm_w(:,1), renorm_w(:, 2));
% ar_dt_w = feval(diffx(diffy(ar)), renorm_w(:,1), renorm_w(:, 2));
% a0_tt_w = feval(diff(a0, 2),      renorm_w(:,1));
% ar_tt_w = feval(diffx(ar, 2),     renorm_w(:,1), renorm_w(:, 2));
% 
% w = 1 + renorm_w(:, 2) .* (2*ar_d_w + renorm_w(:, 2).*ar_dd_w) - ...
%     (1 + renorm_w(:, 2) .* (ar_d_w - renorm_w(:,1).*ar_dt_w)).^2  ./ ...
%     ( renorm_w(:,1).^2 .* (a0_tt_w + ar_tt_w) );
% toterr = toterr + sum( ((w - renorm_w(:, 3)) ./ renorm_w(:,3)) .^2 );
% 
