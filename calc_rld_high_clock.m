%clear;
%close all;

data_path = '220MHz_rld/';

rld_220 =    csvread(strcat(data_path, 'rld.csv'));
no_rld_220 = csvread(strcat(data_path, 'no_rld.csv'));

rld_220 = rld_220/1000; %convert to ms
no_rld_220 = no_rld_220/1000; %convert to ms

mean_rld_220 = mean(rld_220)
mean_no_rld_220 = mean(no_rld_220)

n_poins = 21000;
index_dim = 3;
data_dim = 3;

%both use 32 bit integers
bits_per_point = data_dim*32

data_size = bits_per_point*n_poins
index_size = bits_per_point*n_poins

%mean_rld and mean_no_rld are in ms
t_difference = mean_rld_220 - mean_no_rld_220
t_difference_s = t_difference/1000

b_per_s = (data_size+index_size)/t_difference_s
Mb_per_s = b_per_s/1000000
Gb_per_s = b_per_s/1000000000

GB_per_s = Gb_per_s/8

GB_per_s_slow = 1.0027 %from calc_rld.m

diff = GB_per_s - GB_per_s_slow
pct = (diff)/GB_per_s_slow*100

mean_rld_slow = 42.094957000000030
mean_no_rld_slow = 41.592303599999980

mean_slow = (mean_rld_slow+mean_no_rld_slow)/2
mean_fast = (mean_rld_220+mean_no_rld_220)/2

diff_mean = mean_slow-mean_fast
diff_mean_no_rld = mean_no_rld_slow-mean_no_rld_220
diff_mean_rld = mean_rld_slow-mean_rld_220

pct_mean = diff_mean/mean_slow*100
pct_mean_no_rld = diff_mean_no_rld/mean_no_rld_slow*100
pct_mean_rld = diff_mean_rld/mean_rld_slow*100

