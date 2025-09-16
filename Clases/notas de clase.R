
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




