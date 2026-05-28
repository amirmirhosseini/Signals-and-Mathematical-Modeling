clc;clear;close all;clearvars;  


directory = dir('./p1/Map Set/');  
nam = {directory(3:end).name};  
len = length(nam);  

TRAIN = cell(2, len);  

for i = 1:len  
    currentFile = fullfile('./p1/Map Set/', nam{i}); 
    if isfile(currentFile)   
        TRAIN(1, i) = {imread(currentFile)};   
        TRAIN(2, i) = {nam{i}(1)}; 
    else  
        warning('File does not exist: %s', currentFile); 
    end  
end  

% Save the DATA  
save('TRAININGSET.mat', 'TRAIN');