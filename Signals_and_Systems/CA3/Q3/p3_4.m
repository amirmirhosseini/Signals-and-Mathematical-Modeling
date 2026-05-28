clear all;

load('TrainedModel.mat');

valid_data = readtable('diabetes-validation.csv');

[fiting,~] = TrainedModel.predictFcn(valid_data);
fit = table2array(valid_data(:,size(valid_data,2)));
correct_fit=0;
for i = 1:size(valid_data,1)
    if fit(i) == fiting(i)
        correct_fit=plus(correct_fit,1);
    end
end
accuracy = (correct_fit/size(valid_data,1))*100;
disp(accuracy);