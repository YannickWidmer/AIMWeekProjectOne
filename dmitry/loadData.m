echo off
%clear all
%close all

%path(path, './utils')

% fileNames = getFiles('./data/cp');
% 
% d_cp = [];
% d_cpl = [];
% d_cpv = [];
% d_cv = [];
% d_dh = [];
% d_dl = [];
% d_dt = [];
% d_jt = [];
% d_dv = [];
% d_prhot = [];
% d_psigma = [];
% d_w = [];
% d_wl = [];
% d_wv = [];
% 
% for kk = 1:length(fileNames)
%    d_cp = [d_cp;loadContentCP(['./data/cp/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/cpl');
% 
% for kk = 1:length(fileNames)
%    d_cpl = [d_cpl;loadContentCPL(['./data/cpl/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/cpv');
% 
% for kk = 1:length(fileNames)
%    d_cpv = [d_cpv;loadContentCPV(['./data/cpv/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/cv');
% 
% for kk = 1:length(fileNames)
%    d_cv = [d_cv;loadContentCV(['./data/cv/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/dh');
% 
% for kk = 1:length(fileNames)
%    d_dh = [d_dh;loadContentDH(['./data/dh/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/dl');
% 
% for kk = 1:length(fileNames)
%    d_dl = [d_dl;loadContentDL(['./data/dl/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/dt');
% 
% for kk = 1:length(fileNames)
%    d_dt = [d_dt;loadContentDT(['./data/dt/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/dv');
% 
% for kk = 1:length(fileNames)
%    d_dv = [d_dv;loadContentDV(['./data/dv/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/jt');
% 
% for kk = 1:length(fileNames)
%    d_jt = [d_jt;loadContentJT(['./data/jt/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/p-rho-t');
% 
% for kk = 1:length(fileNames)
%    d_prhot = [d_prhot;loadContentPRHOT(['./data/p-rho-t/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/psigma');
% 
% for kk = 1:length(fileNames)
%    d_psigma = [d_psigma;loadContentPSIGMA(['./data/psigma/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/w');
% 
% for kk = 1:length(fileNames)
%    d_w = [d_w;loadContentW(['./data/w/',fileNames{kk}])];
% end;
% 
% 
% fileNames = getFiles('./data/wl');
% 
% for kk = 1:length(fileNames)
%    d_wl = [d_wl;loadContentWL(['./data/wl/',fileNames{kk}])];
% end;
% 
% fileNames = getFiles('./data/wv');
% 
% for kk = 1:length(fileNames)
%    d_wv = [d_wv;loadContentWV(['./data/wv/',fileNames{kk}])];
% end;

% define constants
R_c = 0.461526;  % [kJ/kg/K]
T_c = 647.094; % [K]
rho_c = 322.0;  % [kg/m^3]
p_c = 22.064;  % [MPa]

domainTauBounds   = [0.5, 3.0];
domainDeltaBounds = [0.0, 4.0]

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
%renorm_wl = [T_c./d_wl(:,1),d_wl(:,2)./rho_c,d_wl(:,3).^2./(R_c*d_wl(:,1))];
%renorm_wv = [T_c./d_wv(:,1),d_wv(:,2)./rho_c,d_wv(:,3).^2./(R_c*d_wv(:,1))];

renorm_cv = [(renorm_cv(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    (renorm_cv(:,2)-mean(domainDeltaBounds))*2/(domainDeltaBounds(2)-domainDeltaBounds(1)),renorm_cv(:,3)]

renorm_cp = [(renorm_cp(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    (renorm_cp(:,2)-mean(domainDeltaBounds))*2/(domainDeltaBounds(2)-domainDeltaBounds(1)),renorm_cp(:,3)]

renorm_pressure = [(renorm_pressure(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    (renorm_pressure(:,2)-mean(domainDeltaBounds))*2/(domainDeltaBounds(2)-domainDeltaBounds(1)),renorm_pressure(:,3)]

renorm_w = [(renorm_w(:,1)-mean(domainTauBounds))*2/(domainTauBounds(2)-domainTauBounds(1)),...
    (renorm_w(:,2)-mean(domainDeltaBounds))*2/(domainDeltaBounds(2)-domainDeltaBounds(1)),renorm_w(:,3)]

renorm_cv = renorm_cv(-1 < renorm_cv(:,1) & renorm_cv(:,1) < 1, :);
renorm_cv = renorm_cv(-1 < renorm_cv(:,2) & renorm_cv(:,2) < 1, :);

renorm_cp = renorm_cp(-1 < renorm_cp(:,1) & renorm_cp(:,1) < 1, :);
renorm_cp = renorm_cp(-1 < renorm_cp(:,2) & renorm_cp(:,2) < 1, :);

renorm_pressure = renorm_pressure(-1 < renorm_pressure(:,1) & renorm_pressure(:,1) < 1, :);
renorm_pressure = renorm_pressure(-1 < renorm_pressure(:,2) & renorm_pressure(:,2) < 1, :);

renorm_w = renorm_w(-1 < renorm_w(:,1) & renorm_w(:,1) < 1, :);
renorm_w = renorm_w(-1 < renorm_w(:,2) & renorm_w(:,2) < 1, :);

gridSize = 50;
pointBins = zeros(2*gridSize+1, 2*gridSize+1);

for i=1:size(renorm_cv, 1)
    ix = fix( gridSize*(renorm_cv(i,1)+1) )+1;
    iy = fix( gridSize*(renorm_cv(i,2)+1) )+1;
    
    pointBins(ix, iy) = pointBins(ix, iy) + 1;
end;
    
for i=1:size(renorm_cp, 1)
    ix = fix( gridSize*(renorm_cp(i,1)+1) )+1;
    iy = fix( gridSize*(renorm_cp(i,2)+1) )+1;
    
    pointBins(ix, iy) = pointBins(ix, iy) + 1;
end;
    
for i=1:size(renorm_pressure, 1)
    ix = fix( gridSize*(renorm_pressure(i,1)+1) )+1;
    iy = fix( gridSize*(renorm_pressure(i,2)+1) )+1;
    
    pointBins(ix, iy) = pointBins(ix, iy) + 1;
end;
    
for i=1:size(renorm_w, 1)
    ix = fix( gridSize*(renorm_w(i,1)+1) )+1;
    iy = fix( gridSize*(renorm_w(i,2)+1) )+1;
    
    pointBins(ix, iy) = pointBins(ix, iy) + 1;
end;

probFactor = 4;
prob = rand(size(renorm_cv, 1), 1);
renorm_cv = renorm_cv( prob(:) < probFactor ./ pointBins(sub2ind(size(pointBins), ...
                                                    fix( gridSize.*(renorm_cv(:,1)+1) )+1, ...
                                                    fix( gridSize.*(renorm_cv(:,2)+1) )+1)), : );

prob = rand(size(renorm_cp, 1), 1);
renorm_cp = renorm_cp( prob(:) < probFactor ./ pointBins(sub2ind(size(pointBins), ...
                                                    fix( gridSize.*(renorm_cp(:,1)+1) )+1, ...
                                                    fix( gridSize.*(renorm_cp(:,2)+1) )+1)), : );
prob = rand(size(renorm_pressure, 1), 1);
renorm_pressure = renorm_pressure( prob(:) < probFactor ./ pointBins(sub2ind(size(pointBins), ...
                                                    fix( gridSize.*(renorm_pressure(:,1)+1) )+1, ...
                                                    fix( gridSize.*(renorm_pressure(:,2)+1) )+1)), : );
prob = rand(size(renorm_w, 1), 1);
renorm_w = renorm_w( prob(:) < probFactor ./ pointBins(sub2ind(size(pointBins), ...
                                                    fix( gridSize.*(renorm_w(:,1)+1) )+1, ...
                                                    fix( gridSize.*(renorm_w(:,2)+1) )+1)), : );

                                                
                                                
