close all;
clc;

train_data = readtable('diabetes-training.csv');


load('TrainedModel.mat');

[trainingfit,~] = TrainedModel.predictFcn(train_data);
training = table2array(train_data(:,size(train_data,2)));
passed_train = 0;

for i = 1:size(train_data,1)
    if training(i) == trainingfit(i)
        passed_train=plus(passed_train,1);
    end
end
accuracy = (passed_train/size(train_data,1))*100;
disp(accuracy);