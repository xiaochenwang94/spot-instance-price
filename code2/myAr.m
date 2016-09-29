function [m,e]=myAr(price)
x = zscore(price);
ts = iddata(x);
m = ar(ts,1,'ls')
% compare(ts,m,'r-.',1);
e=resid(m,ts);
% autocorr(price)
% pause;
% parcorr(price)
% pause;
end