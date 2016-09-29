%% Use Mean Value or Linear Regression to Estimate Spot Instance Price
% readData.m read data in data_1a,data_1b,data_1c,data_1d,data_1e
% myautocorr.m figure out how much value use to estimate price

clear;
clc;
%% Read in data
readData;

%% Set evalute base 
evaBase = 0.1;
%% Figure out which value to use
myautocorr;

%% =================================Predict Price===========================

% ----------------------------------mean value-----------------------------
% init
len = 1/3;
[Xa,Ya] = initData(price1a,numa,len);
[Xc,Yc] = initData(price1c,numcmlen);
[Xd,Yd] = initData(price1d,numd,len);
[Xe,Ye] = initData(price1e,nume,len);

% use mean value to predict price
meanPredictA = mean(Xa(:,2:end),2);
% meanPredictB = mean(Xb(:,2:end),2);
meanPredictC = mean(Xc(:,2:end),2);
meanPredictD = mean(Xd(:,2:end),2);
meanPredictE = mean(Xe(:,2:end),2);

%evalute 

% meanEvaNums = ones(3,4);
meanEvaNums = ones(4,5);
[meanEvaNums(1,1),meanEvaNums(1,2),meanEvaNums(1,3),meanEvaNums(1,4),meanEvaNums(1,5)]=evaluate(price1a(1:length(price1a)-numa),meanPredictA,evaBase);
[meanEvaNums(2,1),meanEvaNums(2,2),meanEvaNums(2,3),meanEvaNums(2,4),meanEvaNums(2,5)]=evaluate(price1c(1:length(price1c)-numc),meanPredictC,evaBase);
[meanEvaNums(3,1),meanEvaNums(3,2),meanEvaNums(3,3),meanEvaNums(3,4),meanEvaNums(3,5)]=evaluate(price1d(1:length(price1d)-numd),meanPredictD,evaBase);
[meanEvaNums(4,1),meanEvaNums(4,2),meanEvaNums(4,3),meanEvaNums(4,4),meanEvaNums(4,5)]=evaluate(price1e(1:length(price1e)-nume),meanPredictE,evaBase);

% %plot pictures
% cd '/Users/wxc575843/Documents/papers/fxu/code'
% figure(1)
% myplot(meanPredictA,Ya,[Ptitle,'\_useast1a_mean']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1a_mean.eps'],'psc2');
% cd '/Users/wxc575843/Documents/papers/fxu/code'
% myplot(meanPredictC,Yc,[Ptitle,'\_useast1c']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1c_mean.eps'],'psc2')
% cd '/Users/wxc575843/Documents/papers/fxu/code'
% myplot(meanPredictD,Yd,[Ptitle,'\_useast1d']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1d_mean.eps'],'psc2')
% cd '/Users/wxc575843/Documents/papers/fxu/code'
% myplot(meanPredictE,Ye,[Ptitle,'\_useast1e']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1e_mean.eps'],'psc2')

%use linear regression, poly regression, neural net to predict
%init

cd '/Users/wxc575843/Documents/papers/fxu/code'

%divid dataset into training set and test set
[XaTrain,XaTest] = dividData(Xa);
[YaTrain,YaTest] = dividData(Ya);
[XcTrain,XcTest] = dividData(Xc);
[YcTrain,YcTest] = dividData(Yc);
[XdTrain,XdTest] = dividData(Xd);
[YdTrain,YdTest] = dividData(Yd);
[XeTrain,XeTest] = dividData(Xe);
[YeTrain,YeTest] = dividData(Ye);

%linear regression
alphaA = regress(YaTrain,XaTrain);
autopredA = XaTest*alphaA;
alphaC = regress(YcTrain,XcTrain);
autopredC = XcTest*alphaC;
alphaD = regress(YdTrain,XdTrain);
autopredD = XdTest*alphaD;
alphaE = regress(YeTrain,XeTrain);
autopredE = XeTest*alphaE;

%evalute
% AutoLinearEvaNums = ones(3,4);
AutoLinearEvaNums = ones(4,5);
[AutoLinearEvaNums(1,1),AutoLinearEvaNums(1,2),AutoLinearEvaNums(1,3),AutoLinearEvaNums(1,4),AutoLinearEvaNums(1,5)]=evaluate(YaTest,autopredA,evaBase);
[AutoLinearEvaNums(2,1),AutoLinearEvaNums(2,2),AutoLinearEvaNums(2,3),AutoLinearEvaNums(2,4),AutoLinearEvaNums(2,5)]=evaluate(YcTest,autopredC,evaBase);
[AutoLinearEvaNums(3,1),AutoLinearEvaNums(3,2),AutoLinearEvaNums(3,3),AutoLinearEvaNums(3,4),AutoLinearEvaNums(3,5)]=evaluate(YdTest,autopredD,evaBase);
[AutoLinearEvaNums(4,1),AutoLinearEvaNums(4,2),AutoLinearEvaNums(4,3),AutoLinearEvaNums(4,4),AutoLinearEvaNums(4,5)]=evaluate(YeTest,autopredE,evaBase);

% 
% predA = myLinearRegression(XaTrain,YaTrain,XaTest);
% predC = myLinearRegression(XcTrain,YcTrain,XcTest);
% predD = myLinearRegression(XdTrain,YdTrain,XdTest);
% predE = myLinearRegression(XeTrain,YeTrain,XeTest);
% 
% %evalute
% % linEvaNums = ones(3,4);
% linEvaNums = ones(4,4);
% [linEvaNums(1,1),linEvaNums(1,2),linEvaNums(1,3),linEvaNums(1,4)]=evaluate(YaTest,predA,evaBase);
% [linEvaNums(2,1),linEvaNums(2,2),linEvaNums(2,3),linEvaNums(2,4)]=evaluate(YcTest,predC,evaBase);
% [linEvaNums(3,1),linEvaNums(3,2),linEvaNums(3,3),linEvaNums(3,4)]=evaluate(YdTest,predD,evaBase);
% [linEvaNums(4,1),linEvaNums(4,2),linEvaNums(4,3),linEvaNums(4,4)]=evaluate(YdTest,predD,evaBase);

% figure(1)
% cd '/Users/wxc575843/Documents/papers/fxu/code';myplot(autopredA,YaTest,[Ptitle,'\_useast1a\_Linear']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1a_Linear.eps'],'psc2')
% cd '/Users/wxc575843/Documents/papers/fxu/code';myplot(autopredC,YcTest,[Ptitle,'\_useast1c\_Linear']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1c_Linear.eps'],'psc2')
% cd '/Users/wxc575843/Documents/papers/fxu/code';myplot(autopredD,YdTest,[Ptitle,'\_useast1d\_Linear']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1d_Linear.eps'],'psc2')
% cd '/Users/wxc575843/Documents/papers/fxu/code';myplot(autopredE,YeTest,[Ptitle,'\_useast1e\_Linear']);
% cd '/Users/wxc575843/Documents/papers/fxu/pic';saveas(gcf,[Ptitle,'_useast1e_Linear.eps'],'psc2')

cd (PATH);
fprintf('Saving Data......\n');
save result meanEvaNums AutoLinearEvaNums;
cd '/Users/wxc575843/Documents/papers/fxu/code/'
