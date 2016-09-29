function [num1,num2,num3,num4,mse]=evaluate(Y,Ypred,base)
% [num1,num2,num3]=evaluate(Y,Ypred,base)
% num1 is the num (Ypred-Y)/Y>base
% num2 is the num (Y1-Y0)/Y0>base
% num3 is the num when (Ypred-Y)/Y>base and (Y1-Y0)/Y0>base
% num4 is total
[m,n]=size(Ypred);
Ypred1=reshape(Ypred,[m*n,1]);
[m,n]=size(Y);
Y1=reshape(Y,[m*n,1]);
num4 = m*n;

%mse
mse = sum((Ypred1-Y1).*(Ypred1-Y1))/num4;

%num1
index1 = abs(Ypred1-Y1)./Y1>base;
m = mean(abs(Ypred1-Y1)./Y1)
num1 = sum(index1);
%num2
Y2 = Y1(1:end-1);
Y1 = Y1(2:end);
index2 = abs(Y2-Y1)./Y1>base;
num2 = sum(index2);
%num3
index1=index1(1:length(index1)-1);
index3 = and(index1,index2);
num3=sum(index3);
end
