
#TS series statistics

#install.packages("Rcpp", dependencies = TRUE, INSTALL_opts = '--no-lock') 
#cuando se complica la instalacion problemas de lock
#lee archivos procesamiento de las señales en Octave y
 
library("DescTools", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("tools", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("tcltk", lib.loc="/usr/lib/R/library")
library("car", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("effsize", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("rmatio", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
#library("asbio", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("ggplot2", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
library("lomb", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
source("~/Pruebas_R/Pruebas/clc.R")
source("~/Pruebas_R/Pruebas/bland_altman_no_parametrico.R")
source("~/Pruebas_R/Pruebas/ci_Spearman.R")
source("~/Pruebas_R/Pruebas/calculo_B_A.R")
source("~/Pruebas_R/Pruebas/B_A_no_PAR.R")
source("~/Pruebas_R/Pruebas/ci.median.R")


CRC_STC_TS<-list()
CRC_STC_A_TS<-list()
CRC_STC_P_TS<-list()
CRC_STA_TS<-list()
CRC_STP_TS<-list()
CRC_STB_TS<-list()
CRC_STB_A_TS<-list()
CRC_STB_P_TS<-list()

CRC_SUC_TS<-list()
CRC_SUC_A_TS<-list()
CRC_SUC_P_TS<-list()
CRC_SUA_TS<-list()
CRC_SUP_TS<-list()
CRC_SUB_TS<-list()
CRC_SUB_A_TS<-list()
CRC_SUB_P_TS<-list()

#### Inicio Datos CONTROL PARADO ##############################
#x<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14) #completo  
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14) #sin sujeto 3 
#x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
#x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
lstc<-length(x)
for(i in 1:lstc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STC-TS.mat",sep="")
  CRC_STC_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STC-TS.mat",sep="")
  CRC_STC_A_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STC-TS.mat",sep="")
  CRC_STC_P_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO PARASIMPATICO ##############################

x<-c(02,04,06,07,09,11,13)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STA-TS.mat",sep="")
  CRC_STA_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO SIMPATICO ##############################
#x<-c(01,03,05,08,10,12,14)
x<-c(03,05,08,10,12,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STP-TS.mat",sep="")
  CRC_STP_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO TOTAL ##############################
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STB-TS.mat",sep="")
  CRC_STB_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STB-TS.mat",sep="")
  CRC_STB_A_TS[[i]]<-read.mat(archivo_ND)
}

#x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
x<-c(01,05,08,10,12,14) #para comparar con P_propine notiene 3
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_STB-TS.mat",sep="")
  CRC_STB_P_TS[[i]]<-read.mat(archivo_ND)
}
#############################################################################################################################################################
#### Inicio Datos CONTROL SUPINO ##############################
#x<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14) #completo  
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14) #sin sujeto 3 
#x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
#x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
lsuc<-length(x)
for(i in 1:lsuc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUC-TS.mat",sep="")
  CRC_SUC_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine

lsuc<-length(x)
for(i in 1:lsuc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUC-TS.mat",sep="")
  CRC_SUC_A_TS[[i]]<-read.mat(archivo_ND)
}


x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
lsuc<-length(x)
for(i in 1:lsuc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUC-TS.mat",sep="")
  CRC_SUC_P_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO PARASIMPATICO ##############################
x<-c(02,04,06,07,09,11,13)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUA-TS.mat",sep="")
  CRC_SUA_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO SIMPATICO ##############################
x<-c(01,03,05,08,10,12,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUP-TS.mat",sep="")
  CRC_SUP_TS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO TOTAL ##############################
x<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUB-TS.mat",sep="")
  CRC_SUB_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUB-TS.mat",sep="")
  CRC_SUB_A_TS[[i]]<-read.mat(archivo_ND)
}

x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_TS_mat/CRC_",z,"_SUB-TS.mat",sep="")
  CRC_SUB_P_TS[[i]]<-read.mat(archivo_ND)
}

########################################################################
########## INICIO CALCULO INDICES VFC ##################################
########################################################################
####### INDICES CONTROL PARADO #########################################

cc<-7;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))


for (i in 1:7) {
  xx_RR[[i]]<-CRC_STC_A_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_A_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_A_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_A_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_A_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_A_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_A_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_A_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_A_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_A_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_A_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_A_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_A_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_A_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_A_TS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_A_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_A_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_A_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_A_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_A_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_A_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_A_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_A_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_A_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_A_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_A_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_A_TS[[i]]$CDOWN
}

CRC_STC_A_TS_RR<-xx_RR
CRC_STC_A_TS_HR<-xx_HR
CRC_STC_A_TS_CV<-xx_CV
CRC_STC_A_TS_pNN50<-xx_pNN50
CRC_STC_A_TS_SDHR<-xx_SDHR
CRC_STC_A_TS_SDNN<-xx_SDNN
CRC_STC_A_TS_rMSSD<-xx_rMSSD
CRC_STC_A_TS_PT<-xx_PT
CRC_STC_A_TS_VLF<-xx_VLF
CRC_STC_A_TS_LF<-xx_LF
CRC_STC_A_TS_LFun<-xx_LFun
CRC_STC_A_TS_HF<-xx_HF
CRC_STC_A_TS_HFun<-xx_HFun
CRC_STC_A_TS_rLH<-xx_rLH
CRC_STC_A_TS_S<-xx_S
CRC_STC_A_TS_SD1<-xx_SD1
CRC_STC_A_TS_SD2<-xx_SD2
CRC_STC_A_TS_SD12<-xx_SD12
CRC_STC_A_TS_SD21<-xx_SD21
CRC_STC_A_TS_SPS<-xx_SPS
CRC_STC_A_TS_SS<-xx_SS
CRC_STC_A_TS_SDRR<-xx_SDRR
CRC_STC_A_TS_GIp<-xx_GIp
CRC_STC_A_TS_SD1UP<-xx_SD1UP
CRC_STC_A_TS_SD1DOWN<-xx_SD1DOWN
CRC_STC_A_TS_CUP<-xx_CUP
CRC_STC_A_TS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_STC_P_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_P_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_P_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_P_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_P_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_P_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_P_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_P_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_P_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_P_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_P_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_P_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_P_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_P_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_P_TS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_P_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_P_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_P_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_P_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_P_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_P_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_P_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_P_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_P_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_P_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_P_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_P_TS[[i]]$CDOWN
}

CRC_STC_P_TS_RR<-xx_RR
CRC_STC_P_TS_HR<-xx_HR
CRC_STC_P_TS_CV<-xx_CV
CRC_STC_P_TS_pNN50<-xx_pNN50
CRC_STC_P_TS_SDHR<-xx_SDHR
CRC_STC_P_TS_SDNN<-xx_SDNN
CRC_STC_P_TS_rMSSD<-xx_rMSSD
CRC_STC_P_TS_PT<-xx_PT
CRC_STC_P_TS_VLF<-xx_VLF
CRC_STC_P_TS_LF<-xx_LF
CRC_STC_P_TS_LFun<-xx_LFun
CRC_STC_P_TS_HF<-xx_HF
CRC_STC_P_TS_HFun<-xx_HFun
CRC_STC_P_TS_rLH<-xx_rLH
CRC_STC_P_TS_S<-xx_S
CRC_STC_P_TS_SD1<-xx_SD1
CRC_STC_P_TS_SD2<-xx_SD2
CRC_STC_P_TS_SD12<-xx_SD12
CRC_STC_P_TS_SD21<-xx_SD21
CRC_STC_P_TS_SPS<-xx_SPS
CRC_STC_P_TS_SS<-xx_SS
CRC_STC_P_TS_SDRR<-xx_SDRR
CRC_STC_P_TS_GIp<-xx_GIp
CRC_STC_P_TS_SD1UP<-xx_SD1UP
CRC_STC_P_TS_SD1DOWN<-xx_SD1DOWN
CRC_STC_P_TS_CUP<-xx_CUP
CRC_STC_P_TS_CDOWN<-xx_CDOWN

### Control Parados (STC) 14 sujetos ##############

cc<-13;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))


for (i in 1:13) {
  xx_RR[[i]]<-CRC_STC_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_TS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_TS[[i]]$CDOWN
}

CRC_STC_TS_RR<-xx_RR
CRC_STC_TS_HR<-xx_HR
CRC_STC_TS_CV<-xx_CV
CRC_STC_TS_pNN50<-xx_pNN50
CRC_STC_TS_SDHR<-xx_SDHR
CRC_STC_TS_SDNN<-xx_SDNN
CRC_STC_TS_rMSSD<-xx_rMSSD
CRC_STC_TS_PT<-xx_PT
CRC_STC_TS_VLF<-xx_VLF
CRC_STC_TS_LF<-xx_LF
CRC_STC_TS_LFun<-xx_LFun
CRC_STC_TS_HF<-xx_HF
CRC_STC_TS_HFun<-xx_HFun
CRC_STC_TS_rLH<-xx_rLH
CRC_STC_TS_S<-xx_S
CRC_STC_TS_SD1<-xx_SD1
CRC_STC_TS_SD2<-xx_SD2
CRC_STC_TS_SD12<-xx_SD12
CRC_STC_TS_SD21<-xx_SD21
CRC_STC_TS_SPS<-xx_SPS
CRC_STC_TS_SS<-xx_SS
CRC_STC_TS_SDRR<-xx_SDRR
CRC_STC_TS_GIp<-xx_GIp
CRC_STC_TS_SD1UP<-xx_SD1UP
CRC_STC_TS_SD1DOWN<-xx_SD1DOWN
CRC_STC_TS_CUP<-xx_CUP
CRC_STC_TS_CDOWN<-xx_CDOWN


####### INDICES CONTROL SUPINO ###############################

cc<-7;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))


for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUC_A_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_A_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_A_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_A_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_A_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_A_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_A_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_A_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_A_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_A_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_A_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_A_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_A_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_A_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_A_TS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_A_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_A_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_A_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_A_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_A_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_A_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_A_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_A_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_A_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_A_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_A_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_A_TS[[i]]$CDOWN
}

CRC_SUC_A_TS_RR<-xx_RR
CRC_SUC_A_TS_HR<-xx_HR
CRC_SUC_A_TS_CV<-xx_CV
CRC_SUC_A_TS_pNN50<-xx_pNN50
CRC_SUC_A_TS_SDHR<-xx_SDHR
CRC_SUC_A_TS_SDNN<-xx_SDNN
CRC_SUC_A_TS_rMSSD<-xx_rMSSD
CRC_SUC_A_TS_PT<-xx_PT
CRC_SUC_A_TS_VLF<-xx_VLF
CRC_SUC_A_TS_LF<-xx_LF
CRC_SUC_A_TS_LFun<-xx_LFun
CRC_SUC_A_TS_HF<-xx_HF
CRC_SUC_A_TS_HFun<-xx_HFun
CRC_SUC_A_TS_rLH<-xx_rLH
CRC_SUC_A_TS_S<-xx_S
CRC_SUC_A_TS_SD1<-xx_SD1
CRC_SUC_A_TS_SD2<-xx_SD2
CRC_SUC_A_TS_SD12<-xx_SD12
CRC_SUC_A_TS_SD21<-xx_SD21
CRC_SUC_A_TS_SPS<-xx_SPS
CRC_SUC_A_TS_SS<-xx_SS
CRC_SUC_A_TS_SDRR<-xx_SDRR
CRC_SUC_A_TS_GIp<-xx_GIp
CRC_SUC_A_TS_SD1UP<-xx_SD1UP
CRC_SUC_A_TS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_A_TS_CUP<-xx_CUP
CRC_SUC_A_TS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUC_P_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_P_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_P_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_P_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_P_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_P_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_P_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_P_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_P_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_P_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_P_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_P_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_P_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_P_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_P_TS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_P_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_P_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_P_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_P_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_P_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_P_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_P_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_P_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_P_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_P_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_P_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_P_TS[[i]]$CDOWN
}

CRC_SUC_P_TS_RR<-xx_RR
CRC_SUC_P_TS_HR<-xx_HR
CRC_SUC_P_TS_CV<-xx_CV
CRC_SUC_P_TS_pNN50<-xx_pNN50
CRC_SUC_P_TS_SDHR<-xx_SDHR
CRC_SUC_P_TS_SDNN<-xx_SDNN
CRC_SUC_P_TS_rMSSD<-xx_rMSSD
CRC_SUC_P_TS_PT<-xx_PT
CRC_SUC_P_TS_VLF<-xx_VLF
CRC_SUC_P_TS_LF<-xx_LF
CRC_SUC_P_TS_LFun<-xx_LFun
CRC_SUC_P_TS_HF<-xx_HF
CRC_SUC_P_TS_HFun<-xx_HFun
CRC_SUC_P_TS_rLH<-xx_rLH
CRC_SUC_P_TS_S<-xx_S
CRC_SUC_P_TS_SD1<-xx_SD1
CRC_SUC_P_TS_SD2<-xx_SD2
CRC_SUC_P_TS_SD12<-xx_SD12
CRC_SUC_P_TS_SD21<-xx_SD21
CRC_SUC_P_TS_SPS<-xx_SPS
CRC_SUC_P_TS_SS<-xx_SS
CRC_SUC_P_TS_SDRR<-xx_SDRR
CRC_SUC_P_TS_GIp<-xx_GIp
CRC_SUC_P_TS_SD1UP<-xx_SD1UP
CRC_SUC_P_TS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_P_TS_CUP<-xx_CUP
CRC_SUC_P_TS_CDOWN<-xx_CDOWN

### Control Parados (STC) 14 sujetos ##############

#cc<-14;
cc<-13;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))

#hago 13 pero hay 14

for (i in 1:13) {
  xx_RR[[i]]<-CRC_SUC_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_TS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_TS[[i]]$CDOWN
}

CRC_SUC_TS_RR<-xx_RR
CRC_SUC_TS_HR<-xx_HR
CRC_SUC_TS_CV<-xx_CV
CRC_SUC_TS_pNN50<-xx_pNN50
CRC_SUC_TS_SDHR<-xx_SDHR
CRC_SUC_TS_SDNN<-xx_SDNN
CRC_SUC_TS_rMSSD<-xx_rMSSD
CRC_SUC_TS_PT<-xx_PT
CRC_SUC_TS_VLF<-xx_VLF
CRC_SUC_TS_LF<-xx_LF
CRC_SUC_TS_LFun<-xx_LFun
CRC_SUC_TS_HF<-xx_HF
CRC_SUC_TS_HFun<-xx_HFun
CRC_SUC_TS_rLH<-xx_rLH
CRC_SUC_TS_S<-xx_S
CRC_SUC_TS_SD1<-xx_SD1
CRC_SUC_TS_SD2<-xx_SD2
CRC_SUC_TS_SD12<-xx_SD12
CRC_SUC_TS_SD21<-xx_SD21
CRC_SUC_TS_SPS<-xx_SPS
CRC_SUC_TS_SS<-xx_SS
CRC_SUC_TS_SDRR<-xx_SDRR
CRC_SUC_TS_GIp<-xx_GIp
CRC_SUC_TS_SD1UP<-xx_SD1UP
CRC_SUC_TS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_TS_CUP<-xx_CUP
CRC_SUC_TS_CDOWN<-xx_CDOWN


####### INDICES PARADO BLOQUEO PARASIMPATICO ###############################

yy_RR<-(rep(0,7))
yy_HR<-(rep(0,7))
yy_CV<-(rep(0,7))
yy_pNN50<-(rep(0,7))
yy_SDHR<-(rep(0,7))
yy_SDNN<-(rep(0,7))
yy_rMSSD<-(rep(0,7))
yy_PT<-(rep(0,7))
yy_VLF<-(rep(0,7))
yy_LF<-(rep(0,7))
yy_LFun<-(rep(0,7))
yy_HF<-(rep(0,7))
yy_HFun<-(rep(0,7))
yy_rLH<-(rep(0,7))
yy_S<-(rep(0,7))
yy_SD1<-(rep(0,7))
yy_SD2<-(rep(0,7))
yy_SD12<-(rep(0,7))
yy_SD21<-(rep(0,7))
yy_SPS<-(rep(0,7))
yy_SS<-(rep(0,7))
yy_SDRR<-(rep(0,7))
yy_GIp<-(rep(0,7))
yy_SD1UP<-(rep(0,7))
yy_SD1DOWN<-(rep(0,7))
yy_CUP<-(rep(0,7))
yy_CDOWN<-(rep(0,7))



for (i in 1:7) {
  yy_RR[[i]]<-CRC_STA_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STA_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STA_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STA_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STA_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STA_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STA_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STA_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STA_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STA_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STA_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STA_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STA_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STA_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STA_TS[[i]]$S
  yy_SD1[[i]]<-CRC_STA_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STA_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STA_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STA_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STA_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_STA_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STA_TS[[i]]$SDRR
    yy_GIp[[i]]<-CRC_STA_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STA_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STA_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STA_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STA_TS[[i]]$CDOWN
}

CRC_STA_TS_RR<-yy_RR
CRC_STA_TS_HR<-yy_HR
CRC_STA_TS_CV<-yy_CV
CRC_STA_TS_pNN50<-yy_pNN50
CRC_STA_TS_SDHR<-yy_SDHR
CRC_STA_TS_SDNN<-yy_SDNN
CRC_STA_TS_rMSSD<-yy_rMSSD
CRC_STA_TS_PT<-yy_PT
CRC_STA_TS_VLF<-yy_VLF
CRC_STA_TS_LF<-yy_LF
CRC_STA_TS_LFun<-yy_LFun
CRC_STA_TS_HF<-yy_HF
CRC_STA_TS_HFun<-yy_HFun
CRC_STA_TS_rLH<-yy_rLH
CRC_STA_TS_S<-yy_S
CRC_STA_TS_SD1<-yy_SD1
CRC_STA_TS_SD2<-yy_SD2
CRC_STA_TS_SD12<-yy_SD12
CRC_STA_TS_SD21<-yy_SD21
CRC_STA_TS_SPS<-yy_SPS
CRC_STA_TS_SS<-yy_SS
CRC_STA_TS_SDRR<-yy_SDRR
CRC_STA_TS_GIp<-yy_GIp
CRC_STA_TS_SD1UP<-yy_SD1UP
CRC_STA_TS_SD1DOWN<-yy_SD1DOWN
CRC_STA_TS_CUP<-yy_CUP
CRC_STA_TS_CDOWN<-yy_CDOWN



####### INDICES SUPINO BLOQUEO PARASIMPATICO ###############################

for (i in 1:7) {
  yy_RR[[i]]<-CRC_SUA_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUA_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUA_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUA_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUA_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUA_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUA_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUA_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUA_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUA_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUA_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUA_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUA_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUA_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUA_TS[[i]]$S
  yy_SD1[[i]]<-CRC_SUA_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUA_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUA_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUA_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUA_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUA_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUA_TS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUA_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUA_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUA_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUA_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUA_TS[[i]]$CDOWN
  
}

CRC_SUA_TS_RR<-yy_RR
CRC_SUA_TS_HR<-yy_HR
CRC_SUA_TS_CV<-yy_CV
CRC_SUA_TS_pNN50<-yy_pNN50
CRC_SUA_TS_SDHR<-yy_SDHR
CRC_SUA_TS_SDNN<-yy_SDNN
CRC_SUA_TS_rMSSD<-yy_rMSSD
CRC_SUA_TS_PT<-yy_PT
CRC_SUA_TS_VLF<-yy_VLF
CRC_SUA_TS_LF<-yy_LF
CRC_SUA_TS_LFun<-yy_LFun
CRC_SUA_TS_HF<-yy_HF
CRC_SUA_TS_HFun<-yy_HFun
CRC_SUA_TS_rLH<-yy_rLH
CRC_SUA_TS_S<-yy_S
CRC_SUA_TS_SD1<-yy_SD1
CRC_SUA_TS_SD2<-yy_SD2
CRC_SUA_TS_SD12<-yy_SD12
CRC_SUA_TS_SD21<-yy_SD21
CRC_SUA_TS_SPS<-yy_SPS
CRC_SUA_TS_SS<-yy_SS
CRC_SUA_TS_SDRR<-yy_SDRR
CRC_SUA_TS_GIp<-yy_GIp
CRC_SUA_TS_SD1UP<-yy_SD1UP
CRC_SUA_TS_SD1DOWN<-yy_SD1DOWN
CRC_SUA_TS_CUP<-yy_CUP
CRC_SUA_TS_CDOWN<-yy_CDOWN
####### INDICES PARADO BLOQUEO SIMPATICO ###############################

for (i in 1:6) {
  yy_RR[[i]]<-CRC_STP_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STP_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STP_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STP_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STP_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STP_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STP_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STP_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STP_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STP_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STP_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STP_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STP_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STP_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STP_TS[[i]]$S
  yy_SD1[[i]]<-CRC_STP_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STP_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STP_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STP_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STP_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_STP_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STP_TS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_STP_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STP_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STP_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STP_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STP_TS[[i]]$CDOWN
}

CRC_STP_TS_RR<-yy_RR
CRC_STP_TS_HR<-yy_HR
CRC_STP_TS_CV<-yy_CV
CRC_STP_TS_pNN50<-yy_pNN50
CRC_STP_TS_SDHR<-yy_SDHR
CRC_STP_TS_SDNN<-yy_SDNN
CRC_STP_TS_rMSSD<-yy_rMSSD
CRC_STP_TS_PT<-yy_PT
CRC_STP_TS_VLF<-yy_VLF
CRC_STP_TS_LF<-yy_LF
CRC_STP_TS_LFun<-yy_LFun
CRC_STP_TS_HF<-yy_HF
CRC_STP_TS_HFun<-yy_HFun
CRC_STP_TS_rLH<-yy_rLH
CRC_STP_TS_S<-yy_S
CRC_STP_TS_SD1<-yy_SD1
CRC_STP_TS_SD2<-yy_SD2
CRC_STP_TS_SD12<-yy_SD12
CRC_STP_TS_SD21<-yy_SD21
CRC_STP_TS_SPS<-yy_SPS
CRC_STP_TS_SS<-yy_SS
CRC_STP_TS_SDRR<-yy_SDRR
CRC_STP_TS_GIp<-yy_GIp
CRC_STP_TS_SD1UP<-yy_SD1UP
CRC_STP_TS_SD1DOWN<-yy_SD1DOWN
CRC_STP_TS_CUP<-yy_CUP
CRC_STP_TS_CDOWN<-yy_CDOWN

####### INDICES SUPINO BLOQUEO SIMPATICO ###############################

for (i in 1:7) {
  yy_RR[[i]]<-CRC_SUP_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUP_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUP_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUP_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUP_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUP_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUP_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUP_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUP_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUP_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUP_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUP_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUP_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUP_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUP_TS[[i]]$S
  yy_SD1[[i]]<-CRC_SUP_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUP_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUP_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUP_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUP_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUP_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUP_TS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUP_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUP_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUP_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUP_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUP_TS[[i]]$CDOWN
}

CRC_SUP_TS_RR<-yy_RR
CRC_SUP_TS_HR<-yy_HR
CRC_SUP_TS_CV<-yy_CV
CRC_SUP_TS_pNN50<-yy_pNN50
CRC_SUP_TS_SDHR<-yy_SDHR
CRC_SUP_TS_SDNN<-yy_SDNN
CRC_SUP_TS_rMSSD<-yy_rMSSD
CRC_SUP_TS_PT<-yy_PT
CRC_SUP_TS_VLF<-yy_VLF
CRC_SUP_TS_LF<-yy_LF
CRC_SUP_TS_LFun<-yy_LFun
CRC_SUP_TS_HF<-yy_HF
CRC_SUP_TS_HFun<-yy_HFun
CRC_SUP_TS_rLH<-yy_rLH
CRC_SUP_TS_S<-yy_S
CRC_SUP_TS_SD1<-yy_SD1
CRC_SUP_TS_SD2<-yy_SD2
CRC_SUP_TS_SD12<-yy_SD12
CRC_SUP_TS_SD21<-yy_SD21
CRC_SUP_TS_SPS<-yy_SPS
CRC_SUP_TS_SS<-yy_SS
CRC_SUP_TS_SDRR<-yy_SDRR
CRC_SUP_TS_GIp<-yy_GIp
CRC_SUP_TS_SD1UP<-yy_SD1UP
CRC_SUP_TS_SD1DOWN<-yy_SD1DOWN
CRC_SUP_TS_CUP<-yy_CUP
CRC_SUP_TS_CDOWN<-yy_CDOWN

####### INDICES PARADO BLOQUEO TOTAL ###############################
# 
cc<-7;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))


for (i in 1:7) {
  xx_RR[[i]]<-CRC_STB_A_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STB_A_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STB_A_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STB_A_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STB_A_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STB_A_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STB_A_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STB_A_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STB_A_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STB_A_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STB_A_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STB_A_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STB_A_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STB_A_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STB_A_TS[[i]]$S
  xx_SD1[[i]]<-CRC_STB_A_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STB_A_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STB_A_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STB_A_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STB_A_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_STB_A_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STB_A_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STB_A_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STB_A_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STB_A_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STB_A_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STB_A_TS[[i]]$CDOWN
}

CRC_STB_A_TS_RR<-xx_RR
CRC_STB_A_TS_HR<-xx_HR
CRC_STB_A_TS_CV<-xx_CV
CRC_STB_A_TS_pNN50<-xx_pNN50
CRC_STB_A_TS_SDHR<-xx_SDHR
CRC_STB_A_TS_SDNN<-xx_SDNN
CRC_STB_A_TS_rMSSD<-xx_rMSSD
CRC_STB_A_TS_PT<-xx_PT
CRC_STB_A_TS_VLF<-xx_VLF
CRC_STB_A_TS_LF<-xx_LF
CRC_STB_A_TS_LFun<-xx_LFun
CRC_STB_A_TS_HF<-xx_HF
CRC_STB_A_TS_HFun<-xx_HFun
CRC_STB_A_TS_rLH<-xx_rLH
CRC_STB_A_TS_S<-xx_S
CRC_STB_A_TS_SD1<-xx_SD1
CRC_STB_A_TS_SD2<-xx_SD2
CRC_STB_A_TS_SD12<-xx_SD12
CRC_STB_A_TS_SD21<-xx_SD21
CRC_STB_A_TS_SPS<-xx_SPS
CRC_STB_A_TS_SS<-xx_SS
CRC_STB_A_TS_SDRR<-xx_SDRR
CRC_STB_A_TS_GIp<-xx_GIp
CRC_STB_A_TS_SD1UP<-xx_SD1UP
CRC_STB_A_TS_SD1DOWN<-xx_SD1DOWN
CRC_STB_A_TS_CUP<-xx_CUP
CRC_STB_A_TS_CDOWN<-xx_CDOWN

for (i in 1:6) {
  xx_RR[[i]]<-CRC_STB_P_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STB_P_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STB_P_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STB_P_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STB_P_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STB_P_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STB_P_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STB_P_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STB_P_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STB_P_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STB_P_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STB_P_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STB_P_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STB_P_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STB_P_TS[[i]]$S
  xx_SD1[[i]]<-CRC_STB_P_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STB_P_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STB_P_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STB_P_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STB_P_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_STB_P_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STB_P_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STB_P_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STB_P_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STB_P_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STB_P_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STB_P_TS[[i]]$CDOWN
}

CRC_STB_P_TS_RR<-xx_RR
CRC_STB_P_TS_HR<-xx_HR
CRC_STB_P_TS_CV<-xx_CV
CRC_STB_P_TS_pNN50<-xx_pNN50
CRC_STB_P_TS_SDHR<-xx_SDHR
CRC_STB_P_TS_SDNN<-xx_SDNN
CRC_STB_P_TS_rMSSD<-xx_rMSSD
CRC_STB_P_TS_PT<-xx_PT
CRC_STB_P_TS_VLF<-xx_VLF
CRC_STB_P_TS_LF<-xx_LF
CRC_STB_P_TS_LFun<-xx_LFun
CRC_STB_P_TS_HF<-xx_HF
CRC_STB_P_TS_HFun<-xx_HFun
CRC_STB_P_TS_rLH<-xx_rLH
CRC_STB_P_TS_S<-xx_S
CRC_STB_P_TS_SD1<-xx_SD1
CRC_STB_P_TS_SD2<-xx_SD2
CRC_STB_P_TS_SD12<-xx_SD12
CRC_STB_P_TS_SD21<-xx_SD21
CRC_STB_P_TS_SPS<-xx_SPS
CRC_STB_P_TS_SS<-xx_SS
CRC_STB_P_TS_SDRR<-xx_SDRR
CRC_STB_P_TS_GIp<-xx_GIp
CRC_STB_P_TS_SD1UP<-xx_SD1UP
CRC_STB_P_TS_SD1DOWN<-xx_SD1DOWN
CRC_STB_P_TS_CUP<-xx_CUP
CRC_STB_P_TS_CDOWN<-xx_CDOWN


for (i in 1:13) {
  yy_RR[[i]]<-CRC_STB_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STB_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STB_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STB_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STB_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STB_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STB_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STB_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STB_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STB_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STB_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STB_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STB_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STB_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STB_TS[[i]]$S
  yy_SD1[[i]]<-CRC_STB_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STB_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STB_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STB_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STB_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_STB_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STB_TS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_STB_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STB_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STB_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STB_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STB_TS[[i]]$CDOWN
}

CRC_STB_TS_RR<-yy_RR
CRC_STB_TS_HR<-yy_HR
CRC_STB_TS_CV<-yy_CV
CRC_STB_TS_pNN50<-yy_pNN50
CRC_STB_TS_SDHR<-yy_SDHR
CRC_STB_TS_SDNN<-yy_SDNN
CRC_STB_TS_rMSSD<-yy_rMSSD
CRC_STB_TS_PT<-yy_PT
CRC_STB_TS_VLF<-yy_VLF
CRC_STB_TS_LF<-yy_LF
CRC_STB_TS_LFun<-yy_LFun
CRC_STB_TS_HF<-yy_HF
CRC_STB_TS_HFun<-yy_HFun
CRC_STB_TS_rLH<-yy_rLH
CRC_STB_TS_S<-yy_S
CRC_STB_TS_SD1<-yy_SD1
CRC_STB_TS_SD2<-yy_SD2
CRC_STB_TS_SD12<-yy_SD12
CRC_STB_TS_SD21<-yy_SD21
CRC_STB_TS_SPS<-yy_SPS
CRC_STB_TS_SS<-yy_SS
CRC_STB_TS_SDRR<-yy_SDRR
CRC_STB_TS_GIp<-yy_GIp
CRC_STB_TS_SD1UP<-yy_SD1UP
CRC_STB_TS_SD1DOWN<-yy_SD1DOWN
CRC_STB_TS_CUP<-yy_CUP
CRC_STB_TS_CDOWN<-yy_CDOWN

# ####### INDICES SUPINO BLOQUEO TOTAL ###############################

# 
cc<-7;

xx_RR<-(rep(0,cc))
xx_HR<-(rep(0,cc))
xx_CV<-(rep(0,cc))
xx_pNN50<-(rep(0,cc))
xx_SDHR<-(rep(0,cc))
xx_SDNN<-(rep(0,cc))
xx_rMSSD<-(rep(0,cc))
xx_PT<-(rep(0,cc))
xx_VLF<-(rep(0,cc))
xx_LF<-(rep(0,cc))
xx_LFun<-(rep(0,cc))
xx_HF<-(rep(0,cc))
xx_HFun<-(rep(0,cc))
xx_rLH<-(rep(0,cc))
xx_S<-(rep(0,cc))
xx_SD1<-(rep(0,cc))
xx_SD2<-(rep(0,cc))
xx_SD12<-(rep(0,cc))
xx_SD21<-(rep(0,cc))
xx_SPS<-(rep(0,cc))
xx_SS<-(rep(0,cc))
xx_SDRR<-(rep(0,cc))
xx_GIp<-(rep(0,cc))
xx_SD1UP<-(rep(0,cc))
xx_SD1DOWN<-(rep(0,cc))
xx_CUP<-(rep(0,cc))
xx_CDOWN<-(rep(0,cc))


for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUB_A_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUB_A_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUB_A_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUB_A_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUB_A_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUB_A_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUB_A_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUB_A_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUB_A_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUB_A_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUB_A_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUB_A_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUB_A_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUB_A_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUB_A_TS[[i]]$S
  xx_SD1[[i]]<-CRC_SUB_A_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUB_A_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUB_A_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUB_A_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUB_A_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUB_A_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUB_A_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUB_A_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUB_A_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUB_A_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUB_A_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUB_A_TS[[i]]$CDOWN
}

CRC_SUB_A_TS_RR<-xx_RR
CRC_SUB_A_TS_HR<-xx_HR
CRC_SUB_A_TS_CV<-xx_CV
CRC_SUB_A_TS_pNN50<-xx_pNN50
CRC_SUB_A_TS_SDHR<-xx_SDHR
CRC_SUB_A_TS_SDNN<-xx_SDNN
CRC_SUB_A_TS_rMSSD<-xx_rMSSD
CRC_SUB_A_TS_PT<-xx_PT
CRC_SUB_A_TS_VLF<-xx_VLF
CRC_SUB_A_TS_LF<-xx_LF
CRC_SUB_A_TS_LFun<-xx_LFun
CRC_SUB_A_TS_HF<-xx_HF
CRC_SUB_A_TS_HFun<-xx_HFun
CRC_SUB_A_TS_rLH<-xx_rLH
CRC_SUB_A_TS_S<-xx_S
CRC_SUB_A_TS_SD1<-xx_SD1
CRC_SUB_A_TS_SD2<-xx_SD2
CRC_SUB_A_TS_SD12<-xx_SD12
CRC_SUB_A_TS_SD21<-xx_SD21
CRC_SUB_A_TS_SPS<-xx_SPS
CRC_SUB_A_TS_SS<-xx_SS
CRC_SUB_A_TS_SDRR<-xx_SDRR
CRC_SUB_A_TS_GIp<-xx_GIp
CRC_SUB_A_TS_SD1UP<-xx_SD1UP
CRC_SUB_A_TS_SD1DOWN<-xx_SD1DOWN
CRC_SUB_A_TS_CUP<-xx_CUP
CRC_SUB_A_TS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUB_P_TS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUB_P_TS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUB_P_TS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUB_P_TS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUB_P_TS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUB_P_TS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUB_P_TS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUB_P_TS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUB_P_TS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUB_P_TS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUB_P_TS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUB_P_TS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUB_P_TS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUB_P_TS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUB_P_TS[[i]]$S
  xx_SD1[[i]]<-CRC_SUB_P_TS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUB_P_TS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUB_P_TS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUB_P_TS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUB_P_TS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUB_P_TS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUB_P_TS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUB_P_TS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUB_P_TS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUB_P_TS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUB_P_TS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUB_P_TS[[i]]$CDOWN
}

CRC_SUB_P_TS_RR<-xx_RR
CRC_SUB_P_TS_HR<-xx_HR
CRC_SUB_P_TS_CV<-xx_CV
CRC_SUB_P_TS_pNN50<-xx_pNN50
CRC_SUB_P_TS_SDHR<-xx_SDHR
CRC_SUB_P_TS_SDNN<-xx_SDNN
CRC_SUB_P_TS_rMSSD<-xx_rMSSD
CRC_SUB_P_TS_PT<-xx_PT
CRC_SUB_P_TS_VLF<-xx_VLF
CRC_SUB_P_TS_LF<-xx_LF
CRC_SUB_P_TS_LFun<-xx_LFun
CRC_SUB_P_TS_HF<-xx_HF
CRC_SUB_P_TS_HFun<-xx_HFun
CRC_SUB_P_TS_rLH<-xx_rLH
CRC_SUB_P_TS_S<-xx_S
CRC_SUB_P_TS_SD1<-xx_SD1
CRC_SUB_P_TS_SD2<-xx_SD2
CRC_SUB_P_TS_SD12<-xx_SD12
CRC_SUB_P_TS_SD21<-xx_SD21
CRC_SUB_P_TS_SPS<-xx_SPS
CRC_SUB_P_TS_SS<-xx_SS
CRC_SUB_P_TS_SDRR<-xx_SDRR
CRC_SUB_P_TS_GIp<-xx_GIp
CRC_SUB_P_TS_SD1UP<-xx_SD1UP
CRC_SUB_P_TS_SD1DOWN<-xx_SD1DOWN
CRC_SUB_P_TS_CUP<-xx_CUP
CRC_SUB_P_TS_CDOWN<-xx_CDOWN


# hago 13 
for (i in 1:13) {
  yy_RR[[i]]<-CRC_SUB_TS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUB_TS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUB_TS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUB_TS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUB_TS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUB_TS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUB_TS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUB_TS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUB_TS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUB_TS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUB_TS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUB_TS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUB_TS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUB_TS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUB_TS[[i]]$S
  yy_SD1[[i]]<-CRC_SUB_TS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUB_TS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUB_TS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUB_TS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUB_TS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUB_TS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUB_TS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUB_TS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUB_TS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUB_TS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUB_TS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUB_TS[[i]]$CDOWN
}

CRC_SUB_TS_RR<-yy_RR
CRC_SUB_TS_HR<-yy_HR
CRC_SUB_TS_CV<-yy_CV
CRC_SUB_TS_pNN50<-yy_pNN50
CRC_SUB_TS_SDHR<-yy_SDHR
CRC_SUB_TS_SDNN<-yy_SDNN
CRC_SUB_TS_rMSSD<-yy_rMSSD
CRC_SUB_TS_PT<-yy_PT
CRC_SUB_TS_VLF<-yy_VLF
CRC_SUB_TS_LF<-yy_LF
CRC_SUB_TS_LFun<-yy_LFun
CRC_SUB_TS_HF<-yy_HF
CRC_SUB_TS_HFun<-yy_HFun
CRC_SUB_TS_rLH<-yy_rLH
CRC_SUB_TS_S<-yy_S
CRC_SUB_TS_SD1<-yy_SD1
CRC_SUB_TS_SD2<-yy_SD2
CRC_SUB_TS_SD12<-yy_SD12
CRC_SUB_TS_SD21<-yy_SD21
CRC_SUB_TS_SPS<-yy_SPS
CRC_SUB_TS_SS<-yy_SS
CRC_SUB_TS_SDRR<-yy_SDRR
CRC_SUB_TS_GIp<-yy_GIp
CRC_SUB_TS_SD1UP<-yy_SD1UP
CRC_SUB_TS_SD1DOWN<-yy_SD1DOWN
CRC_SUB_TS_CUP<-yy_CUP
CRC_SUB_TS_CDOWN<-yy_CDOWN

##################### FIN CALCULO INDICES #################################33
valor<-CRC_STC_TS_LF;
# valor_mediana<-median(valor)
# primero<-quantile(valor, 0.25,type = 6)
# tercero<-quantile(valor, 0.75,type = 6)
# print(valor_mediana)
# print(primero)
# print(tercero)
wilcox.test(CRC_STC_TS_CDOWN, CRC_STB_TS_CDOWN, paired = TRUE)
wilcox.test(CRC_SUC_TS_CDOWN, CRC_SUB_TS_CDOWN, paired = TRUE)
# wilcox.test(CRC_SUA_TS_SPS, CRC_SUP_TS_SPS, paired = FALSE)
# wilcox.test(CRC_SUA_TS_rLH, CRC_SUP_TS_rLH, paired = FALSE)
# wilcox.test(CRC_SUA_TS_SD21, CRC_SUP_TS_SD21, paired = FALSE)
# # cor(CRC_STA_TS_rLH, CRC_STP_TS_SD21, method = 'spearman')
# # cor(CRC_SUP_TS_rLH, CRC_SUP_TS_SD21, method = 'spearman')
# wilcox.test(CRC_STA_TS_RR, CRC_STP_TS_RR, paired = FALSE)
# wilcox.test(CRC_STA_TS_SS, CRC_STP_TS_SS, paired = FALSE)
# wilcox.test(CRC_STA_TS_SPS, CRC_STP_TS_SPS, paired = FALSE)
# wilcox.test(CRC_STA_TS_rLH, CRC_STP_TS_rLH, paired = FALSE)
# wilcox.test(CRC_STA_TS_SD21, CRC_STP_TS_SD21, paired = FALSE)
# 
# wilcox.test(CRC_STC_TS_RR, CRC_SUC_TS_RR, paired = TRUE)
# wilcox.test(CRC_STC_TS_SS, CRC_SUC_TS_SS, paired = TRUE)
# wilcox.test(CRC_STC_TS_SPS, CRC_SUC_TS_SPS, paired = TRUE)
# wilcox.test(CRC_STC_TS_rLH, CRC_SUC_TS_rLH, paired = TRUE)
# wilcox.test(CRC_STC_TS_SD21, CRC_SUC_TS_SD21, paired = TRUE)
# 
# cor(CRC_STA_TS_rLH, CRC_STP_TS_SD21, method = 'spearman')
# cor(CRC_STA_TS_HF, CRC_STP_TS_SD1, method = 'spearman')
# cor(CRC_STA_TS_LF, CRC_STP_TS_SD2, method = 'spearman')


