function [ret] = myinit(price,len)
s=(1-len)*length(price);
ret = price(s:end);
end