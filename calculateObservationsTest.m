
% define constants
R_c = 0.461526  % [kJ/kg/K]
T_c = 647.094 % [K]
rho_c = 322.0  % [kg/m^3]
p_c = 22.064  % [MPa]


T = [222] % [K]   values of interest
p = [34]  % [MPa] values of interest

%tau = T_c / T      
%delta =  p / p_c  
% Directions, we want to use these directions to be coherent in the
% coefficients for the Chebychef functions and the derivatives in the
% formulas
Deltadir = 2 % delta direction
Taudir = 1 % tao direction

domainTauBounds   = [0.0,3.5]
domainDeltaBounds = [0  ,4]
pressureTresholdForCp = 2 % Kg/m2

%% load data
% Here we load: d_cv, d_cp, p-rho-T, psigma, dl, dv, cpl, cpv ,w ,wT,
% wv,dh,jt,dt
loadData
load('/home/b/ywidme/Documents/Workstation/AIM/AIMWeekProjectOne/data/d_cpoverr_cooper.mat')

%% Renomralize
% we renormalize all the data to delta and tau
renorm_cv = [T_c./d_cv(:,1),d_cv(:,2)./rho_c,d_cv(:,3)./R_c];
renorm_cp_low_pres = [T_c./d_cpoverr_cooper(:,1),d_cpoverr_cooper(:,2)];
renorm_cp = [T_c./d_cp(:,1),d_cp(:,2)./rho_c,d_cp(:,3)./R_c];
renorm_pressure = [T_c./d_prhot(:,1),d_prhot(:,2)./rho_c,d_prhot(:,3)./d_prhot(:,2)./R_c./d_prhot(:,1)];
% TODO renorm_psigma
% TODO renorm_dl
% TODO renorm_dv
% TODO renorm_cpl
% TODO renorm_cpv
renorm_w = [T_c./d_w(:,1),d_w(:,2)./rho_c,d_w(:,3).^2./(R_c*d_w(:,1))];
%renorm_wl = [T_c./d_wl(:,1),d_wl(:,2)./rho_c,d_wl(:,3).^2./(R_c*d_wl(:,1))];
%renorm_wv = [T_c./d_wv(:,1),d_wv(:,2)./rho_c,d_wv(:,3).^2./(R_c*d_wv(:,1))];
%TODO dh jt dt

% renorm of c_p for chebychev
renorm_two_cp = [(renorm_cp(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    (renorm_cp(:,2)-mean(domainDeltaBounds))*2/(domainDeltaBounds(2)-domainDeltaBounds(1)),renorm_cp(:,3)];

renorm_cp_low_pres = [(renorm_cp_low_pres(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    renorm_cp_low_pres(:,2)];
global renorm_cp_low_pressure
renorm_cp_low_pressure = renorm_cp_low_pres(renorm_cp_low_pres(:,1)<1,[1,2]);

%figure,scatter3(renorm_two_cp(:,1),renorm_two_cp(:,2),renorm_cp(:,3))

% preview some data
%figure,scatter3(T_c./d_prhot(:,1),d_prhot(:,2)./rho_c,d_prhot(:,3)./d_prhot(:,2)./R./d_prhot(:,1),'x'),xlabel('tau'),ylabel('delta')
%figure,scatter3(T_c./d_cv(:,1),d_cv(:,2)./rho_c,d_cv(:,3)./R,'x'),xlabel('tau'),ylabel('delta')


%%% Some Relation Equations (For copy paste pourpose)
% % cp/R
% -tau.^2*(diff(ao,2,Tdir)+ diff(ar,2,Tdir)) + ...
%     (1+delta*diff(ar,1,Ddir)-delta*tau*diff(diff(ar,1,Ddir),1,Tdir)).*(1+2*delta*diff(ar,1,Ddir)-delta.^2*diff(ar,2,Ddir)) ... 
%    
% % w
% 1+2*delta*diff(ar,1,Ddir)+delta.^2*diff(ar,2,Ddir)+ (1+delta*diff(ar,1,Ddir)-delta*tau*diff(diff(ar,1,Ddir),1,Tdir)).^2 ./ ... 
%     (tau.^2*(diff(ao,2,Tdir)+ diff(ar,2,Tdir)))