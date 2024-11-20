
calculo_B_A<-function(a)
{
  #Test de Correlacion Spearman
  sp<-a$plot_env$correlacion$estimate
  #rho
  sp[[1]]
  rho<-sp[[1]]
  # ci Spearman
  n<-length(a$plot_env$diferencia)
  ci<-ci_Spearman(rho,n)
  
  ci$ci_upper
  ci$ci_lower
  #p-value
  p=a$plot_env$correlacion$p.value
  
  #Mediana
  med<-a$plot_env$COR_plot$plot_env$mediana
  
  #Intervalos de comfianza de la mediana
  cuartil_3<-quantile(a$plot_env$diferencia, 0.75,type = 6)
  cuartil_1<-quantile(a$plot_env$diferencia, 0.25,type = 6)
  
  #ci_sup<-a$plot_env$BA_plot$plot_env$ci_U
  #ci_inf<-a$plot_env$BA_plot$plot_env$ci_L
  
  #Test Wilcoxson
  dif<-a$plot_env$diferencia
  test_w<-wilcox.test(a$plot_env$metodo_A, a$plot_env$metodo_B,
                      mu = 0, paired = TRUE, exact = NULL, correct = TRUE,
                      conf.int = FALSE, conf.level = 0.95)
  p_wilcox<-test_w$p.value
  
  #LoA
  LoA_upper<-a$plot_env$Diffu
  LoA_lower<-a$plot_env$Diffl
  
  #error relativo al Gold Standar, "Metodo_A"
  error <-abs(((LoA_upper - abs(LoA_lower))/median(a$plot_env$metodo_A)) * 100)
  
  #Porcentaje
  Porcentaje<-(med/median(a$plot_env$metodo_A))*100
    
    # Hacer que devuelva estos valores en la funcion
  info<-c("Spearman rho", "c.i_upper", "c.i_lower","p-value Spearman", "Mediana Diferencia (Bias)", "cuartil_3", "cuartil_1", "p-value Wilcox", "LoA_upper", "LoA_lower","error", "Bias/median_GS")
  resultados<-c(rho, ci$ci_upper, ci$ci_lower , p, med, cuartil_3, cuartil_1, p_wilcox, LoA_upper, LoA_lower, error, Porcentaje)
  result<-data.frame(info,resultados)
  
  #Graficos
  
  grafico_correlacion<-a$plot_env$COR_plot
  grafico_BA<-a$plot_env$BA_plot
  #print(a$plot_env$COR_plot)
  #print(a$plot_env$BA_plot)
  
  todo<-list(result, grafico_correlacion, grafico_BA)
}
