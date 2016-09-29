args<-commandArgs(TRUE)
setwd(args)

files<-c("useast1a.txt","useast1c.txt","useast1d.txt","useast1e.txt")
for(k in 1:4){
  #read
  filename = files[k]
  data<-read.table(filename,header = TRUE)
  #pick up
  price<-data[,2];price<-price[length(price):1];
  time<-data[,3];time<-time[length(time):1];
  time<-strptime(time,"%Y-%m-%dT%H:%M:%S")
  #insert
  res<-c(1);i<-1;j<-1
  len<-length(time)
  t=time[1]
  while (j<len) {
    while (t<time[j+1]) {
      res[i]=price[j]
      i=i+1
      t=t+300 #add 300 seconds
    }
    j=j+1
  }
  #save
  write.table(res,files[k],quote = FALSE,row.names = FALSE)
}
