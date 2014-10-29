clear all
%close all

path(path,strcat( '.',filesep,'utils'));
path(path,strcat( '.',filesep,'chebfun-master'));

fileNames = getFiles(strcat('.',filesep,'data',filesep,'cp'))

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


fileNames = getFiles(strcat('.',filesep,'data',filesep,'cpl'))

for kk = 1:length(fileNames)
   d_cpl = [d_cpl;loadContentCPL([strcat('.',filesep,'data',filesep,'cpl',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'cpv'))

for kk = 1:length(fileNames)
   d_cpv = [d_cpv;loadContentCPV([strcat('.',filesep,'data',filesep,'cpv',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'cv'))

for kk = 1:length(fileNames)
   d_cv = [d_cv;loadContentCV([strcat('.',filesep,'data',filesep,'cv',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'dh'))

for kk = 1:length(fileNames)
   d_dh = [d_dh;loadContentDH([strcat('.',filesep,'data',filesep,'dh',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'dl'))

for kk = 1:length(fileNames)
   d_dl = [d_dl;loadContentDL([strcat('.',filesep,'data',filesep,'dl',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'dt'))

for kk = 1:length(fileNames)
   d_dt = [d_dt;loadContentDT([strcat('.',filesep,'data',filesep,'dt',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'dv'))

for kk = 1:length(fileNames)
   d_dv = [d_dv;loadContentDV([strcat('.',filesep,'data',filesep,'dv',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'jt'))

for kk = 1:length(fileNames)
   d_jt = [d_jt;loadContentJT([strcat('.',filesep,'data',filesep,'jt',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'p-rho-T'))

for kk = 1:length(fileNames)
   d_prhot = [d_prhot;loadContentPRHOT([strcat('.',filesep,'data',filesep,'p-rho-T',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'psigma'))

for kk = 1:length(fileNames)
   d_psigma = [d_psigma;loadContentPSIGMA([strcat('.',filesep,'data',filesep,'psigma',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'w'))

for kk = 1:length(fileNames)
   d_w = [d_w;loadContentW([strcat('.',filesep,'data',filesep,'w',filesep),fileNames{kk}])]
end


fileNames = getFiles(strcat('.',filesep,'data',filesep,'wl'))

for kk = 1:length(fileNames)
   d_wl = [d_wl;loadContentWL([strcat('.',filesep,'data',filesep,'wl',filesep),fileNames{kk}])]
end

fileNames = getFiles(strcat('.',filesep,'data',filesep,'wv'))

for kk = 1:length(fileNames)
   d_wv = [d_wv;loadContentWV([strcat('.',filesep,'data',filesep,'wv',filesep),fileNames{kk}])]
end
