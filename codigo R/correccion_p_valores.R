#correccion valores de p

p_values<-c(0.00,0.00,0.04,0.02,0.04)

p_corregidos <- p.adjust(p = p_values, method = "bonferroni")

print(p_corregidos)

