
# LIBRAIRIES Python
# Pyton 2.7 Numpy 1.14.5 Matplotlib 2.2.3
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cmx
import matplotlib
import sklearn.metrics

# Reference dataset of 61059 data
data = np.loadtxt('../../../DATA/data60K.DAT')
# Another reference dataset of 10K data with L other than 2,3,4,5
dataL = np.loadtxt('../../../DATA/dataL_10K.DAT')
# Training dataset of 20160 data (HR) or 700ish data (LR)
dataTrain = dataTrain = np.loadtxt('../../../DATA/dataHR20K.DAT') #LR

import sys
sys.path.insert(0,"../../../LIB")
import djinn as dj
sys.path.insert(0,"../../../LIB/LIBTEST")
import Mdjinn as mdj
dja = dj.load("dj9","../../../wk_HR/d9t6e10b/")

# Predictions on each dataset
prediction = dja.predict(data[:,0:3])
predictionL =  dja.predict(dataL[:,0:3])
predictionTrain =  dja.predict(dataTrain[:,0:3])

np.savetxt('pred60K.txt',prediction)
np.savetxt('predL10K.txt',predictionL)
np.savetxt('predT.txt',predictionTrain)
