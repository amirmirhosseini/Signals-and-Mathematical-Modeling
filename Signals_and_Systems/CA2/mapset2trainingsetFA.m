clc;clear;close all;clearvars;  
cd('C:\Users\alimi\Desktop\ss_ca_2');  


directory = dir('./p2/Map Set/');  
nam = {directory(3:end).name};  
len = length(nam);  


TRAINF = cell(2, len);  

for i = 1:len  
    currentFile = fullfile('./p2/Map Set/', nam{i});    
    if isfile(currentFile) 
        TRAINF(1, i) = {imread(currentFile)}; 
        TRAINF(2, i) = {nam{i}(1)};  
    else  
        warning('File does not exist: %s', currentFile);   
    end  
end  


save('TRAININGSET2.mat', 'TRAINF');