clear;clc;
%% Use AR to model the spot-instance price diff
%read data
readData

datalen = 1/3
priceA = myinit(priceA,datalen);
priceC = myinit(priceC,datalen);
priceD = myinit(priceD,datalen);
priceE = myinit(priceE,datalen);

diffA = diff(priceA);
diffC = diff(priceC);
diffD = diff(priceD);
diffE = diff(priceE);

[modelA,errA] = myAr(diffA);
[modelC,errC] = myAr(diffC);
[modelD,errD] = myAr(diffD);
[modelE,errE] = myAr(diffE);

predictA = predict(modelA,diffA,1);
predictC = predict(modelC,diffC,1);
predictD = predict(modelD,diffD,1);
predictE = predict(modelE,diffE,1);

evabase = 0.1;
ARdiffEvaNums = ones(4,5);
[ARdiffEvaNums(1,1),ARdiffEvaNums(1,2),ARdiffEvaNums(1,3),ARdiffEvaNums(1,4),ARdiffEvaNums(1,5)] = evaluate(priceA(2:end),predictA+priceA(1:end-1),evabase);
[ARdiffEvaNums(2,1),ARdiffEvaNums(2,2),ARdiffEvaNums(2,3),ARdiffEvaNums(2,4),ARdiffEvaNums(2,5)] = evaluate(priceC(2:end),predictC+priceC(1:end-1),evabase);
[ARdiffEvaNums(3,1),ARdiffEvaNums(3,2),ARdiffEvaNums(3,3),ARdiffEvaNums(3,4),ARdiffEvaNums(3,5)] = evaluate(priceD(2:end),predictD+priceD(1:end-1),evabase);
[ARdiffEvaNums(4,1),ARdiffEvaNums(4,2),ARdiffEvaNums(4,3),ARdiffEvaNums(4,4),ARdiffEvaNums(4,5)] = evaluate(priceE(2:end),predictE+priceE(1:end-1),evabase);

cd (PATH);
fprintf('Saving Data......\n');
save resultARdiff ARdiffEvaNums;
cd '/Users/wxc575843/Documents/papers/fxu/code2/'
