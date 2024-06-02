clear;
close all;

%%a single test for no reload showed 44287, significantly higher than all other data, it is asumed to be an outlier, and is removed

data_path = 'reload_tree_test/';

rld = csvread(strcat(data_path, 'rld.csv'));
no_rld = csvread(strcat(data_path, 'no_rld.csv'));

%convert to ms
rld=rld/1000;
no_rld=no_rld/1000;


mean_rld = mean(rld)
mean_no_rld = mean(no_rld)

std_rld = std(rld)
std_no_rld = std(no_rld)

min_rld = min(rld)
min_no_rld = min(no_rld)

max_rld = max(rld)
max_no_rld = max(no_rld)

%plot histograms with Freedman-Diaconis
figure;
histogram(rld, 25);
hold on;
histogram(no_rld, 25, 'FaceColor', 'r');
title('Reload tree test');
xlabel('Time [ms]');
ylabel('Frequency');
legend('Reload tree', 'No reload tree');


n_poins =21000;
index_dim = 3;
data_dim = 3;

%both use 32 bit integers
bits_per_point = data_dim*32


data_size = bits_per_point*n_poins
index_size = bits_per_point*n_poins

%mean_rld and mean_no_rld are in ms
t_difference = mean_rld - mean_no_rld
t_difference_s = t_difference/1000

b_per_s = (data_size+index_size)/t_difference_s
Mb_per_s = b_per_s/1000000
Gb_per_s = b_per_s/1000000000

GB_per_s = Gb_per_s/8