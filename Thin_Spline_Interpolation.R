

library(fields)
library(MLmetrics)


dataTrain = read.table("./DATA/dataHR20K.DAT")

# Testing data
## Test M13
data_test_M13 = np.loadtxt('./DATA/dataVALID_interHR.DAT')


## Test L
data_test_M13_L = np.loadtxt('./DATA/dataVALIDL_interLR.DAT')



fit=Tps(dataTrain[,1:3],dataTrain[,4])
pr=predict(fit, data_test_M13[,1:3])
prL=predict(fit, data_test_M13_L[,1:3])
mean(abs(pr,data_test_M13[,4]))
mean(abs(prL,data_test_M13_L[,4]))
mean(abs(fit$fitted.values, dataTrain[,4]))

#write.table(pr,'predTpsHR.txt',row.names=F,col.names=F)
#write.table(prL,'predLTpsHR.txt',row.names=F,col.names=F)
#write.table(fit$fitted.values,'predTTpsHR.txt',row.names=F,col.names=F)