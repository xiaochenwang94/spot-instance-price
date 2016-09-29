clear
clc
data = readtable('./data/m4.xlarge.linux.txt','Delimiter','\t','ReadVariableNames',true);
price = table2array(data(:,2));
price = price(1:20000);
[r,c] = size(price);
price_train = price(1:r*2/3);
price_test = price(r*2/3:size(price));

price_train_index = ceil(price_train/max(price_train)*100);
max(price_train_index)

size(price_train_index)
% average_price = mean(price);
% var_price = var(price);
% max_price = max(price);
% min_price = min(price);
% hist(price);

state_num = 4;
T_Guess = rand(4);
M_Guess = rand(4,100);


[T,M] = hmmtrain(price_train_index,T_Guess,M_Guess);
[r_test,c_test] = size(price_test);
[seq,states] = hmmgenerate(r_test,T,M);
hold on
plot(seq,'b')
plot(price_test/max(price_train)*100,'r+');
hold off
