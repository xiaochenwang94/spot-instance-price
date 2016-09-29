function [Train,Test]=dividData(X,dividenum)
if nargin<2
    dividenum=2/3;
end
train_num = round(length(X)*dividenum);
test_num = length(X)-train_num;
Train = X(1:train_num,:);
Test = X(train_num+1:end,:);
end