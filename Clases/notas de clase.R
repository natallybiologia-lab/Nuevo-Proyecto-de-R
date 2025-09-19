
df <- data.frame(
    Name= c("yoda","r2D2","chewbacca","obiwan","skywalker" ), 
    Age= c(900,36,235,57,53),
    Weight= c(130,180,150,170,160)
    )
df



# subsets -----------------------------------------------------------------


df[1,]# first row
df[,2]
df[1:3,1]


subset <- df[df$Age > 235,]
subset

subset (df, Age> 100 & Weight < 200)
#poner el subset delante de la función del dataframe. no poner la flechita.

df$Heigth <- c(66,109,228,182,172)
df

df$Jedi <- c(T,F,F,T,T)
df

new_row <- data.frame(Name="Darth Vader",Age= 45, Weight =129, Heigth =292, Jedi=F)


new_row

df1 <- rbind(new_row,df)

df1

colnames(df) <- c("character","Age (yrs)", "Weight (kg)", "Height (m)","jedi")

df
str(df)






df2 <- data.frame(character=c("yoda","skywalker", "chewbacca", "r2D2", "obiwan", "Darth vader"), 
                  Planet= c("planet1", "planet2", "planet3", "planet4", "planet5", "planet6")
)

merged_df <- merge(df,df2,by="character")
merged_df                  



#import data
codon_usage <- read.csv("codon_usage.csv")
head(codon_usage)

str(codon_usage)

viral <- codon_usage[codon_usage$Kingdom == "vrl", ]
head(viral,10)


viral_bacteria <- codon_usage[codon_usage$Kingdom %in% c("vrl", "bct"), ]

---------------------------------------------------------------------------------

  ##CLASE DE dplyer
  

  
  %>% 
  
 install.packages("dplyer")
library(dplyr)
library(ggplot2)



data("starwars")
head(starwars,3)
View(starwars)  

str(starwars)

starwars %>% 
  filter(species== "Droid")
subset(starwars,species=="Droid")

starwars%>%
  filter(skin_color== "light",
         eye_color== "brown")

starwars %>% 
arrange(desc(height))

starwars %>% 
slice(5:10)  

starwars %>% 
slice_head(n=8)  

starwars %>% 
select(hair_color,skin_color,eye_color) %>% 
  filter((skin_color== "white"))

starwars %>% 
select(!name & !skin_color)

starwars %>% 
  select(-name,-skin_color)

starwars %>% 
  select(1,2,species) %>% 
  filter(species=="Droid")

starwars %>% 
rename(character=name)

code <- starwars %>% 
select(starts_with("na"))

starwars %>% 
  dplyr::rename(character= name)


#mutate

starwars %>% 
  mutate(new_col=height/100) %>% 
  select(new_col,height,everything())

starwars %>% 
  mutate(new_col= height/100,
         .keep = "none")

newstarwars <- starwars %>% 
  mutate(height_m= height/100)

newstarwars %>% 
  select(height_m)

starwars %>% 
  mutate(height_cat=ifelse(height>100,"tall","small")) %>%
  select(height,height_cat,everything()) %>% 

  ggplot(aes(x= height,fill = height_cat))+geom_histogram() + labs(x="algo", y="otro")


starwars %>% 
  summarise(mean= mean(height,na.rm=T),
            min= min(height,na.rm=T),
            max= max(height,na.rm = T),
            sd= sd(height,na.rm = T))

starwars %>% 
  group_by(species) %>% 
  summarise(
    mean_height= mean(height,na.rm=T),
    sd_height= sd(height,na.rm=T)) %>% 
  print(n=20)

starwars %>% 
  group_by(species) %>% 
  count(homeworld,sort=T)

starwars %>% sample_n(10,replace=T)





