




library(ggplot2)
library(dplyr)
library(car)

tyre <- read.csv("tareas/tyre.csv")
head(tyre,20)


ggplot(tyre,
       aes(x=Brands, y=Mileage))+geom_boxplot()

color <- c("red", "blue", "pink","orange")

p <- ggplot(tyre,
       aes(x=Brands, y=Mileage))+
  geom_boxplot(aes(fill=Brands))+
  
  #labels
  labs(title="LLantas en PR", x= "llantas", y= "kilometros", fill="Car Brands")+
  
  #temas de los ejes
  
  theme(plot.title= element_text(size=18, face="bold", hjust=0.5, color="red"))+
 
   theme(axis.title.y = element_text(size=18, face = "bold", color = "black"),
        axis.text.y = element_text(size=12, face = "plain", color = "black"))+
 
   theme(axis.title.x = element_text(size=18, face = "bold", color = "black"),
        axis.text.x = element_text(size=12, face = "plain", color = "black"))+
  
  #tema de la legenda
 
   theme(legend.title = element_text(size=16, face="bold", color = "red"))+theme_classic()

  p
  
  #ylim, para cambiar el tamaño de los ejes.
   #temas bonitos
  #theme_bw()



#theme_minimal()


# ANOVA -------------------------------------------------------------------
   
  
mod <- aov(Mileage~Brands, data=tyre)
summary(mod)

resid_anova <- resid(mod)
shapiro.test(resid_anova)  
leveneTest(Mileage~Brands,data=tyre)
TukeyHSD(mod)

  

# save plot ---------------------------------------------------------------

p
ggsave(filename ="plot.png",plot = p, width=8, height = 6, dpi=300)


