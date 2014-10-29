%clear all
%close all

path(path, '.\utils');

fileNames = getFiles('.\data\cp')

d_cp = []
d_cpl = []
d_cpv = []
d_cv = []
d_dh = []
d_dl = []
d_dt = []
d_jt = []
d_dv = []
d_prhot = []
d_psigma = []
d_w = []
d_wl = []
d_wv = []

for kk = 1:length(fileNames)
   d_cp = [d_cp;loadContentCP(['.\data\cp\',fileNames{kk}])]
end

fileNames = getFiles('.\data\cpl')

for kk = 1:length(fileNames)
   d_cpl = [d_cpl;loadContentCPL(['.\data\cpl\',fileNames{kk}])]
end

fileNames = getFiles('.\data\cpv')

for kk = 1:length(fileNames)
   d_cpv = [d_cpv;loadContentCPV(['.\data\cpv\',fileNames{kk}])]
end

fileNames = getFiles('.\data\cv')

for kk = 1:length(fileNames)
   d_cv = [d_cv;loadContentCV(['.\data\cv\',fileNames{kk}])]
end

fileNames = getFiles('.\data\dh')

for kk = 1:length(fileNames)
   d_dh = [d_dh;loadContentDH(['.\data\dh\',fileNames{kk}])]
end

fileNames = getFiles('.\data\dl')

for kk = 1:length(fileNames)
   d_dl = [d_dl;loadContentDL(['.\data\dl\',fileNames{kk}])]
end

fileNames = getFiles('.\data\dt')

for kk = 1:length(fileNames)
   d_dt = [d_dt;loadContentDT(['.\data\dt\',fileNames{kk}])]
end

fileNames = getFiles('.\data\dv')

for kk = 1:length(fileNames)
   d_dv = [d_dv;loadContentDV(['.\data\dv\',fileNames{kk}])]
end

fileNames = getFiles('.\data\jt')

for kk = 1:length(fileNames)
   d_jt = [d_jt;loadContentJT(['.\data\jt\',fileNames{kk}])]
end

fileNames = getFiles('.\data\p-rho-t')

for kk = 1:length(fileNames)
   d_prhot = [d_prhot;loadContentPRHOT(['.\data\p-rho-t\',fileNames{kk}])]
end

fileNames = getFiles('.\data\psigma')

for kk = 1:length(fileNames)
   d_psigma = [d_psigma;loadContentPSIGMA(['.\data\psigma\',fileNames{kk}])]
end

fileNames = getFiles('.\data\w')

for kk = 1:length(fileNames)
   d_w = [d_w;loadContentW(['.\data\w\',fileNames{kk}])]
end


fileNames = getFiles('.\data\wl')

for kk = 1:length(fileNames)
   d_wl = [d_wl;loadContentWL(['.\data\wl\',fileNames{kk}])]
end

fileNames = getFiles('.\data\wv')

for kk = 1:length(fileNames)
   d_wv = [d_wv;loadContentWV(['.\data\wv\',fileNames{kk}])]
end
