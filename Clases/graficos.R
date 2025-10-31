
data("DNase")
head(DNase)

mean_density <- aggregate(density~ conc,
                  data= DNase, FUN = mean)
barplot(
  height = mean_density$density, 
  names.arg = mean_density$conc,
  col = "lightblue",
  border = "gray30",
  main = "Mean DNase I Activity by Concentration", 
  xlab = "Concentration (mg/mL)",
  ylab = "Mean Optical Density", 
  las = 1,
  cex.names = 0.8,
  horiz = TRUE
) 

library(readxl)
coronary <- read_excel("Clases/coronary.xlsx")
head(coronary)
 
plot(
  coronary$dbp ~ coronary$chol,
  type = "p", # line plot
  col = "pink", # line color
  lwd = 3, # line width
  xlab = "Total Cholesterol (mmol/L)", # x-axis label
  ylab = "Diastolic Blood Pressure (mmHg)", # y-axis label
  main = "Relationship between Cholesterol and Diastolic BP",
  pch=25
)
abline(lm(dbp ~ chol, data = coronary), col = "red", lwd = 2,lty = 2)

#lm: lineal model

# en type si pongo h me la un histograma.

#si los datos en shapiro son mayores a 0,05 son datos parametricos asi que se usa pearsonn, si es menor se usa spearman


#para mirar los datos hay que probar normalidad con shapiro.

spearman_result <- cor.test(
  coronary$chol,
  coronary$dbp,
  method = "spearman",
  exact = FALSE # avoids warnings with tied ranks
)
spearman_result




coronary <- coronary[order(coronary$age), ]
# Gráfico de líneas básico
plot(coronary$age, coronary$chol,
     type = "l", # "l" = line plot
     col = "blue",
     lwd = 2,
     xlab = "Age (years)",
     ylab = "Cholesterol (mmol/L)",
     main = "Cholesterol vs Age")


#ctrl+shif+R


# histogramas -------------------------------------------------------------


hist(coronary$chol,
     main = "Distribution of Cholesterol",
     xlab = "Cholesterol (mmol/L)",
     col = "lightblue",
     border = "white",
     # breaks = 10, # You can cange the number
)



# boxplot -----------------------------------------------------------------

boxplot(coronary$chol,
        main = "Cholesterol Levels",
        ylab = "Cholesterol (mmol/L)",
        col = "lightgreen",
        border = "darkgreen"
)

#para exportar uso write_csv o xls


boxplot(sbp~gender,
         data=coronary)

anova_model <- aov(sbp ~ gender, data = coronary)
summary(anova_model)

shapiro.test(residuals(anova_model))
--------------------------------------------------------------------------
  

# ggplot ------------------------------------------------------------------



library(dplyr)
library(ggplot2)

tvshows <- read.csv("Clases/tvshows.csv")
head(tvshows)

#crea un ggplot canva

p <- ggplot(data = tvshows,
            mapping = aes(x=GRP, y=PE))+
  geom_point()+ geom_smooth(method = lm)

p

mod <- summary(lm(PE~GRP,data=tvshows))
resid <- resid(mod)
shapiro.test(resid)
---------------------------
#normalización logaritmica REVISAR, NO DA

ggplot((tvshows,aes(x=log(GRP),y=log(PE))))
geom_point()+
  geom_smooth(method=lm)


mod <- lm(log(PE)~log(GRP),data=tvshows))
resid <- resid(mod)
shapiro.test(resid)




# el mapping y la data no es relevante, los crosslinker son los + y se puede hacer sin determinarlo como un objeto.

#la normalidad de los residuales son los que se tienen en cuenta.

