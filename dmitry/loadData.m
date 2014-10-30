%clear all
%close all

%path(path, './utils')

fileNames = getFiles('./data/cp');

d_cp = [];
d_cpl = [];
d_cpv = [];
d_cv = [];
d_dh = [];
d_dl = [];
d_dt = [];
d_jt = [];
d_dv = [];
d_prhot = [];
d_psigma = [];
d_w = [];
d_wl = [];
d_wv = [];

for kk = 1:length(fileNames)
   d_cp = [d_cp;loadContentCP(['./data/cp/',fileNames{kk}])];
end;

fileNames = getFiles('./data/cpl');

for kk = 1:length(fileNames)
   d_cpl = [d_cpl;loadContentCPL(['./data/cpl/',fileNames{kk}])];
end;

fileNames = getFiles('./data/cpv');

for kk = 1:length(fileNames)
   d_cpv = [d_cpv;loadContentCPV(['./data/cpv/',fileNames{kk}])];
end;

fileNames = getFiles('./data/cv');

for kk = 1:length(fileNames)
   d_cv = [d_cv;loadContentCV(['./data/cv/',fileNames{kk}])];
end;

fileNames = getFiles('./data/dh');

for kk = 1:length(fileNames)
   d_dh = [d_dh;loadContentDH(['./data/dh/',fileNames{kk}])];
end;

fileNames = getFiles('./data/dl');

for kk = 1:length(fileNames)
   d_dl = [d_dl;loadContentDL(['./data/dl/',fileNames{kk}])];
end;

fileNames = getFiles('./data/dt');

for kk = 1:length(fileNames)
   d_dt = [d_dt;loadContentDT(['./data/dt/',fileNames{kk}])];
end;

fileNames = getFiles('./data/dv');

for kk = 1:length(fileNames)
   d_dv = [d_dv;loadContentDV(['./data/dv/',fileNames{kk}])];
end;

fileNames = getFiles('./data/jt');

for kk = 1:length(fileNames)
   d_jt = [d_jt;loadContentJT(['./data/jt/',fileNames{kk}])];
end;

fileNames = getFiles('./data/p-rho-t');

for kk = 1:length(fileNames)
   d_prhot = [d_prhot;loadContentPRHOT(['./data/p-rho-t/',fileNames{kk}])];
end;

fileNames = getFiles('./data/psigma');

for kk = 1:length(fileNames)
   d_psigma = [d_psigma;loadContentPSIGMA(['./data/psigma/',fileNames{kk}])];
end;

fileNames = getFiles('./data/w');

for kk = 1:length(fileNames)
   d_w = [d_w;loadContentW(['./data/w/',fileNames{kk}])];
end;


fileNames = getFiles('./data/wl');

for kk = 1:length(fileNames)
   d_wl = [d_wl;loadContentWL(['./data/wl/',fileNames{kk}])];
end;

fileNames = getFiles('./data/wv');

for kk = 1:length(fileNames)
   d_wv = [d_wv;loadContentWV(['./data/wv/',fileNames{kk}])];
end;

% define constants
R_c = 0.461526;  % [kJ/kg/K]
T_c = 647.094   /  3.0; % [K]
rho_c = 322.0  *   4.0;  % [kg/m^3]
p_c = 22.064;  % [MPa]

global renorm_cv renorm_cp renorm_pressure renorm_w
renorm_cv = [T_c./d_cv(:,1),d_cv(:,2)./rho_c,d_cv(:,3)./R_c];
renorm_cp = [T_c./d_cp(:,1),d_cp(:,2)./rho_c,d_cp(:,3)./R_c];
renorm_pressure = [T_c./d_prhot(:,1),d_prhot(:,2)./rho_c,d_prhot(:,3)./d_prhot(:,2)./R_c./d_prhot(:,1)];
% TODO renorm_psigma
% TODO renorm_dl
% TODO renorm_dv
% TODO renorm_cpl
% TODO renorm_cpv
renorm_w = [T_c./d_w(:,1),d_w(:,2)./rho_c,d_w(:,3).^2./(R_c*d_w(:,1))];
renorm_wl = [T_c./d_wl(:,1),d_wl(:,2)./rho_c,d_wl(:,3).^2./(R_c*d_wl(:,1))];
renorm_wv = [T_c./d_wv(:,1),d_wv(:,2)./rho_c,d_wv(:,3).^2./(R_c*d_wv(:,1))];

