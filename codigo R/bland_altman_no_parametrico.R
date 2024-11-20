
bland_altman_no_parametrico<-function(metodo_A,metodo_B)
{
  diferencia <- (metodo_A - metodo_B)
  media <- (metodo_A+metodo_B)/2 #uso Gold Standar# + metodo_B) / 2
  porcentaje <- ((diferencia / media) * 100)
  v_ordenado<-sort(diferencia, decreasing=FALSE)
  n<-length(metodo_A)
  lower_index<- round((n/2) - (1.96 * sqrt(n )/2))
  upper_index<-round( 1+(n/2) + (1.96 * sqrt(n )/2))
  ci_U<-v_ordenado[upper_index]
  ci_L<-v_ordenado[lower_index]
  
  Diffu<-quantile(diferencia, 0.975,type = 6)
  Diffl<-quantile(diferencia, 0.025,type = 6)
  
  datos <- data.frame(metodo_A, metodo_B, diferencia, media, porcentaje)
  summary(datos)
  
  mediana<-median(datos$diferencia)
  library("ggplot2", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.6")
  # Diagrama de dispersión con bisectriz y modelo lineal de los datos
  COR_plot<-ggplot(data = datos, mapping = aes(x = metodo_A, y = metodo_B)) +
    geom_point(shape = 1, colour = "black", fill = "white", size = 2, stroke = 1.5)+ ylim(5, 25) + xlim(5, 25)+
    labs(title = "", x = "GS", y = "SS_240s") +
    geom_smooth(method = "lm", se = FALSE, color = "red", lwd = 0.75) +
    #geom_abline(intercept = 0, slope = 1, lwd = 0.7, col = "blue") +
    theme(axis.line = element_line(colour = "black"), 
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(), 
          panel.border = element_blank(), 
          panel.background = element_blank()) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, color="black", size=16, face="bold"),
                       axis.title.x = element_text(color="black", size=16, face="bold"),
                       axis.title.y = element_text(color="black", size=16, face="bold")) +
    theme(axis.text.x = element_text(face = "bold", color = "black",size = 12),
          axis.text.y = element_text(face = "bold", color = "black", size = 12))
  
  correlacion<-cor.test(datos$metodo_A, datos$metodo_B, method = "spearman", conf.level = 0.95)
  
  # Modelo lineal de los datos
  modelo_lineal <- lm (formula = metodo_B ~ metodo_A, data = datos)
  summary(modelo_lineal)
  COR_plot
  confint(modelo_lineal, level = 0.95)
  #se puede graficar respecto GS x = metodo_A; normalmente x = media
  #Aca cambiar limites grafico ylim, xlim
  BA_plot <- ggplot(data = datos, aes(x = metodo_A, y = diferencia)) +
    geom_point(shape = 1, colour = "black", fill = "white", size = 2, stroke = 1.5) + ylim(-15, 15) + xlim(0, 30) +
    labs(title = "Bland-Altman", x = "GS", 
         y = "GS - SS_240s") + 
    # Línea de bias
    geom_hline(yintercept = median(datos$diferencia), lwd = 0.7) +
    # Línea en y=0
    geom_hline(yintercept = 0, lty = 3, col = "grey30", lwd = 0.7) +
    # Limits of Agreement
    geom_hline(yintercept = #median(datos$diferencia) + 
                 Diffu, lty = 2, col = "firebrick", lwd = 0.7) +
    geom_hline(yintercept = #median(datos$diferencia) + 
                 Diffl, lty = 2, col = "firebrick", lwd = 0.7) +
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank()) +
    geom_text(label = "Sesgo", x = 2,
     y = median(datos$diferencia) + 0.5, size = 4, 
              colour = "black") +
    geom_text(label = "LoA Sup", x = 2, 
    y = Diffu+ 0.5, size = 4, 
              colour = "firebrick") +
    geom_text(label = "LoA Inf", x = 2, 
    y = Diffl + 0.5, size = 4, 
              colour = "firebrick") +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, color="black", size=16, face="bold"),
                       axis.title.x = element_text(color="black", size=16, face="bold"),
                       axis.title.y = element_text(color="black", size=16, face="bold")) +
    theme(axis.text.x = element_text(face = "bold", color = "black",size = 16),
          axis.text.y = element_text(face = "bold", color = "black", size = 16))
  BA_plot
}
