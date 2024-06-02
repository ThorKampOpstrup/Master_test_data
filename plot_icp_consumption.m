clc;
clear;
close all;

data_path = 'ICP_consumption/';

data = csvread(strcat(data_path, 'data.csv'));

nn_search = data(:,1);
best_tranform = data(:,3);
mean_error = data(:,5);

tmp1 = data(:,2);
tmp2 = data(:,4);


avg_nn_search = mean(nn_search)
avg_best_tranform = mean(best_tranform)
avg_mean_error = mean(mean_error)

%get the sum of all the columns
sum_nn_search = sum(nn_search)
sum_best_tranform = sum(best_tranform)
sum_mean_error = sum(mean_error)

sum_all = sum_nn_search + sum_best_tranform + sum_mean_error + sum(tmp1) + sum(tmp2)

%get percentage of each column compared to the total
perc_nn_search = sum_nn_search / sum_all
perc_best_tranform = sum_best_tranform / sum_all
perc_mean_error = sum_mean_error / sum_all




figure;
plot(avg_nn_search, 'r');
hold on;
plot(avg_best_tranform, 'g');
plot(avg_mean_error, 'b');
title('ICP consumption');
xlabel('Number of points');
ylabel('Time [ms]');
legend('NN search', 'Best transform', 'Mean error');

