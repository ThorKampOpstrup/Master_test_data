clc;
close all;

data_path_high = '220MHz/';
data_path_low = 'fpga_cpu_test/';

MHz220 = csvread(strcat(data_path_high, 'data.csv'));
MHz200 = csvread(strcat(data_path_low, 'data.csv'));


MHz200 = MHz200(:,1); %data from cpu is un here so its deleted

MHz200 = MHz200/1000; %convert to ms
MHz220 = MHz220/1000; %convert to ms

mean_220 = mean(MHz220)
mean_200 = mean(MHz200)

std_220 = std(MHz220)
std_200 = std(MHz200)

min_220 = min(MHz220)-mean_220
min_200 = min(MHz200)-mean_200

max_220 = max(MHz220)-mean_220
max_200 = max(MHz200)-mean_200

%calc how much faster 220MHz is compared to 200MHz
t_difference = mean_200 - mean_220
t_difference_s = t_difference/1000;

pct = t_difference/mean_200*100


figure;
histogram(MHz220, 25);
hold on;
histogram(MHz200, 25, 'FaceColor', 'r');
title('NN duration with 220MHz and 200MHz');
xlabel('Time [ms]');
ylabel('Frequency');
legend('220MHz', '200MHz');

dif_std = std_200 - std_220
pct_std = (std_200 - std_220)/std_200*100

