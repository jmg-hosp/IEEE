ci_Spearman<-function(rho,n)
{
#Calcula Intervalo confianza Spearman, hecha por mi segun Web
#rho; valor correlacion Spearman
#n, numero elementos
stderr <- 1.0 / sqrt(n-3);
delta <- 1.96 * stderr;
ci_lower <- tanh(atanh(rho) - delta);
ci_upper <- tanh(atanh(rho) + delta);
ci<-list("ci_lower"=ci_lower,"ci_upper"=ci_upper)
}