function names = getFiles(folder)

names = {};

allFiles = dir(['.',filesep,folder]);

namesIdx = 1;
for kk = 1:length(allFiles)
    
    current  = allFiles(kk);
    
    if(strcmp(current.name,'.') == 1)
        % just skip        
    elseif(strcmp(current.name,'..') == 1)
        % just skip
    elseif(strcmp(current.name,'comparison') == 1)
        % just skip
    else
        names{namesIdx} = current.name;
        namesIdx = namesIdx + 1;
    end    
end

