clc;
clear;
close all;

data_path = 'convergence_test/';

% Load data

conf_0 = csvread(strcat(data_path, 'conf_0.csv'));
conf_10 = csvread(strcat(data_path, 'conf_10.csv'));
conf_20 = csvread(strcat(data_path, 'conf_20.csv'));
conf_30 = csvread(strcat(data_path, 'conf_30.csv'));
conf_40 = csvread(strcat(data_path, 'conf_40.csv'));
conf_50 = csvread(strcat(data_path, 'conf_50.csv'));
conf_60 = csvread(strcat(data_path, 'conf_60.csv'));
conf_70 = csvread(strcat(data_path, 'conf_70.csv'));


%take first row of each matrix
conf_0_n = conf_0(1,1)
conf_10_n = conf_10(1,1)
conf_20_n = conf_20(1,1)
conf_30_n = conf_30(1,1)
conf_40_n = conf_40(1,1)
conf_50_n = conf_50(1,1)
conf_60_n = conf_60(1,1)
conf_70_n = conf_70(1,1)

%take last row of each matrix
conf_0_ms = conf_0(end,:);
conf_10_ms = conf_10(end,:);
conf_20_ms = conf_20(end,:);
conf_30_ms = conf_30(end,:);
conf_40_ms = conf_40(end,:);
conf_50_ms = conf_50(end,:);
conf_60_ms = conf_60(end,:);
conf_70_ms = conf_70(end,:);


%delete first and last row of each matrix
conf_0 = conf_0(2:end-1,:);
conf_10 = conf_10(2:end-1,:);
conf_20 = conf_20(2:end-1,:);
conf_30 = conf_30(2:end-1,:);
conf_40 = conf_40(2:end-1,:);
conf_50 = conf_50(2:end-1,:);
conf_60 = conf_60(2:end-1,:);
conf_70 = conf_70(2:end-1,:);

%plot first column of each matrix
figure;
plot(conf_0(:,1), 'r');
hold on;
plot(conf_10(:,1), 'g');
plot(conf_20(:,1), 'b');
plot(conf_30(:,1), 'c');
plot(conf_40(:,1), 'm');
plot(conf_50(:,1), 'y');
plot(conf_60(:,1), 'k');
plot(conf_70(:,1), 'r');
title('Convergence test');
xlabel('Iteration');
ylabel('Mean rotational error[deg]');
legend(sprintf('%i points', conf_0_n), sprintf('%i points', conf_10_n), sprintf('%i points', conf_20_n), sprintf('%i points', conf_30_n), sprintf('%i points', conf_40_n), sprintf('%i points', conf_50_n), sprintf('%i points', conf_60_n), sprintf('%i points', conf_70_n));

%plot second column of each matrix
figure;
plot(conf_0(:,2), 'r');
hold on;
plot(conf_10(:,2), 'g');
plot(conf_20(:,2), 'b');
plot(conf_30(:,2), 'c');
plot(conf_40(:,2), 'm');
plot(conf_50(:,2), 'y');
plot(conf_60(:,2), 'k');
plot(conf_70(:,2), 'r');
title('Convergence test');
xlabel('Iteration');
ylabel('Mean translational error[m]');
legend(sprintf('%i points', conf_0_n), sprintf('%i points', conf_10_n), sprintf('%i points', conf_20_n), sprintf('%i points', conf_30_n), sprintf('%i points', conf_40_n), sprintf('%i points', conf_50_n), sprintf('%i points', conf_60_n), sprintf('%i points', conf_70_n));


%plot relavitve to time
rows = size(conf_70, 1);

conf_0_dt = conf_0_ms/rows
conf_0 = [conf_0 transpose(0:conf_0_dt:conf_0_ms-conf_0_dt)];
conf_10_dt = conf_10_ms/rows
conf_10 = [conf_10 transpose(0:conf_10_dt:conf_10_ms-conf_10_dt)];
conf_20_dt = conf_20_ms/rows
conf_20 = [conf_20 transpose(0:conf_20_dt:conf_20_ms-conf_20_dt)];
conf_30_dt = conf_30_ms/rows
conf_30 = [conf_30 transpose(0:conf_30_dt:conf_30_ms-conf_30_dt)];
conf_40_dt = conf_40_ms/rows
conf_40 = [conf_40 transpose(0:conf_40_dt:conf_40_ms-conf_40_dt)];
conf_50_dt = conf_50_ms/rows
conf_50 = [conf_50 transpose(0:conf_50_dt:conf_50_ms-conf_50_dt)];
conf_60_dt = conf_60_ms/rows
conf_60 = [conf_60 transpose(0:conf_60_dt:conf_60_ms-conf_60_dt)];
conf_70_dt = conf_70_ms/rows
conf_70 = [conf_70 transpose(0:conf_70_dt:conf_70_ms-conf_70_dt)];


figure;
% plot(conf_0(:,3), conf_0(:,1), 'r');
% plot(conf_10(:,3), conf_10(:,1), 'g');
% plot(conf_20(:,3), conf_20(:,1), 'b');
%plot(conf_30(:,3), conf_30(:,1), 'c');
%plot(conf_40(:,3), conf_40(:,1), 'm');
plot(conf_50(:,3), conf_50(:,1), 'm');
hold on;
plot(conf_60(:,3), conf_60(:,1), 'k');
plot(conf_70(:,3), conf_70(:,1), 'r');
xlim([0 300]);
title('Convergence test');
xlabel('Time[ms]');
ylabel('Mean rotational error[deg]');
legend(sprintf('%i points', conf_50_n), sprintf('%i points', conf_60_n), sprintf('%i points', conf_70_n));

figure;
%plot(conf_0(:,3), conf_0(:,2), 'r');
%plot(conf_10(:,3), conf_10(:,2), 'g');
%plot(conf_20(:,3), conf_20(:,2), 'b');
%plot(conf_30(:,3), conf_30(:,2), 'c');
%plot(conf_40(:,3), conf_40(:,2), 'm');
plot(conf_50(:,3), conf_50(:,2), 'm');
hold on;
plot(conf_60(:,3), conf_60(:,2), 'k');
plot(conf_70(:,3), conf_70(:,2), 'r');
xlim([0 300]);
title('Convergence test');
xlabel('Time[ms]');
ylabel('Mean translational error[m]');
legend(sprintf('%i points', conf_50_n), sprintf('%i points', conf_60_n), sprintf('%i points', conf_70_n));


%plot point with number of points and dt

all_n = [conf_10_n; conf_20_n; conf_30_n; conf_40_n; conf_50_n; conf_60_n; conf_70_n];
all_dt = [conf_10_dt; conf_20_dt; conf_30_dt; conf_40_dt; conf_50_dt; conf_60_dt; conf_70_dt];
all_dt = all_dt(:,1);

all_n_dt = [all_n all_dt];
all_t_per_point = all_dt./all_n


figure;
plot(all_n_dt(:,1), all_n_dt(:,2), 'r*')
hold on;
title('Iteration duration vs number of points');
xlabel('Number of points');
ylabel('Mean iteration duration[ms]');

figure;
plot(all_n_dt(:,1), all_t_per_point, 'r*')
hold on;
title('Iteration duration per point vs number of points');
xlabel('Number of points');
ylabel('Mean iteration duration per point[ms]');

all_t_per_point_div_num_points = all_t_per_point./all_n


b1 = all_n\all_t_per_point
yCalc1 = b1*all_n;

figure;
plot(all_n_dt(:,1), all_t_per_point, 'r*')
hold on;
plot(all_n, yCalc1, 'r');
title('Iteration duration per point vs number of points');
xlabel('Number of points');
ylabel('Mean iteration duration per point[ms]');
legend('Data', 'Linear regression');
