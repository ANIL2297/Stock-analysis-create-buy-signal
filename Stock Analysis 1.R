library(quantmod)
library(tidyverse)
tsla<-getSymbols("TSLA",auto.assign = F)
head(tsla)
tsla_cl<-tsla$TSLA.Close
head(tsla)
options(scipen = 9999)
daily_change<- tsla_cl/lag(tsla_cl,1)-1
head(daily_change)
hist(daily_change,40,col = "blue")
buy_signal<-0.04
signal<-c(NULL)
for(i in 2: length(tsla_cl)){
  if(daily_change[i]>buy_signal){
    signal[i]<-1
  }else
    signal[i]<-0
}
signal<-reclass(signal,tsla_cl)
head(signal)
chartSeries(tsla_cl,type="l",subset = "2011-01::2012-01" ,theme = chartTheme("white"))
addTA(signal,type="S",col="red")
