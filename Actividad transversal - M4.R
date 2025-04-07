#----ACTIVIDAD 2
# Establecer el directorio de trabajo (asegúrate de cambiar la ruta según tu entorno)
# usar setwd() para cambiar el directorio de trabajo
setwd("D:\Documents\women in\ciencia de datos\EJERCICIOS")  # *** Reemplazar con la ruta 

# Verifica el directorio de trabajo actual
getwd()  # Muestra el directorio de trabajo actual

# Crear un directorio dentro de tu proyecto
dir.create("datos")

# Archivo CSV en la carpeta "datos" llamado "ejemplo.csv"

# Leer datos desde un archivo CSV utilizando readr 
library(readr)

# Usamos una ruta relativa para leer el archivo desde el directorio "datos"
datos <- read_csv("salarios_mujeres.csv")  # Asegúrate de que "ejemplo.csv" exista

# Ver los primeros registros del conjunto de datos
head(datos)

str(datos)#--estructura
summary(datos)#--resumen
colSums(is.na(datos))#--VER SI HAY DATOS FALTANTEs
salarios_limpios <- na.omit(datos)#--quitar vacios
salarios_sin_duplicados <-salarios_limpios[!duplicated(salarios_limpios), ]#--ELIMIANR DUPLICADOS

salario_fil <- salarios_sin_duplicados[salarios_sin_duplicados$Edad %in% c(25,30,40,50), ]

print(paste("filtro por edad", salario_fil))



examen <- c(3, 5, 7, 9, 11)
mediana <- median(examen)
print(paste("mediana", mediana))


#--ACTIVIDAD 3
# Leer datos desde un archivo CSV utilizando readr 
library(readr)

# Usamos una ruta relativa para leer el archivo desde el directorio "datos"
datos <- read_csv("salarios_mujeres.csv")

# Ver los primeros registros del conjunto de datos
head(datos)
colSums(is.na(datos))#--VER SI HAY DATOS FALTANTEs
salarios_limpios <- na.omit(datos)#--quitar vacios
salarios_sin_duplicados <-salarios_limpios[!duplicated(salarios_limpios), ]#--ELIMIANR DUPLICADOS
head(salarios_sin_duplicados)

summary(salarios_sin_duplicados)#--resumen de los datos ya limpios y sin duplicar

mediana_salarios <- median(salarios_sin_duplicados$Salario)#mediana
print(paste("mediana salarios", mediana_salarios))

mediana_edad <-median(salarios_sin_duplicados$Edad)
print(paste("mediana edad", mediana_edad))



media_salarios <- mean(salarios_sin_duplicados$Salario)#media
print(paste("media salarios", media_salarios))

media_edad <-mean(salarios_sin_duplicados$Edad)
print(paste("media edad", media_edad))


#calcular la moda 

moda_salario <- as.numeric(names(sort(table(salarios_sin_duplicados$Salario), decreasing = TRUE)[1]))
print(paste("La moda salario es:", moda_salario))

moda_edad <- as.numeric(names(sort(table(salarios_sin_duplicados$Edad), decreasing = TRUE)[1]))
print(paste("La moda de edad es:", moda_edad))

#HISTOGRAMA
hist(salarios_sin_duplicados$Salario,
     names.arg = salarios_sin_duplicados$Genero,
     main="Grafico de salario por edad",
     xlab = "Edad",
     ylab = "Salario",
     col = "green")

#grafico de barras

barplot(salarios_sin_duplicados$Salario,
        names.arg = salarios_sin_duplicados$Edad,
        main="Grafico de salario por edad",
        xlab = "Edad",
        ylab = "Salario",
        col = "pink",
        las = 2)


#histograma con ggplot2
# Se cargan las librerías necesarias
library(dplyr)
library(ggplot2)
library(readr)

ggplot(salarios_sin_duplicados, aes(x = Edad, y = Salario)) + 
  geom_line(color = "yellow") +
  labs(title = "Grafico de salario por edad") +
  theme_dark()
