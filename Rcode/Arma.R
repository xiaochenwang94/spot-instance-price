#read data 
setwd("/Users/wxc575843/Documents/papers/fxu/code/data/useast/m3medium/")
# price=read.table("useast1a.txt",header = TRUE)
w=read.table("tmp.txt",header = TRUE)
price = w[length(w[,2]):1,2]
time<-strptime(w[,3],"%Y-%m-%dT%H:%M:%S")
time<-time[length(time):1]

#sample every five minutes

price_sample_function<-function(price,time)
{
  a<-c(1);i<-1;j<-1
  len<-length(time)
  t=time[1]
  while (j<len) {
    # t = time[j]
    while (t<time[j+1]) {
      a[i]=price[j]
      i=i+1
      t=t+300 #add 300 seconds
    }
    j=j+1
  }
  return(a)
}

sample_price<-price_sample_function(price,time)


num_train=round(2*nrow(price)/3)
num_test=nrow(price)-num_train
price_train<-price[1:num_train,1]
price_test<-price[-c(1:num_train),1]

library(forecast)
a<-auto.arima(price_train,ic="bic")
f<-forecast(a,num_test)
plot(price_test,col='red',type="l")
lines(f$mean)
plot(f$fitted,col="blue",add=T)
