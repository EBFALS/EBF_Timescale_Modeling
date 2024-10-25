meandatafun<-function(time,ii,jj){
      library(ggm)
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
      return(meandata)
}
