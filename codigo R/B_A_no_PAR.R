B_A_no_PAR<-function(A,B)
{ 
  a<-bland_altman_no_parametrico(A,B) # Obtiene todos los valores y graficos correspondiente a BA
  tuto<-calculo_B_A(a)# Calcula los valores de los graficos Correlacion y BA
}