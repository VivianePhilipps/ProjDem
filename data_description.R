## Description of the input data for the estimHI_3FDR function ##

library(MCSPCD)
data(data_MCSPCD_3FDR)


## incidence of dementia (2 versions) :
par(mfrow=c(1,2))
plot(a01_constant_values[which(a01_constant_values[,2]=="M"),1],a01_constant_values[which(a01_constant_values[,2]=="M"),60],type="l",ylim=c(0,0.25),xlab="age",ylab="dementia incidence",lwd=2,main="Initial incidence",col=1)
lines(a01_constant_values[which(a01_constant_values[,2]=="W"),1],a01_constant_values[which(a01_constant_values[,2]=="W"),60],col=2,lwd=2)
legend(x="topleft",box.lty=0,legend=c("Men","Women"),col=1:2,lwd=2,inset=0.05)
plot(a01_75pct_values[which(a01_75pct_values[,2]=="M"),1],a01_75pct_values[which(a01_75pct_values[,2]=="M"),60],type="l",ylim=c(0,0.25),xlab="age",ylab="dementia incidence",lwd=2,main="Alternative incidence",col=1)
lines(a01_75pct_values[which(a01_75pct_values[,2]=="W"),1],a01_75pct_values[which(a01_75pct_values[,2]=="W"),60],col=2,lwd=2)


## mortality of people without dementia, supposing the initial incidence of dementia :
par(mfcol=c(1,2),mgp=c(2,0.5,0),mar=c(5,4,4,2),tcl=-0.5)
plot(a02_constant_values[which(a02_constant_values[,2]=="M"),1],
     a02_constant_values[which(a02_constant_values[,2]=="M"),73],
     type="l",xlab="age",ylab="mortality",lwd=2,main="Men",ylim=c(0,1.2),col=1)
lines(a02_constant_values[which(a02_constant_values[,2]=="M"),1],
      a02_constant_values[which(a02_constant_values[,2]=="M"),93],
      lwd=2,col=2)
lines(a02_constant_values[which(a02_constant_values[,2]=="M"),1],
      as.numeric(a02_constant_values[which(a02_constant_values[,2]=="M"),73])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=3)
lines(a02_constant_values[which(a02_constant_values[,2]=="M"),1],
      as.numeric(a02_constant_values[which(a02_constant_values[,2]=="M"),93])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=4)
legend(x="topleft",legend=c("2020 - without dementia","2040 - without dementia","2020 - with dementia","2040 - with dementia"),lwd=2,col=1:4,box.lty=0,inset=0.05)

plot(a02_constant_values[which(a02_constant_values[,2]=="W"),1],
     a02_constant_values[which(a02_constant_values[,2]=="W"),73],
     type="l",xlab="age",ylab="mortality",lwd=2,main="Women",ylim=c(0,1.2),col=1)
lines(a02_constant_values[which(a02_constant_values[,2]=="W"),1],
      a02_constant_values[which(a02_constant_values[,2]=="W"),93],
      lwd=2,col=2)
lines(a02_constant_values[which(a02_constant_values[,2]=="W"),1],
      as.numeric(a02_constant_values[which(a02_constant_values[,2]=="W"),73])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=3)
lines(a02_constant_values[which(a02_constant_values[,2]=="W"),1],
      as.numeric(a02_constant_values[which(a02_constant_values[,2]=="W"),93])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=4)
legend(x="topleft",legend=c("2020 - without dementia","2040 - without dementia","2020 - with dementia","2040 - with dementia"),lwd=2,col=1:4,box.lty=0,inset=0.05)


## mortality of people without dementia, supposing the altervative incidence of dementia :
par(mfcol=c(1,2),mgp=c(2,0.5,0),mar=c(5,4,4,2),tcl=-0.5)
plot(a02_75pct_values[which(a02_75pct_values[,2]=="M"),1],
     a02_75pct_values[which(a02_75pct_values[,2]=="M"),73],
     type="l",xlab="age",ylab="mortality",lwd=2,main="Men",ylim=c(0,1.2),col=1)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="M"),1],
      a02_75pct_values[which(a02_75pct_values[,2]=="M"),93],
      lwd=2,col=2)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="M"),1],
      as.numeric(a02_75pct_values[which(a02_75pct_values[,2]=="M"),73])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=3)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="M"),1],
      as.numeric(a02_75pct_values[which(a02_75pct_values[,2]=="M"),93])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=4)
legend(x="topleft",legend=c("2020 - without dementia","2040 - without dementia","2020 - with dementia","2040 - with dementia"),lwd=2,col=1:4,box.lty=0,inset=0.05)

plot(a02_75pct_values[which(a02_75pct_values[,2]=="W"),1],
     a02_75pct_values[which(a02_75pct_values[,2]=="W"),73],
     type="l",xlab="age",ylab="mortality",lwd=2,main="Women",ylim=c(0,1.2),col=1)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="W"),1],
      a02_75pct_values[which(a02_75pct_values[,2]=="W"),93],
      lwd=2,col=2)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="W"),1],
      as.numeric(a02_75pct_values[which(a02_75pct_values[,2]=="W"),73])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=3)
lines(a02_75pct_values[which(a02_75pct_values[,2]=="W"),1],
      as.numeric(a02_75pct_values[which(a02_75pct_values[,2]=="W"),93])*as.numeric(rr_DvsND_values[1:40,2]),
      lwd=2,col=4)
legend(x="topleft",legend=c("2020 - without dementia","2040 - without dementia","2020 - with dementia","2040 - with dementia"),lwd=2,col=1:4,box.lty=0,inset=0.05)


## relative risk of dementia :
par(mfrow=c(1,1))
plot(rr_DvsND_values[which(rr_DvsND_values[,3]=="M"),1],rr_DvsND_values[which(rr_DvsND_values[,3]=="M"),2],type="l",xlab="age",ylab="RR",lwd=2,ylim=c(1,15))
lines(rr_DvsND_values[which(rr_DvsND_values[,3]=="W"),1],rr_DvsND_values[which(rr_DvsND_values[,3]=="W"),2],col=2,lwd=2)
legend(x="topright",box.lty=0,legend=c("Men","Women"),col=1:2,lwd=2)

## relative risk of dementia associated with the 3 risk factor (the value is constant accross the ages) :
theta01_HTA[c(1,42),]
theta01_DIAB[c(1,42),]
theta01_INACT[c(1,42),]

## relative risk of death associated with the 3 risk factor (the value is constant accross the ages) :
theta02_HTA[c(1,42),]
theta02_DIAB[c(1,42),]
theta02_INACT[c(1,42),]

## relative risk of death for people with dementia associated with the 3 risk factor (the value is constant accross the ages) :
theta12_HTA[c(1,42),]
theta12_DIAB[c(1,42),]
theta12_INACT[c(1,42),]


## incidence of diabetes :
plot(66:105,incid_glob[1:40,2],type="s",lwd=2,ylim=range(incid_glob[,2]),ylab='diabete incidence',xlab='age',col=1)
points(66:105,incid_glob[40+1:40,2],type="s",lwd=2,col=2)
legend("topright",legend=c("Men","Women"),col=1:2,lwd=2,box.lty=0,inset=0.05)


## prevalence of the 8 exposition groups at 65 years (for other ages, the prevalence is not used) :
prev_0_values[c(1,42),]
prev_1_values[c(1,42),]
prev_2_values[c(1,42),]
prev_3_values[c(1,42),]
prev_4_values[c(1,42),]
prev_5_values[c(1,42),]
prev_6_values[c(1,42),]
prev_7_values[c(1,42),]

## relative risk of diabetes associated to the tw other risk factors :
theta1_F
theta1_H
theta3_F
theta3_H
