#找到滑动间隔，并作平均
rm(list=ls())
mydates<-as.Date(c("2011-02-21","2011-07-14","2011-11-13",
                   "2012-03-06","2012-07-29","2012-11-04",
                   "2013-02-13","2013-07-25","2013-11-15",
                   "2014-02-14","2014-07-24","2014-11-19"))
GCC=read.csv(file.choose(),header = T)     #选择读取GCC文件
GCC$TIME<-as.Date(GCC$TIME,"%Y/%m/%d")
Y=read.csv(file.choose(),header = T)     #选择读取因变量文件
Y$TIME<-as.Date(Y$TIME,"%Y/%m/%d")
Con=read.csv(file.choose(),header = T)     #选择读取控制变量文件
Con$TIME<-as.Date(Con$TIME,"%Y/%m/%d")

library(lubridate)
startdate<-ymd("2011-01-01")
enddate<-ymd("2014-12-31")
numday<-as.numeric(enddate-startdate)
TIME<-startdate+days(0:numday)
data<-data.frame(TIME)
library("dplyr")
u<-full_join( data, GCC, by = 'TIME') #把缺失值标记为NA

data_merge <- (merge(Y, u[,1:2], by = 'TIME'))
data_merge <- (merge(Y, u[,-2], by = 'TIME'))
all_data <- (merge(data_merge, Con, by = 'TIME'))

year1_sos <- all_data[which(all_data$TIME>= mydates[1] & all_data$TIME<=mydates[2]),]
year2_sos <- all_data[which(all_data$TIME>=mydates[4]  & all_data$TIME<=mydates[5]),]
year3_sos <- all_data[which(all_data$TIME>=mydates[7]  & all_data$TIME<=mydates[8]),]
year4_sos <- all_data[which(all_data$TIME>=mydates[10]  & all_data$TIME<=mydates[11]),]


source('D:/文献/生态/20230313改稿后数据代码及结论/meanfun.R')    #加载函数，需要调整相应的工作目录
n1<-10#最大间隔数
n2<-30 #最大平均天数
result <- meanfun(year1_sos,n1,n2)  #输入第二年的sos期，找到使得偏相关系数最大的间隔天数以及平均天数
ii<-result[1]    #ii为求得间隔天数
jj<-result[2]+1  #jj为求得平均天数

source('D:/文献/生态/20230313改稿后数据代码及结论/meandatafun.R')    #加载函数，需要调整相应的工作目录
meandata <- meandatafun(year1_sos,ii,jj)   #输入得到的天数，计算相应间隔ii天后平均jj天的数据
pcor(c(2,5,3,4),cov(meandata))              #此数据后的偏相关系数
cor(meandata[,2],meandata[,5])

fit1 <- lm(meandata$LUE~meandata$gcc)       #得到数据的回归拟合
summary(fit1)
plot(meandata$gcc,meandata$LUE,,xlab="mean_gcc",ylab="mean_LUE")             #画图
lines(meandata$gcc,fitted(fit1),col="red") 
legend("top",legend="2011",bty="n")
rsq <- summary(fit1)$r.squared
####(2011)
text (0.398, 0.54 , expression(R^2== 0.9642))
text (0.40, 0.51 , expression(P== 1.596e-11))

####2012
source('D:/文献/生态/20230313改稿后数据代码及结论/meanfun.R')    #加载函数，需要调整相应的工作目录
n1<-10 #最大间隔数
n2<-30 #最大平均天数
result <- meanfun(year2_sos,n1,n2)  #输入第二年的sos期，找到使得偏相关系数最大的间隔天数以及平均天数
ii<-result[1]    #ii为求得间隔天数
jj<-result[2]+1  #jj为求得平均天数
source('D:/文献/生态/20230313改稿后数据代码及结论/meandatafun.R')    #加载函数，需要调整相应的工作目录
meandata <- meandatafun(year2_sos,ii,jj)   #输入得到的天数，计算相应间隔ii天后平均jj天的数据
pcor(c(2,5,3,4),cov(meandata))              #此数据后的偏相关系数
cor(meandata[,2],meandata[,5])

fit2 <- lm(meandata$LUE~meandata$gcc)       #得到数据的回归拟合
summary(fit2)
plot(meandata$gcc,meandata$LUE,,xlab="mean_gcc",ylab="mean_LUE")             #画图
lines(meandata$gcc,fitted(fit2),col="red") 
legend("top",legend="2012",bty="n")
text (0.409, 0.64 , expression(R^2==0.3935))
text (0.409, 0.61 , expression(P== 0.01231))

####2013
source('D:/文献/生态/20230313改稿后数据代码及结论/meanfun.R')    #加载函数，需要调整相应的工作目录
n1<-10 #最大间隔数
n2<-30 #最大平均天数
result <- meanfun(year3_sos,n1,n2)  #输入第二年的sos期，找到使得偏相关系数最大的间隔天数以及平均天数
ii<-result[1]    #ii为求得间隔天数
jj<-result[2]+1  #jj为求得平均天数
source('D:/文献/生态/20230313改稿后数据代码及结论/meandatafun.R')    #加载函数，需要调整相应的工作目录
meandata <- meandatafun(year3_sos,ii,jj)   #输入得到的天数，计算相应间隔ii天后平均jj天的数据
pcor(c(2,5,3,4),cov(meandata))              #此数据后的偏相关系数
cor(meandata[,2],meandata[,5])

fit3 <- lm(meandata$LUE~meandata$gcc)       #得到数据的回归拟合
summary(fit3)
plot(meandata$gcc,meandata$LUE,,xlab="mean_gcc",ylab="mean_LUE")             #画图
lines(meandata$gcc,fitted(fit3),col="red") 
legend("top",legend="2013",bty="n")
text (0.40, 0.69 , expression(R^2==0.9287))
text (0.402, 0.655 , expression(P==2.389e-12))

####2014
source('D:/文献/生态/20230313改稿后数据代码及结论/meanfun.R')    #加载函数，需要调整相应的工作目录
n1<-10 #最大间隔数
n2<-30 #最大平均天数
result <- meanfun(year4_sos,n1,n2)  #输入第二年的sos期，找到使得偏相关系数最大的间隔天数以及平均天数
ii<-result[1]    #ii为求得间隔天数
jj<-result[2]+1  #jj为求得平均天数
source('D:/文献/生态/20230313改稿后数据代码及结论/meandatafun.R')    #加载函数，需要调整相应的工作目录
meandata <- meandatafun(year4_sos,ii,jj)   #输入得到的天数，计算相应间隔ii天后平均jj天的数据
#ccf(meandata$gcc, meandata$LUE, lag.max =  3, type = "correlation",plot = TRUE)
pcor(c(2,5,3,4),cov(meandata))              #此数据后的偏相关系数
cor(meandata[,2],meandata[,5])

fit4 <- lm(meandata$LUE~meandata$gcc+meandata$Temperature+meandata$Precipitation)       #得到数据的回归拟合
fit4 <- lm(meandata$LUE~meandata$gcc)       #得到数据的回归拟合
summary(fit4)
plot(meandata$gcc,meandata$LUE,,xlab="mean_gcc",ylab="mean_LUE")             #画图
lines(meandata$gcc,fitted(fit4),col="red") 
legend("top",legend="2014",bty="n")
text (0.410, 0.53 , expression(R^2==0.4724))
text (0.412, 0.50 , expression(P==0.001623))