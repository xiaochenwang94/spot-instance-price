clear;clc;
%% Use AR to model the spot-instance price 
%read data
readData

datalen = 1/3
priceA = myinit(priceA,datalen);
priceC = myinit(priceC,datalen);
priceD = myinit(priceD,datalen);
priceE = myinit(priceE,datalen);


% use ar to estimate
[modelA,errA] = myAr(priceA);
[modelC,errC] = myAr(priceC);
[modelD,errD] = myAr(priceD);
[modelE,errE] = myAr(priceE);

predictA = predict(modelA,priceA,1);
predictC = predict(modelC,priceC,1);
predictD = predict(modelD,priceD,1);
predictE = predict(modelE,priceE,1);

evabase = 0.1;
AREvaNums = ones(4,5);
[AREvaNums(1,1),AREvaNums(1,2),AREvaNums(1,3),AREvaNums(1,4),AREvaNums(1,5)] = evaluate(priceA,predictA,evabase);
[AREvaNums(2,1),AREvaNums(2,2),AREvaNums(2,3),AREvaNums(2,4),AREvaNums(2,5)] = evaluate(priceC,predictC,evabase);
[AREvaNums(3,1),AREvaNums(3,2),AREvaNums(3,3),AREvaNums(3,4),AREvaNums(3,5)] = evaluate(priceD,predictD,evabase);
[AREvaNums(4,1),AREvaNums(4,2),AREvaNums(4,3),AREvaNums(4,4),AREvaNums(4,5)] = evaluate(priceE,predictE,evabase);




cd (PATH);
fprintf('Saving Data......\n');
save resultAR AREvaNums;
cd '/Users/wxc575843/Documents/papers/fxu/code2/'
