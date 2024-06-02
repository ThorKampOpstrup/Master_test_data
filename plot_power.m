clc;
clear;
close all;

data_path = 'power/';

data = csvread(strcat(data_path, 'data_with_idle.csv'));

amps= data(:,1);
voltage = data(:,2);
time = data(:,3);

power = amps .* voltage;

time = (time - time(1))/1000;
power_time = [power,time];

figure;
plot(time, power);
title('Power consumption over time');
xlabel('Time [s]');
ylabel('Power [W]');
%plot only legend for power not the othe limits
%xlim([0, 14500/1000]);



mean_power_fpga = mean(power(48:171))
mean_power_cpu_kd = mean(power(172:285))
mean_power_cpu_lin = mean(power(287:414))
mean_power_idle = mean(power(416:467))

yline(mean_power_fpga, '--m', 'LineWidth', 1);
yline(mean_power_cpu_kd, '--b', 'LineWidth', 1);
yline(mean_power_cpu_lin, '--o', 'LineWidth', 1);
yline(mean_power_idle, '--', 'LineWidth', 1, 'Color', "#77AC30");

L=legend('Power consumption', 'FPGA mean power (kd-tree)', 'CPU mean power (kd-tree)', 'CPU mean power (linear)', 'Idle power');

L.AutoUpdate = 'off';

x_line = [1551/1000, 5643/1000, 9372/1000, 13695/1000];
xline(x_line, '--r', 'LineWidth', 1);


text(30/1000, 8.05, 'Initialization');
text(x_line(1)+40/1000, 8, 'FPGA kd-tree');
text(x_line(2)+40/1000, 8, 'CPU kd-tree');
text(x_line(3)+40/1000, 8, 'CPU linear');
text(x_line(4)+40/1000, 8, 'Idle');

%calulate improvement
fpga_kd_increase_from_idle = (mean_power_fpga - mean_power_idle) / mean_power_idle
cpu_kd_increase_from_idle = (mean_power_cpu_kd - mean_power_idle) / mean_power_idle
cpu_lin_increase_from_idle = (mean_power_cpu_lin - mean_power_idle) / mean_power_idle


n_points_processed_kd = 1000*100;
n_points_processed_lin = 1000*10;

%calculate duration
duration_fpga_kd = (x_line(2) - x_line(1))
duration_cpu_kd = (x_line(3) - x_line(2))
duration_cpu_lin = (x_line(4) - x_line(3))

%calculate power consumption in jules
power_consumption_fpga_kd = (mean_power_fpga-mean_power_idle) * duration_fpga_kd
power_consumption_cpu_kd = (mean_power_cpu_kd-mean_power_idle) * duration_cpu_kd
power_consumption_cpu_lin = (mean_power_cpu_lin-mean_power_idle) * duration_cpu_lin

%calculate power consumption per point in jules
power_consumption_per_point_fpga_kd = power_consumption_fpga_kd / n_points_processed_kd
power_consumption_per_point_cpu_kd = power_consumption_cpu_kd / n_points_processed_kd
power_consumption_per_point_cpu_lin = power_consumption_cpu_lin / n_points_processed_lin

%calculate reduction
reduction_per_point = (power_consumption_per_point_cpu_kd - power_consumption_per_point_fpga_kd) / power_consumption_per_point_cpu_kd