

#ultimo capitulo Tesis Doctorado señales de Risk

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
source("~/Pruebas_R/Pruebas/clc.R")
source("~/Pruebas_R/Pruebas/bland_altman_no_parametrico.R")
source("~/Pruebas_R/Pruebas/ci_Spearman.R")
source("~/Pruebas_R/Pruebas/calculo_B_A.R")
source("~/Pruebas_R/Pruebas/B_A_no_PAR.R")
source("~/Pruebas_R/Pruebas/ci.median.R")
source("~/Pruebas_R/Pruebas/octave_to_R_Risk_TS.R")

CRC_STC_BS<-list()
CRC_STC_A_BS<-list()
CRC_STC_P_BS<-list()
CRC_STA_BS<-list()
CRC_STP_BS<-list()
CRC_STB_BS<-list()
CRC_STB_A_BS<-list()
CRC_STB_P_BS<-list()

CRC_SUC_BS<-list()
CRC_SUC_A_BS<-list()
CRC_SUC_P_BS<-list()
CRC_SUA_BS<-list()
CRC_SUP_BS<-list()
CRC_SUB_BS<-list()
CRC_SUB_A_BS<-list()
CRC_SUB_P_BS<-list()

#### Inicio Datos CONTROL PARADO ##############################
#x<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14) #completo  
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14) #sin sujeto 3 
#x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
#x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
lstc<-length(x)
for(i in 1:lstc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STC-BS.mat",sep="")
  CRC_STC_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STC-BS.mat",sep="")
  CRC_STC_A_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STC-BS.mat",sep="")
  CRC_STC_P_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO PARASIMPATICO ##############################

x<-c(02,04,06,07,09,11,13)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STA-BS.mat",sep="")
  CRC_STA_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO SIMPATICO ##############################
x<-c(01,03,05,08,10,12,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STP-BS.mat",sep="")
  CRC_STP_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL PARADO BLOQUEO TOTAL ##############################
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STB-BS.mat",sep="")
  CRC_STB_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STB-BS.mat",sep="")
  CRC_STB_A_BS[[i]]<-read.mat(archivo_ND)
}

#x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
x<-c(01,05,08,10,12,14) #para comparar con P_propine no tiene elemento 3
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_STB-BS.mat",sep="")
  CRC_STB_P_BS[[i]]<-read.mat(archivo_ND)
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
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUC-BS.mat",sep="")
  CRC_SUC_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine

lsuc<-length(x)
for(i in 1:lsuc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUC-BS.mat",sep="")
  CRC_SUC_A_BS[[i]]<-read.mat(archivo_ND)
}


x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
lsuc<-length(x)
for(i in 1:lsuc) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUC-BS.mat",sep="")
  CRC_SUC_P_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO PARASIMPATICO ##############################
x<-c(02,04,06,07,09,11,13)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUA-BS.mat",sep="")
  CRC_SUA_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO SIMPATICO ##############################
x<-c(01,03,05,08,10,12,14)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUP-BS.mat",sep="")
  CRC_SUP_BS[[i]]<-read.mat(archivo_ND)
}

#### Inicio Datos CONTROL SUPINO BLOQUEO TOTAL ##############################
#x<-c(01,02,03,04,05,06,07,08,09,10,11,12,13,14)
x<-c(01,02,04,05,06,07,08,09,10,11,12,13,14) #saque 3
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUB-BS.mat",sep="")
  CRC_SUB_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(02,04,06,07,09,11,13) #para comparar con A_tropine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUB-BS.mat",sep="")
  CRC_SUB_A_BS[[i]]<-read.mat(archivo_ND)
}

x<-c(01,03,05,08,10,12,14) #para comparar con P_propine
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Risk_Doctorado_Procesar/Seniales/Validacion_BS_mat/CRC_",z,"_SUB-BS.mat",sep="")
  CRC_SUB_P_BS[[i]]<-read.mat(archivo_ND)
}



########################################################################
########## INICIO CALCULO INDICES VFC ##################################
########################################################################
####### INDICES CONTROL PARADO #########################################

# control parados STC dividido en 2 grupos CTC_A y CTC_P
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
  xx_RR[[i]]<-CRC_STC_A_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_A_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_A_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_A_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_A_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_A_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_A_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_A_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_A_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_A_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_A_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_A_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_A_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_A_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_A_BS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_A_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_A_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_A_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_A_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_A_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_A_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_A_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_A_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_A_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_A_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_A_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_A_BS[[i]]$CDOWN
}

CRC_STC_A_BS_RR<-xx_RR
CRC_STC_A_BS_HR<-xx_HR
CRC_STC_A_BS_CV<-xx_CV
CRC_STC_A_BS_pNN50<-xx_pNN50
CRC_STC_A_BS_SDHR<-xx_SDHR
CRC_STC_A_BS_SDNN<-xx_SDNN
CRC_STC_A_BS_rMSSD<-xx_rMSSD
CRC_STC_A_BS_PT<-xx_PT
CRC_STC_A_BS_VLF<-xx_VLF
CRC_STC_A_BS_LF<-xx_LF
CRC_STC_A_BS_LFun<-xx_LFun
CRC_STC_A_BS_HF<-xx_HF
CRC_STC_A_BS_HFun<-xx_HFun
CRC_STC_A_BS_rLH<-xx_rLH
CRC_STC_A_BS_S<-xx_S
CRC_STC_A_BS_SD1<-xx_SD1
CRC_STC_A_BS_SD2<-xx_SD2
CRC_STC_A_BS_SD12<-xx_SD12
CRC_STC_A_BS_SD21<-xx_SD21
CRC_STC_A_BS_SPS<-xx_SPS
CRC_STC_A_BS_SS<-xx_SS
CRC_STC_A_BS_SDRR<-xx_SDRR
CRC_STC_A_BS_GIp<-xx_GIp
CRC_STC_A_BS_SD1UP<-xx_SD1UP
CRC_STC_A_BS_SD1DOWN<-xx_SD1DOWN
CRC_STC_A_BS_CUP<-xx_CUP
CRC_STC_A_BS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_STC_P_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_P_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_P_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_P_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_P_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_P_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_P_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_P_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_P_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_P_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_P_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_P_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_P_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_P_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_P_BS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_P_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_P_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_P_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_P_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_P_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_P_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_P_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_P_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_P_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_P_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_P_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_P_BS[[i]]$CDOWN
}

CRC_STC_P_BS_RR<-xx_RR
CRC_STC_P_BS_HR<-xx_HR
CRC_STC_P_BS_CV<-xx_CV
CRC_STC_P_BS_pNN50<-xx_pNN50
CRC_STC_P_BS_SDHR<-xx_SDHR
CRC_STC_P_BS_SDNN<-xx_SDNN
CRC_STC_P_BS_rMSSD<-xx_rMSSD
CRC_STC_P_BS_PT<-xx_PT
CRC_STC_P_BS_VLF<-xx_VLF
CRC_STC_P_BS_LF<-xx_LF
CRC_STC_P_BS_LFun<-xx_LFun
CRC_STC_P_BS_HF<-xx_HF
CRC_STC_P_BS_HFun<-xx_HFun
CRC_STC_P_BS_rLH<-xx_rLH
CRC_STC_P_BS_S<-xx_S
CRC_STC_P_BS_SD1<-xx_SD1
CRC_STC_P_BS_SD2<-xx_SD2
CRC_STC_P_BS_SD12<-xx_SD12
CRC_STC_P_BS_SD21<-xx_SD21
CRC_STC_P_BS_SPS<-xx_SPS
CRC_STC_P_BS_SS<-xx_SS
CRC_STC_P_BS_SDRR<-xx_SDRR
CRC_STC_P_BS_GIp<-xx_GIp
CRC_STC_P_BS_SD1UP<-xx_SD1UP
CRC_STC_P_BS_SD1DOWN<-xx_SD1DOWN
CRC_STC_P_BS_CUP<-xx_CUP
CRC_STC_P_BS_CDOWN<-xx_CDOWN

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
  xx_RR[[i]]<-CRC_STC_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STC_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STC_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STC_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STC_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STC_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STC_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STC_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STC_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STC_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STC_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STC_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STC_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STC_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STC_BS[[i]]$S
  xx_SD1[[i]]<-CRC_STC_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STC_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STC_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STC_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STC_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_STC_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STC_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STC_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STC_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STC_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STC_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STC_BS[[i]]$CDOWN
}

CRC_STC_BS_RR<-xx_RR
CRC_STC_BS_HR<-xx_HR
CRC_STC_BS_CV<-xx_CV
CRC_STC_BS_pNN50<-xx_pNN50
CRC_STC_BS_SDHR<-xx_SDHR
CRC_STC_BS_SDNN<-xx_SDNN
CRC_STC_BS_rMSSD<-xx_rMSSD
CRC_STC_BS_PT<-xx_PT
CRC_STC_BS_VLF<-xx_VLF
CRC_STC_BS_LF<-xx_LF
CRC_STC_BS_LFun<-xx_LFun
CRC_STC_BS_HF<-xx_HF
CRC_STC_BS_HFun<-xx_HFun
CRC_STC_BS_rLH<-xx_rLH
CRC_STC_BS_S<-xx_S
CRC_STC_BS_SD1<-xx_SD1
CRC_STC_BS_SD2<-xx_SD2
CRC_STC_BS_SD12<-xx_SD12
CRC_STC_BS_SD21<-xx_SD21
CRC_STC_BS_SPS<-xx_SPS
CRC_STC_BS_SS<-xx_SS
CRC_STC_BS_SDRR<-xx_SDRR
CRC_STC_BS_GIp<-xx_GIp
CRC_STC_BS_SD1UP<-xx_SD1UP
CRC_STC_BS_SD1DOWN<-xx_SD1DOWN
CRC_STC_BS_CUP<-xx_CUP
CRC_STC_BS_CDOWN<-xx_CDOWN


####### INDICES CONTROL SUPINO ###############################

# control supino SUC dividido en 2 grupos SUC_A y SUC_P
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
  xx_RR[[i]]<-CRC_SUC_A_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_A_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_A_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_A_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_A_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_A_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_A_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_A_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_A_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_A_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_A_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_A_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_A_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_A_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_A_BS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_A_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_A_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_A_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_A_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_A_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_A_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_A_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_A_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_A_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_A_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_A_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_A_BS[[i]]$CDOWN
}

CRC_SUC_A_BS_RR<-xx_RR
CRC_SUC_A_BS_HR<-xx_HR
CRC_SUC_A_BS_CV<-xx_CV
CRC_SUC_A_BS_pNN50<-xx_pNN50
CRC_SUC_A_BS_SDHR<-xx_SDHR
CRC_SUC_A_BS_SDNN<-xx_SDNN
CRC_SUC_A_BS_rMSSD<-xx_rMSSD
CRC_SUC_A_BS_PT<-xx_PT
CRC_SUC_A_BS_VLF<-xx_VLF
CRC_SUC_A_BS_LF<-xx_LF
CRC_SUC_A_BS_LFun<-xx_LFun
CRC_SUC_A_BS_HF<-xx_HF
CRC_SUC_A_BS_HFun<-xx_HFun
CRC_SUC_A_BS_rLH<-xx_rLH
CRC_SUC_A_BS_S<-xx_S
CRC_SUC_A_BS_SD1<-xx_SD1
CRC_SUC_A_BS_SD2<-xx_SD2
CRC_SUC_A_BS_SD12<-xx_SD12
CRC_SUC_A_BS_SD21<-xx_SD21
CRC_SUC_A_BS_SPS<-xx_SPS
CRC_SUC_A_BS_SS<-xx_SS
CRC_SUC_A_BS_SDRR<-xx_SDRR
CRC_SUC_A_BS_GIp<-xx_GIp
CRC_SUC_A_BS_SD1UP<-xx_SD1UP
CRC_SUC_A_BS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_A_BS_CUP<-xx_CUP
CRC_SUC_A_BS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUC_P_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_P_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_P_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_P_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_P_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_P_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_P_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_P_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_P_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_P_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_P_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_P_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_P_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_P_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_P_BS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_P_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_P_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_P_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_P_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_P_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_P_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_P_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_P_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_P_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_P_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_P_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_P_BS[[i]]$CDOWN
}

CRC_SUC_P_BS_RR<-xx_RR
CRC_SUC_P_BS_HR<-xx_HR
CRC_SUC_P_BS_CV<-xx_CV
CRC_SUC_P_BS_pNN50<-xx_pNN50
CRC_SUC_P_BS_SDHR<-xx_SDHR
CRC_SUC_P_BS_SDNN<-xx_SDNN
CRC_SUC_P_BS_rMSSD<-xx_rMSSD
CRC_SUC_P_BS_PT<-xx_PT
CRC_SUC_P_BS_VLF<-xx_VLF
CRC_SUC_P_BS_LF<-xx_LF
CRC_SUC_P_BS_LFun<-xx_LFun
CRC_SUC_P_BS_HF<-xx_HF
CRC_SUC_P_BS_HFun<-xx_HFun
CRC_SUC_P_BS_rLH<-xx_rLH
CRC_SUC_P_BS_S<-xx_S
CRC_SUC_P_BS_SD1<-xx_SD1
CRC_SUC_P_BS_SD2<-xx_SD2
CRC_SUC_P_BS_SD12<-xx_SD12
CRC_SUC_P_BS_SD21<-xx_SD21
CRC_SUC_P_BS_SPS<-xx_SPS
CRC_SUC_P_BS_SS<-xx_SS
CRC_SUC_P_BS_SDRR<-xx_SDRR
CRC_SUC_P_BS_GIp<-xx_GIp
CRC_SUC_P_BS_SD1UP<-xx_SD1UP
CRC_SUC_P_BS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_P_BS_CUP<-xx_CUP
CRC_SUC_P_BS_CDOWN<-xx_CDOWN

### Control Supino (SUC) 14 sujetos ##############

#cc<-14; #saco 1, son 14
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

#saco son 14
for (i in 1:13) {
  xx_RR[[i]]<-CRC_SUC_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUC_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUC_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUC_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUC_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUC_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUC_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUC_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUC_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUC_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUC_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUC_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUC_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUC_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUC_BS[[i]]$S
  xx_SD1[[i]]<-CRC_SUC_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUC_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUC_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUC_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUC_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUC_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUC_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUC_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUC_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUC_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUC_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUC_BS[[i]]$CDOWN
}

CRC_SUC_BS_RR<-xx_RR
CRC_SUC_BS_HR<-xx_HR
CRC_SUC_BS_CV<-xx_CV
CRC_SUC_BS_pNN50<-xx_pNN50
CRC_SUC_BS_SDHR<-xx_SDHR
CRC_SUC_BS_SDNN<-xx_SDNN
CRC_SUC_BS_rMSSD<-xx_rMSSD
CRC_SUC_BS_PT<-xx_PT
CRC_SUC_BS_VLF<-xx_VLF
CRC_SUC_BS_LF<-xx_LF
CRC_SUC_BS_LFun<-xx_LFun
CRC_SUC_BS_HF<-xx_HF
CRC_SUC_BS_HFun<-xx_HFun
CRC_SUC_BS_rLH<-xx_rLH
CRC_SUC_BS_S<-xx_S
CRC_SUC_BS_SD1<-xx_SD1
CRC_SUC_BS_SD2<-xx_SD2
CRC_SUC_BS_SD12<-xx_SD12
CRC_SUC_BS_SD21<-xx_SD21
CRC_SUC_BS_SPS<-xx_SPS
CRC_SUC_BS_SS<-xx_SS
CRC_SUC_BS_SDRR<-xx_SDRR
CRC_SUC_BS_GIp<-xx_GIp
CRC_SUC_BS_SD1UP<-xx_SD1UP
CRC_SUC_BS_SD1DOWN<-xx_SD1DOWN
CRC_SUC_BS_CUP<-xx_CUP
CRC_SUC_BS_CDOWN<-xx_CDOWN


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
  yy_RR[[i]]<-CRC_STA_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STA_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STA_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STA_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STA_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STA_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STA_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STA_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STA_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STA_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STA_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STA_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STA_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STA_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STA_BS[[i]]$S
  yy_SD1[[i]]<-CRC_STA_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STA_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STA_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STA_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STA_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_STA_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STA_BS[[i]]$SDRR
    yy_GIp[[i]]<-CRC_STA_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STA_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STA_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STA_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STA_BS[[i]]$CDOWN
}

CRC_STA_BS_RR<-yy_RR
CRC_STA_BS_HR<-yy_HR
CRC_STA_BS_CV<-yy_CV
CRC_STA_BS_pNN50<-yy_pNN50
CRC_STA_BS_SDHR<-yy_SDHR
CRC_STA_BS_SDNN<-yy_SDNN
CRC_STA_BS_rMSSD<-yy_rMSSD
CRC_STA_BS_PT<-yy_PT
CRC_STA_BS_VLF<-yy_VLF
CRC_STA_BS_LF<-yy_LF
CRC_STA_BS_LFun<-yy_LFun
CRC_STA_BS_HF<-yy_HF
CRC_STA_BS_HFun<-yy_HFun
CRC_STA_BS_rLH<-yy_rLH
CRC_STA_BS_S<-yy_S
CRC_STA_BS_SD1<-yy_SD1
CRC_STA_BS_SD2<-yy_SD2
CRC_STA_BS_SD12<-yy_SD12
CRC_STA_BS_SD21<-yy_SD21
CRC_STA_BS_SPS<-yy_SPS
CRC_STA_BS_SS<-yy_SS
CRC_STA_BS_SDRR<-yy_SDRR
CRC_STA_BS_GIp<-yy_GIp
CRC_STA_BS_SD1UP<-yy_SD1UP
CRC_STA_BS_SD1DOWN<-yy_SD1DOWN
CRC_STA_BS_CUP<-yy_CUP
CRC_STA_BS_CDOWN<-yy_CDOWN



####### INDICES SUPINO BLOQUEO PARASIMPATICO ###############################

for (i in 1:7) {
  yy_RR[[i]]<-CRC_SUA_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUA_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUA_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUA_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUA_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUA_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUA_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUA_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUA_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUA_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUA_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUA_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUA_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUA_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUA_BS[[i]]$S
  yy_SD1[[i]]<-CRC_SUA_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUA_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUA_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUA_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUA_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUA_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUA_BS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUA_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUA_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUA_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUA_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUA_BS[[i]]$CDOWN
  
}

CRC_SUA_BS_RR<-yy_RR
CRC_SUA_BS_HR<-yy_HR
CRC_SUA_BS_CV<-yy_CV
CRC_SUA_BS_pNN50<-yy_pNN50
CRC_SUA_BS_SDHR<-yy_SDHR
CRC_SUA_BS_SDNN<-yy_SDNN
CRC_SUA_BS_rMSSD<-yy_rMSSD
CRC_SUA_BS_PT<-yy_PT
CRC_SUA_BS_VLF<-yy_VLF
CRC_SUA_BS_LF<-yy_LF
CRC_SUA_BS_LFun<-yy_LFun
CRC_SUA_BS_HF<-yy_HF
CRC_SUA_BS_HFun<-yy_HFun
CRC_SUA_BS_rLH<-yy_rLH
CRC_SUA_BS_S<-yy_S
CRC_SUA_BS_SD1<-yy_SD1
CRC_SUA_BS_SD2<-yy_SD2
CRC_SUA_BS_SD12<-yy_SD12
CRC_SUA_BS_SD21<-yy_SD21
CRC_SUA_BS_SPS<-yy_SPS
CRC_SUA_BS_SS<-yy_SS
CRC_SUA_BS_SDRR<-yy_SDRR
CRC_SUA_BS_GIp<-yy_GIp
CRC_SUA_BS_SD1UP<-yy_SD1UP
CRC_SUA_BS_SD1DOWN<-yy_SD1DOWN
CRC_SUA_BS_CUP<-yy_CUP
CRC_SUA_BS_CDOWN<-yy_CDOWN

####### INDICES PARADO BLOQUEO SIMPATICO  ###############################

for (i in 1:7) {
  yy_RR[[i]]<-CRC_STP_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STP_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STP_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STP_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STP_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STP_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STP_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STP_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STP_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STP_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STP_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STP_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STP_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STP_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STP_BS[[i]]$S
  yy_SD1[[i]]<-CRC_STP_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STP_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STP_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STP_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STP_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_STP_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STP_BS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_STP_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STP_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STP_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STP_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STP_BS[[i]]$CDOWN
}

CRC_STP_BS_RR<-yy_RR
CRC_STP_BS_HR<-yy_HR
CRC_STP_BS_CV<-yy_CV
CRC_STP_BS_pNN50<-yy_pNN50
CRC_STP_BS_SDHR<-yy_SDHR
CRC_STP_BS_SDNN<-yy_SDNN
CRC_STP_BS_rMSSD<-yy_rMSSD
CRC_STP_BS_PT<-yy_PT
CRC_STP_BS_VLF<-yy_VLF
CRC_STP_BS_LF<-yy_LF
CRC_STP_BS_LFun<-yy_LFun
CRC_STP_BS_HF<-yy_HF
CRC_STP_BS_HFun<-yy_HFun
CRC_STP_BS_rLH<-yy_rLH
CRC_STP_BS_S<-yy_S
CRC_STP_BS_SD1<-yy_SD1
CRC_STP_BS_SD2<-yy_SD2
CRC_STP_BS_SD12<-yy_SD12
CRC_STP_BS_SD21<-yy_SD21
CRC_STP_BS_SPS<-yy_SPS
CRC_STP_BS_SS<-yy_SS
CRC_STP_BS_SDRR<-yy_SDRR
CRC_STP_BS_GIp<-yy_GIp
CRC_STP_BS_SD1UP<-yy_SD1UP
CRC_STP_BS_SD1DOWN<-yy_SD1DOWN
CRC_STP_BS_CUP<-yy_CUP
CRC_STP_BS_CDOWN<-yy_CDOWN

####### INDICES SUPINO BLOQUEO SIMPATICO ###############################

for (i in 1:7) {
  yy_RR[[i]]<-CRC_SUP_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUP_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUP_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUP_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUP_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUP_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUP_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUP_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUP_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUP_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUP_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUP_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUP_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUP_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUP_BS[[i]]$S
  yy_SD1[[i]]<-CRC_SUP_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUP_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUP_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUP_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUP_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUP_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUP_BS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUP_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUP_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUP_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUP_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUP_BS[[i]]$CDOWN
}

CRC_SUP_BS_RR<-yy_RR
CRC_SUP_BS_HR<-yy_HR
CRC_SUP_BS_CV<-yy_CV
CRC_SUP_BS_pNN50<-yy_pNN50
CRC_SUP_BS_SDHR<-yy_SDHR
CRC_SUP_BS_SDNN<-yy_SDNN
CRC_SUP_BS_rMSSD<-yy_rMSSD
CRC_SUP_BS_PT<-yy_PT
CRC_SUP_BS_VLF<-yy_VLF
CRC_SUP_BS_LF<-yy_LF
CRC_SUP_BS_LFun<-yy_LFun
CRC_SUP_BS_HF<-yy_HF
CRC_SUP_BS_HFun<-yy_HFun
CRC_SUP_BS_rLH<-yy_rLH
CRC_SUP_BS_S<-yy_S
CRC_SUP_BS_SD1<-yy_SD1
CRC_SUP_BS_SD2<-yy_SD2
CRC_SUP_BS_SD12<-yy_SD12
CRC_SUP_BS_SD21<-yy_SD21
CRC_SUP_BS_SPS<-yy_SPS
CRC_SUP_BS_SS<-yy_SS
CRC_SUP_BS_SDRR<-yy_SDRR
CRC_SUP_BS_GIp<-yy_GIp
CRC_SUP_BS_SD1UP<-yy_SD1UP
CRC_SUP_BS_SD1DOWN<-yy_SD1DOWN
CRC_SUP_BS_CUP<-yy_CUP
CRC_SUP_BS_CDOWN<-yy_CDOWN

####### INDICES PARADO BLOQUEO TOTAL ###############################
# dividido en STB_A y STB_P
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
  xx_RR[[i]]<-CRC_STB_A_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STB_A_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STB_A_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STB_A_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STB_A_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STB_A_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STB_A_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STB_A_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STB_A_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STB_A_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STB_A_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STB_A_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STB_A_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STB_A_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STB_A_BS[[i]]$S
  xx_SD1[[i]]<-CRC_STB_A_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STB_A_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STB_A_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STB_A_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STB_A_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_STB_A_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STB_A_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STB_A_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STB_A_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STB_A_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STB_A_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STB_A_BS[[i]]$CDOWN
}

CRC_STB_A_BS_RR<-xx_RR
CRC_STB_A_BS_HR<-xx_HR
CRC_STB_A_BS_CV<-xx_CV
CRC_STB_A_BS_pNN50<-xx_pNN50
CRC_STB_A_BS_SDHR<-xx_SDHR
CRC_STB_A_BS_SDNN<-xx_SDNN
CRC_STB_A_BS_rMSSD<-xx_rMSSD
CRC_STB_A_BS_PT<-xx_PT
CRC_STB_A_BS_VLF<-xx_VLF
CRC_STB_A_BS_LF<-xx_LF
CRC_STB_A_BS_LFun<-xx_LFun
CRC_STB_A_BS_HF<-xx_HF
CRC_STB_A_BS_HFun<-xx_HFun
CRC_STB_A_BS_rLH<-xx_rLH
CRC_STB_A_BS_S<-xx_S
CRC_STB_A_BS_SD1<-xx_SD1
CRC_STB_A_BS_SD2<-xx_SD2
CRC_STB_A_BS_SD12<-xx_SD12
CRC_STB_A_BS_SD21<-xx_SD21
CRC_STB_A_BS_SPS<-xx_SPS
CRC_STB_A_BS_SS<-xx_SS
CRC_STB_A_BS_SDRR<-xx_SDRR
CRC_STB_A_BS_GIp<-xx_GIp
CRC_STB_A_BS_SD1UP<-xx_SD1UP
CRC_STB_A_BS_SD1DOWN<-xx_SD1DOWN
CRC_STB_A_BS_CUP<-xx_CUP
CRC_STB_A_BS_CDOWN<-xx_CDOWN

for (i in 1:6) {
  xx_RR[[i]]<-CRC_STB_P_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_STB_P_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_STB_P_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_STB_P_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_STB_P_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_STB_P_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_STB_P_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_STB_P_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_STB_P_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_STB_P_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_STB_P_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_STB_P_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_STB_P_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_STB_P_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_STB_P_BS[[i]]$S
  xx_SD1[[i]]<-CRC_STB_P_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_STB_P_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_STB_P_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_STB_P_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_STB_P_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_STB_P_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_STB_P_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_STB_P_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_STB_P_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_STB_P_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_STB_P_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_STB_P_BS[[i]]$CDOWN
}

CRC_STB_P_BS_RR<-xx_RR
CRC_STB_P_BS_HR<-xx_HR
CRC_STB_P_BS_CV<-xx_CV
CRC_STB_P_BS_pNN50<-xx_pNN50
CRC_STB_P_BS_SDHR<-xx_SDHR
CRC_STB_P_BS_SDNN<-xx_SDNN
CRC_STB_P_BS_rMSSD<-xx_rMSSD
CRC_STB_P_BS_PT<-xx_PT
CRC_STB_P_BS_VLF<-xx_VLF
CRC_STB_P_BS_LF<-xx_LF
CRC_STB_P_BS_LFun<-xx_LFun
CRC_STB_P_BS_HF<-xx_HF
CRC_STB_P_BS_HFun<-xx_HFun
CRC_STB_P_BS_rLH<-xx_rLH
CRC_STB_P_BS_S<-xx_S
CRC_STB_P_BS_SD1<-xx_SD1
CRC_STB_P_BS_SD2<-xx_SD2
CRC_STB_P_BS_SD12<-xx_SD12
CRC_STB_P_BS_SD21<-xx_SD21
CRC_STB_P_BS_SPS<-xx_SPS
CRC_STB_P_BS_SS<-xx_SS
CRC_STB_P_BS_SDRR<-xx_SDRR
CRC_STB_P_BS_GIp<-xx_GIp
CRC_STB_P_BS_SD1UP<-xx_SD1UP
CRC_STB_P_BS_SD1DOWN<-xx_SD1DOWN
CRC_STB_P_BS_CUP<-xx_CUP
CRC_STB_P_BS_CDOWN<-xx_CDOWN


for (i in 1:13) {
  yy_RR[[i]]<-CRC_STB_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_STB_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_STB_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_STB_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_STB_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_STB_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_STB_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_STB_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_STB_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_STB_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_STB_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_STB_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_STB_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_STB_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_STB_BS[[i]]$S
  yy_SD1[[i]]<-CRC_STB_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_STB_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_STB_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_STB_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_STB_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_STB_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_STB_BS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_STB_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_STB_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_STB_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_STB_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_STB_BS[[i]]$CDOWN
}

CRC_STB_BS_RR<-yy_RR
CRC_STB_BS_HR<-yy_HR
CRC_STB_BS_CV<-yy_CV
CRC_STB_BS_pNN50<-yy_pNN50
CRC_STB_BS_SDHR<-yy_SDHR
CRC_STB_BS_SDNN<-yy_SDNN
CRC_STB_BS_rMSSD<-yy_rMSSD
CRC_STB_BS_PT<-yy_PT
CRC_STB_BS_VLF<-yy_VLF
CRC_STB_BS_LF<-yy_LF
CRC_STB_BS_LFun<-yy_LFun
CRC_STB_BS_HF<-yy_HF
CRC_STB_BS_HFun<-yy_HFun
CRC_STB_BS_rLH<-yy_rLH
CRC_STB_BS_S<-yy_S
CRC_STB_BS_SD1<-yy_SD1
CRC_STB_BS_SD2<-yy_SD2
CRC_STB_BS_SD12<-yy_SD12
CRC_STB_BS_SD21<-yy_SD21
CRC_STB_BS_SPS<-yy_SPS
CRC_STB_BS_SS<-yy_SS
CRC_STB_BS_SDRR<-yy_SDRR
CRC_STB_BS_GIp<-yy_GIp
CRC_STB_BS_SD1UP<-yy_SD1UP
CRC_STB_BS_SD1DOWN<-yy_SD1DOWN
CRC_STB_BS_CUP<-yy_CUP
CRC_STB_BS_CDOWN<-yy_CDOWN


# ####### INDICES SUPINO BLOQUEO TOTAL ###############################
#dividido en SUB_A y SUB_P
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
  xx_RR[[i]]<-CRC_SUB_A_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUB_A_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUB_A_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUB_A_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUB_A_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUB_A_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUB_A_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUB_A_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUB_A_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUB_A_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUB_A_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUB_A_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUB_A_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUB_A_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUB_A_BS[[i]]$S
  xx_SD1[[i]]<-CRC_SUB_A_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUB_A_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUB_A_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUB_A_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUB_A_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUB_A_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUB_A_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUB_A_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUB_A_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUB_A_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUB_A_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUB_A_BS[[i]]$CDOWN
}

CRC_SUB_A_BS_RR<-xx_RR
CRC_SUB_A_BS_HR<-xx_HR
CRC_SUB_A_BS_CV<-xx_CV
CRC_SUB_A_BS_pNN50<-xx_pNN50
CRC_SUB_A_BS_SDHR<-xx_SDHR
CRC_SUB_A_BS_SDNN<-xx_SDNN
CRC_SUB_A_BS_rMSSD<-xx_rMSSD
CRC_SUB_A_BS_PT<-xx_PT
CRC_SUB_A_BS_VLF<-xx_VLF
CRC_SUB_A_BS_LF<-xx_LF
CRC_SUB_A_BS_LFun<-xx_LFun
CRC_SUB_A_BS_HF<-xx_HF
CRC_SUB_A_BS_HFun<-xx_HFun
CRC_SUB_A_BS_rLH<-xx_rLH
CRC_SUB_A_BS_S<-xx_S
CRC_SUB_A_BS_SD1<-xx_SD1
CRC_SUB_A_BS_SD2<-xx_SD2
CRC_SUB_A_BS_SD12<-xx_SD12
CRC_SUB_A_BS_SD21<-xx_SD21
CRC_SUB_A_BS_SPS<-xx_SPS
CRC_SUB_A_BS_SS<-xx_SS
CRC_SUB_A_BS_SDRR<-xx_SDRR
CRC_SUB_A_BS_GIp<-xx_GIp
CRC_SUB_A_BS_SD1UP<-xx_SD1UP
CRC_SUB_A_BS_SD1DOWN<-xx_SD1DOWN
CRC_SUB_A_BS_CUP<-xx_CUP
CRC_SUB_A_BS_CDOWN<-xx_CDOWN

for (i in 1:7) {
  xx_RR[[i]]<-CRC_SUB_P_BS[[i]]$mean_RR
  xx_HR[[i]]<-CRC_SUB_P_BS[[i]]$mean_HR
  xx_CV[[i]]<-CRC_SUB_P_BS[[i]]$CV_RR
  xx_pNN50[[i]]<-CRC_SUB_P_BS[[i]]$pNNx
  xx_SDHR[[i]]<-CRC_SUB_P_BS[[i]]$SDHR
  xx_SDNN[[i]]<-CRC_SUB_P_BS[[i]]$SDNN
  xx_rMSSD[[i]]<-CRC_SUB_P_BS[[i]]$rMSSD
  xx_PT[[i]]<-CRC_SUB_P_BS[[i]]$PTlrr
  xx_VLF[[i]]<-CRC_SUB_P_BS[[i]]$VLFlrr
  xx_LF[[i]]<-CRC_SUB_P_BS[[i]]$LFlrr
  xx_LFun[[i]]<-CRC_SUB_P_BS[[i]]$LFlrrun
  xx_HF[[i]]<-CRC_SUB_P_BS[[i]]$HFlrr
  xx_HFun[[i]]<-CRC_SUB_P_BS[[i]]$HFlrrun
  xx_rLH[[i]]<-CRC_SUB_P_BS[[i]]$rLFHFlrr
  xx_S[[i]]<-CRC_SUB_P_BS[[i]]$S
  xx_SD1[[i]]<-CRC_SUB_P_BS[[i]]$SD1
  xx_SD2[[i]]<-CRC_SUB_P_BS[[i]]$SD2
  xx_SD12[[i]]<-CRC_SUB_P_BS[[i]]$SD12
  xx_SD21[[i]]<-CRC_SUB_P_BS[[i]]$SD21
  xx_SPS[[i]]<-CRC_SUB_P_BS[[i]]$SPS
  xx_SS[[i]]<-CRC_SUB_P_BS[[i]]$SS
  xx_SDRR[[i]]<-CRC_SUB_P_BS[[i]]$SDRR
  xx_GIp[[i]]<-CRC_SUB_P_BS[[i]]$GIp
  xx_SD1UP[[i]]<-CRC_SUB_P_BS[[i]]$SD1UP
  xx_SD1DOWN[[i]]<-CRC_SUB_P_BS[[i]]$SD1DOWN
  xx_CUP[[i]]<-CRC_SUB_P_BS[[i]]$CUP
  xx_CDOWN[[i]]<-CRC_SUB_P_BS[[i]]$CDOWN
}

CRC_SUB_P_BS_RR<-xx_RR
CRC_SUB_P_BS_HR<-xx_HR
CRC_SUB_P_BS_CV<-xx_CV
CRC_SUB_P_BS_pNN50<-xx_pNN50
CRC_SUB_P_BS_SDHR<-xx_SDHR
CRC_SUB_P_BS_SDNN<-xx_SDNN
CRC_SUB_P_BS_rMSSD<-xx_rMSSD
CRC_SUB_P_BS_PT<-xx_PT
CRC_SUB_P_BS_VLF<-xx_VLF
CRC_SUB_P_BS_LF<-xx_LF
CRC_SUB_P_BS_LFun<-xx_LFun
CRC_SUB_P_BS_HF<-xx_HF
CRC_SUB_P_BS_HFun<-xx_HFun
CRC_SUB_P_BS_rLH<-xx_rLH
CRC_SUB_P_BS_S<-xx_S
CRC_SUB_P_BS_SD1<-xx_SD1
CRC_SUB_P_BS_SD2<-xx_SD2
CRC_SUB_P_BS_SD12<-xx_SD12
CRC_SUB_P_BS_SD21<-xx_SD21
CRC_SUB_P_BS_SPS<-xx_SPS
CRC_SUB_P_BS_SS<-xx_SS
CRC_SUB_P_BS_SDRR<-xx_SDRR
CRC_SUB_P_BS_GIp<-xx_GIp
CRC_SUB_P_BS_SD1UP<-xx_SD1UP
CRC_SUB_P_BS_SD1DOWN<-xx_SD1DOWN
CRC_SUB_P_BS_CUP<-xx_CUP
CRC_SUB_P_BS_CDOWN<-xx_CDOWN


# saco, son 14
for (i in 1:13) {
  yy_RR[[i]]<-CRC_SUB_BS[[i]]$mean_RR
  yy_HR[[i]]<-CRC_SUB_BS[[i]]$mean_HR
  yy_CV[[i]]<-CRC_SUB_BS[[i]]$CV_RR
  yy_pNN50[[i]]<-CRC_SUB_BS[[i]]$pNNx
  yy_SDHR[[i]]<-CRC_SUB_BS[[i]]$SDHR
  yy_SDNN[[i]]<-CRC_SUB_BS[[i]]$SDNN
  yy_rMSSD[[i]]<-CRC_SUB_BS[[i]]$rMSSD
  yy_PT[[i]]<-CRC_SUB_BS[[i]]$PTlrr
  yy_VLF[[i]]<-CRC_SUB_BS[[i]]$VLFlrr
  yy_LF[[i]]<-CRC_SUB_BS[[i]]$LFlrr
  yy_LFun[[i]]<-CRC_SUB_BS[[i]]$LFlrrun
  yy_HF[[i]]<-CRC_SUB_BS[[i]]$HFlrr
  yy_HFun[[i]]<-CRC_SUB_BS[[i]]$HFlrrun
  yy_rLH[[i]]<-CRC_SUB_BS[[i]]$rLFHFlrr
  yy_S[[i]]<-CRC_SUB_BS[[i]]$S
  yy_SD1[[i]]<-CRC_SUB_BS[[i]]$SD1
  yy_SD2[[i]]<-CRC_SUB_BS[[i]]$SD2
  yy_SD12[[i]]<-CRC_SUB_BS[[i]]$SD12
  yy_SD21[[i]]<-CRC_SUB_BS[[i]]$SD21
  yy_SPS[[i]]<-CRC_SUB_BS[[i]]$SPS
  yy_SS[[i]]<-CRC_SUB_BS[[i]]$SS
  yy_SDRR[[i]]<-CRC_SUB_BS[[i]]$SDRR
  yy_GIp[[i]]<-CRC_SUB_BS[[i]]$GIp
  yy_SD1UP[[i]]<-CRC_SUB_BS[[i]]$SD1UP
  yy_SD1DOWN[[i]]<-CRC_SUB_BS[[i]]$SD1DOWN
  yy_CUP[[i]]<-CRC_SUB_BS[[i]]$CUP
  yy_CDOWN[[i]]<-CRC_SUB_BS[[i]]$CDOWN
}

CRC_SUB_BS_RR<-yy_RR
CRC_SUB_BS_HR<-yy_HR
CRC_SUB_BS_CV<-yy_CV
CRC_SUB_BS_pNN50<-yy_pNN50
CRC_SUB_BS_SDHR<-yy_SDHR
CRC_SUB_BS_SDNN<-yy_SDNN
CRC_SUB_BS_rMSSD<-yy_rMSSD
CRC_SUB_BS_PT<-yy_PT
CRC_SUB_BS_VLF<-yy_VLF
CRC_SUB_BS_LF<-yy_LF
CRC_SUB_BS_LFun<-yy_LFun
CRC_SUB_BS_HF<-yy_HF
CRC_SUB_BS_HFun<-yy_HFun
CRC_SUB_BS_rLH<-yy_rLH
CRC_SUB_BS_S<-yy_S
CRC_SUB_BS_SD1<-yy_SD1
CRC_SUB_BS_SD2<-yy_SD2
CRC_SUB_BS_SD12<-yy_SD12
CRC_SUB_BS_SD21<-yy_SD21
CRC_SUB_BS_SPS<-yy_SPS
CRC_SUB_BS_SS<-yy_SS
CRC_SUB_BS_SDRR<-yy_SDRR
CRC_SUB_BS_GIp<-yy_GIp
CRC_SUB_BS_SD1UP<-yy_SD1UP
CRC_SUB_BS_SD1DOWN<-yy_SD1DOWN
CRC_SUB_BS_CUP<-yy_CUP
CRC_SUB_BS_CDOWN<-yy_CDOWN

##################### FIN CALCULO INDICES #################################

BS0<-CRC_SUC_BS_PT;

###BS0CRC_SUB_P_TS_rLH;

TS0<-CRC_SUC_TS_PT;
# 
# todo_no_par<-B_A_no_PAR(BS,TS)
# print(todo_no_par)

#BS1<-CRC_STB_BS_pNN50;

#BS2<-CRC_SUA_TS_SS;

# BS2<-CRC_SUB_P_BS_SD21;
# 
# #BS3<-CRC_SUP_TS_SS;
# 
# #BS3<-CRC_SUB_BS_pNN50;
# 
# #BS4<-CRC_STB_BS_HR;
# valor=TS0;
# valor_mediana<-median(valor)
# cuartil_3<-quantile(valor, 0.75,type = 6)
# cuartil_1<-quantile(valor, 0.25,type = 6)
# print(valor_mediana)
# print(cuartil_1)
# print(cuartil_3)

#correccion p
#Para BS valores de p considerando Wilcoxon de a pares
# pNN50<-c(0.036,0.078) 
# SDNN<-c(0.016,0.668,0.002) 
# 
# p_values_BH <- p.adjust(SDNN, method = "BH")
# print(p_values_BH)

#########################
 wilcox.test(BS0-TS0, y = NULL, paired = FALSE)
# cor(BS0, TS0, method = 'spearman')
# # cor(BS0, TS0, method = 'kendall')
#todo_no_par<-B_A_no_PAR(BS0,TS0)
#
#print(todo_no_par)

# SDNN<-matrix(c(BS0, BS1, BS2), nrow=7, ncol=3,
#                                   dimnames=list(1 : 7, c("BS0", "BS1", "BS2")))
# 
# friedman.test(SDNN)
# SDNNt<-c(BS0, BS1, BS2)
# todo<-gl(3,7, labels=c("BS0", "BS1","BS2"))
# pairwise.wilcox.test(SDNNt,todo, paired = TRUE, p.adjust.method ="BH")
# 
# boxplot(SDNN, ylab="SDNN", xlab="Posiciones")

#wilcox.test(BS0, TS0, paired = TRUE)
#wilcox.test(CRC_SUC_BS_CDOWN, CRC_SUB_BS_CDOWN, paired = TRUE)
# wilcox.test(CRC_SUA_BS_SPS, CRC_SUP_BS_SPS, paired = FALSE)
# wilcox.test(CRC_SUA_BS_rLH, CRC_SUP_BS_rLH, paired = FALSE)
# wilcox.test(CRC_SUA_BS_SD21, CRC_SUP_BS_SD21, paired = FALSE)
# # cor(CRC_STA_BS_rLH, CRC_STP_BS_SD21, method = 'spearman')
# # cor(CRC_SUP_BS_rLH, CRC_SUP_BS_SD21, method = 'spearman')
# wilcox.test(CRC_STA_BS_RR, CRC_STP_BS_RR, paired = FALSE)
# wilcox.test(CRC_STA_BS_SS, CRC_STP_BS_SS, paired = FALSE)
# wilcox.test(CRC_STA_BS_SPS, CRC_STP_BS_SPS, paired = FALSE)
# wilcox.test(CRC_STA_BS_rLH, CRC_STP_BS_rLH, paired = FALSE)
# wilcox.test(CRC_STA_BS_SD21, CRC_STP_BS_SD21, paired = FALSE)
# 
# wilcox.test(CRC_STC_BS_RR, CRC_SUC_BS_RR, paired = TRUE)
# wilcox.test(CRC_STC_BS_SS, CRC_SUC_BS_SS, paired = TRUE)
# wilcox.test(CRC_STC_BS_SPS, CRC_SUC_BS_SPS, paired = TRUE)
# wilcox.test(CRC_STC_BS_rLH, CRC_SUC_BS_rLH, paired = TRUE)
# wilcox.test(CRC_STC_BS_SD21, CRC_SUC_BS_SD21, paired = TRUE)
# 
# cor(CRC_STA_BS_rLH, CRC_STP_BS_SD21, method = 'spearman')
# cor(CRC_STA_BS_HF, CRC_STP_BS_SD1, method = 'spearman')
# cor(CRC_STA_BS_LF, CRC_STP_BS_SD2, method = 'spearman')


