ORGANIZACIÓN DATOS


Carpeta IDNNNN/IDNNNN_x.map; x desde 0 al numero maximo de series de 5 min; que permitió cada archivo Paciente.

Los indices calculados son por cada archivo ".mat"

Dominio Temporal
mean_RR,mean_HR, SDNN, SDHR,CV_RR, pNNx, rMSSD 

Dominio Frecuencial
ln_rMSSD,PTlrr,VLFlrr,LFlrr,HFlrr,rLFHFlrr,LFlrrun,HFlrrun


Dominio Poincaré
SD1,SD2,SD12,SD21,SDRR,S,SS,SPS,GIp,SD1UP,SD1DOWN,CUP,CDOWN


Para leer cada archivo mat con R utilizar algo similar a esto:

x<-c(4,5,7,8,9,10,11,12,18,25,26,27,28)
l<-length(x)
for(i in 1:l) {
  z<-x[i]
  archivo_ND<-paste("/home/jose/Pruebas_R/Pruebas/series_ULTRA_SHORT/RR_ULTRA_SHORT_",g,"s_reposo_IMP_PROM/RR_",z,"_",g,"s_reposo_IMP_PROM_ND.mat",sep="")
  IMP_INTERPO_ND[[i]]<-read.mat(archivo_ND)
}

En realidad la funcion que lee archivos .mat en R es read.mat(archivo_ND),  R.matlab package; library(R.matlab)

