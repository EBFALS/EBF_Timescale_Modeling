meanfun<-function(time,n1,n2){
    library(ggm)
    pcorr<- matrix(0,n1,n2-1)

    for (ii in 1:n1){
      for (jj in 2:n2){
      num<-nrow(time)
      #num<-nrow(data1)
      idx1<-seq(1,num,by=ii)
      cc = data.frame( gcc = numeric(nrow(matrix(idx1)) ))
      #cc = data.frame( exG = numeric(nrow(matrix(idx1)) ))
      for (i in 1:nrow(matrix(idx1)))
      {
        c<-time$gcc[idx1[i]:(idx1[i]+jj)]
        #c<-time$exG[idx1[i]:(idx1[i]+jj)]
        #c<-data1$gcc[idx1[i]:(idx1[i]+jj)]
        c<- na.omit(c)
        cc[i,1]<-mean(c)
      }

      num2<-nrow(time)
      #num2<-nrow(data1)
      idx2<-seq(1,num2,by=ii)
      nn <- nrow(matrix(idx2))
      dd = data.frame(uWUE = numeric(nn),LUEfpar = numeric(nn),
           Temperature = numeric(nn),Precipitation = numeric(nn) ) 
      for (j in 1:nn)
      {
        d<-time[idx2[j]:(idx2[j]+jj),c(2,5,7,8)]
        #d<-data1[idx2[j]:(idx2[j]+jj),c(-1,-4)]
        d<- na.omit(d)
        dd[j,]<-apply(d,2,mean)
      }
      meandata<-cbind(dd,cc)
      meandata<- na.omit(meandata)
      #cor(meandata)
      pcorr[ii,jj-1]<-pcor(c(2,5,3,4),cov(meandata))
      #pcorr[ii,jj-4]<-cor(meandata[,2],meandata[,5])
      }
    }
    write.csv(pcorr,file="D:/文献/生态/20230313改稿后数据代码及结论/2014偏相关系数表 .csv")
    result<-which(pcorr==max(pcorr),arr.ind=T)
    #result <- list(a)
    return(result)
}
