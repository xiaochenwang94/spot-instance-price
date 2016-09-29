function [X,Y]=initData(price,num,len)
%% Prepare Data for X and Y. 
s=(1-len)*length(price);
price = price(s:end);
X = ones(length(price)-num,num+1);
Y = ones(length(price)-num,1);
for i=1:length(price)-num
    X(i,2:end)=price(i:i+num-1);
end
Y = price(num+1:end);
end
