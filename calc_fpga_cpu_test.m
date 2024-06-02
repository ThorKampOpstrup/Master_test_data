clc;
close all;

data_path = 'fpga_cpu_test/';

data = csvread(strcat(data_path, 'data.csv'));

fpga_duration = data(:,1);
cpu_duration = data(:,2);
cpu_linear_duration = data(:,3);

avg_fpga_duration = mean(fpga_duration)
avg_cpu_duration = mean(cpu_duration)
avg_cpu_linear_duration = mean(cpu_linear_duration)

std_fpga_duration = std(fpga_duration)
std_cpu_duration = std(cpu_duration)
std_cpu_linear_duration = std(cpu_linear_duration)

min_fpga_duration = min(fpga_duration)-avg_fpga_duration
min_cpu_duration = min(cpu_duration)-avg_cpu_duration
min_cpu_linear_duration = min(cpu_linear_duration)-avg_cpu_linear_duration

max_fpga_duration = max(fpga_duration)-avg_fpga_duration
max_cpu_duration = max(cpu_duration)-avg_cpu_duration
max_cpu_linear_duration = max(cpu_linear_duration)-avg_cpu_linear_duration

[h_fpga, p_fpga, ksstat_fpga, cv_fpga] = kstest(fpga_duration)
[h_cpu, p_cpu, ksstat_cpu, cv_cpu] = kstest(cpu_duration)

disp(['Kolmogorov-Smirnov Test p-value: ', num2str(p_fpga)]);
disp(['Kolmogorov-Smirnov Test p-value: ', num2str(p_cpu)]);

[h,p,ci,stats] = vartest2(fpga_duration, cpu_duration)

[p,h,stats] = ranksum(fpga_duration, cpu_duration)
