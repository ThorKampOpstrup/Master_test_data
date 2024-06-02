clc;
clear;
close all;

data_path = 'icp_nn_with_without_kdtree/';

data = csvread(strcat(data_path, 'data.csv'));

n = data(:,1);
ms_ls = data(:,2);
ms_kd = data(:,3);

figure;
plot(n, ms_ls, 'r*');
hold on;
plot(n, ms_kd, 'b*');
title('ICP NN duration with and without kd-Tree');
xlabel('Number of points');
ylabel('Nearest neighbor search time [ms]');
legend('Without kd-Tree', 'With kd-Tree');

ms_ls_per_point = ms_ls ./ n;
ms_kd_per_point = ms_kd ./ n;

figure;
plot(n, ms_ls_per_point, 'r*');
hold on;
plot(n, ms_kd_per_point, 'b*');
title('ICP NN duration per point with and without kd-Tree');
xlabel('Number of points');
ylabel('Nearest neighbor search time per point [ms]');
legend('Without kd-Tree', 'With kd-Tree');
