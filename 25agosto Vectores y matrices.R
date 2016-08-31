#cREAR VECTORES con la función vector

x <- vector(mode= "numeric", length= 5)

#Crear vectores con la función c

x <- c(0.5,0.6)

x <- c(TRUE, FALSE, T, F)

x
x <- 5:10
class(x)

x <- c(1+2i, 5, 3+9i, -4-5i)
x
class(x)

x <- c("a", "b" , "c", "d")
x
class(x)

#Mezcla de objetos en vectores

y <- c(1.7, "a")
y <- c(TRUE, 2)
y <- c("a", TRUE)

z <- c(TRUE, 10L, 8.5, 5+1i, "Nacho")
z
class(z)
# ORDEN DE COACCIÓN EXPLÍCITA

# 1 character
# 2 complex
# 3 numeric
# 4 integer
# 5 logical


# COACCIÓN EXPLÍCITA

z <- 0:6
z
class(z)
as.numeric(z)
as.logical(z)


#LISTAS (es como un vector , pero de vectores y cada uno tiene su propia clase)

x <- list(1, "a", TRUE, 5+7i, 1:100)
x
class(x)


#MATRICES

m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)
#cambio de dimensiones de 2,3 a 3,2
dim(m) <- c(3,2)
m

#crear una matriz con datos

m <- matrix(1:6, 3,2,T)
m
str(m)

dim(m) <- c(2,5)#esto va a producir error
x <- c(1,2,3)
y <- c("a", "b","c")
z<- c(x,y)
z

m1 <- rbind(m,x)
m1

m2 <- cbind(x)
m2

#Factores
x<- factor(c("si", "no", "si", "si", "no", "si", "no"),levels = c("si", "no"))
x
table(x)
unclass(x)

x<- factor(c("azul", "azul", "rojo", "azul", "amarillo"))
x
table(x)


#VALORES FALTANTES
x<- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

x<- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)


#DATA FRAMES
x<- data.frame(Erick = 1:4, Lori = c(T,T,F,F))
row.names(x) <- c("primero", "segundo", "tercero", "cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x)<- c("Carlos","Juan")#names no es exclusivo de data frames, también 
                              #se utliiza en vectores, listas.
x

m<- matrix(1:4, 2,2)
m
attributes(m)
dimnames(m) <- list(c("fil1", "fil2"), c("col1","col2"))
m

m<- matrix(NA, 5,5)
m
dimnames(m) <- list(c(1:5), c("A","B","C","D","E"))
m


#LECTURA DE DATOS
getwd()
setwd("~/GitHub/Programacion_Actuarial_3")
data<- read.csv("Datos.csv")
data<- read.table("Datos.csv", F, ",")
data
