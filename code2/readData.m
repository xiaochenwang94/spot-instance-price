% PATH='/Users/wxc575843/Documents/papers/fxu/code/data/useast/m3medium'; Ptitle='m3.medium';
% PATH='/Users/wxc575843/Documents/papers/fxu/code/data/useast/m4xlarge'; Ptitle='m4.large';
% PATH='/Users/wxc575843/Documents/papers/fxu/code/data/useast/g22xlarge'; Ptitle='g2.2xlarge';
% PATH='/Users/wxc575843/Documents/papers/fxu/code/data/useast/d28xlarge'; Ptitle='d2.8xlarge';
PATH='/Users/wxc575843/Documents/papers/fxu/code/data/useast/r3large'; Ptitle='r2.large';

cd(PATH);
data_1a=readtable('useast1a.txt','Delimiter',' ','ReadVariableNames',true);
data_1b=readtable('useast1b.txt','Delimiter',' ','ReadVariableNames',true);
data_1c=readtable('useast1c.txt','Delimiter',' ','ReadVariableNames',true);
data_1d=readtable('useast1d.txt','Delimiter',' ','ReadVariableNames',true);
data_1e=readtable('useast1e.txt','Delimiter',' ','ReadVariableNames',true);


priceA=table2array(data_1a);
% priceb=table2array(data_1b);
priceC=table2array(data_1c);
priceD=table2array(data_1d);
priceE=table2array(data_1e);


cd '/Users/wxc575843/Documents/papers/fxu/code2/'