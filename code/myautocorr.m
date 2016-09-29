price1a=table2array(data_1a);
% price1b=table2array(data_1b);
price1c=table2array(data_1c);
price1d=table2array(data_1d);
price1e=table2array(data_1e);

autocorrbase=0.6;

len = 1/3;
s = (1-len)*length(price1a);
price1a=price1a(s:end);
price1c=price1c(s:end);
price1d=price1d(s:end);
price1e=price1e(s:end);

autoa=autocorr(price1a(end:-1:1));
% autob=autocorr(price1b);
autoc=autocorr(price1c(end:-1:1));
autod=autocorr(price1d(end:-1:1));
autoe=autocorr(price1e(end:-1:1));

numa = length(find(autoa>autocorrbase));
numc = length(find(autoc>autocorrbase));
numd = length(find(autod>autocorrbase));
nume = length(find(autoe>autocorrbase));

