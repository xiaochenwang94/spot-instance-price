function []=myplot(pred,realprice,picturetile)
% plot two price pred and real
% myplot(pred, realprice)
% pred=pred(end:-1:1);
% realprice=realprice(end:-1:1);
plot(1:length(pred),pred,'b' , 1:length(realprice),realprice,'r')
legend('estimate price','real price')
title(picturetile)
% a=input('');
end