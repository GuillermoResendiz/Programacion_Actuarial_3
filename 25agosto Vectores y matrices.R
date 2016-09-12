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
setwd("~/GitHub/Programacion_Actuari?al_3",nrows= 10)
data<- read.table("Datos.csv", T, ",", nrows= 100)
clases <- sapply(data, class)#para facilitar la leectura de los datos
data <- read.table("Datos.csv", T, ",", colClasses = clases)
data


#uso de dput y dget
y <- data.frame(a=1,b= "a")
dput(y)
dput(y, file= "y.R")
nueva.y <- dget("y.R")
y
nueva.y

x <- "Progamacion"
y <- data.frame(a=1, b="a")
dump(c("x","y"), file = "data.R")
rm(x,y)
source("data.R")

aq<- data.frame(airquality)
dump(c("aq"), file = "airquality.R")
aq

con <- url("http://www.fcfm.buap.mx/", "r")
x<- readLines(con, 7)
x

#Subconjuntos
x<- c("a","b","c","c","d","e")
x
#extraemos elementos con []
x[1]
x[2]
#también podemos extraer una secuencia de elementos
x[1:4]
#es posible extraer elementos que cumplan con una condición
x[x>"b"]
#de manera equivalente con un vector lógico
u<- x== "c"
u
x[u]

#creamos una lista
x<- list(foo= 1:4, bar = 0.6)
#???extraemos el primer elemento de la lista,
#este elemento es una lisa que contiene una secuencia
x[1]

#extraemos nuevamente el primer elemento de la lista
#ahora el elemento es una secuencia solamente
x[[1]]

#extracción por nombre
x$bar
x["bar"]
x[["bar"]]
#para extraer el elemento de una de las listas de x
x$foo[2]

x<- list(foo= 1:4, bar = 0.6, baz = "Hola")
x[c(1,3)] #se extrae el foo y el baz
x[[c(1,3)]] #se extrae el tercer elemento de la primera lista, también funciona con x[[1]][[3]]
name<- "foo"
x[[name]] #extrae 1 2 3 4 
x$name #regresa NULL porque tienes que especificar con foo

x <- matrix(1:6,2,3)
x
x[1,2] #extraer un elemento de la matriz
x[1,] #extraer tora una fila
x[,2] #columna

x[1,2] #el resultado será un vector
x[1,2, drop=F] #el resultado será una matriz

x <- list(aarkvar= 1:5)
x$aarkvar#extraerá el elemento aarkvar porque $ no pide coincidencia exacta
x[["a"]] #regresará NULL porque sí pide coincidencia exacta pero se arregla con:
x[["a", exact= F]]


#valores faltantes
airquality[1:6,]
completos <- complete.cases(airquality)
completos
airquality[completos,] #para extraer solo las filas que tienen valores completos (sin NA)
airquality[completos,][1:6,] #las primeras 6 filas con valores completos
airquality[1:6,][completos,] 


#OPERACIONES
x<- 1:4; y<- 6:9
x+y 
x>2
x>=2
y ==8
x*y
x/y


x<- matrix(1:4, 2,2); y<- matrix(rep(10,4),2,2)
x*y
x/y
x %*% y #para la multiplicación de matrices con el método original



for (i in 1:10){
  print(i)
}

x<- c("a", "b", "c", "d")
for (i in seq_along(x)){
  print(x[i])
}
  

for(letra in x){
  print(letra)
}

for(i in 4:1) print(x[i]) 

m <- matrix(1:6,2, 3)
m
for(i in seq_len(nrow(m))){
  for(j in seq_len(ncol(m))){
    print(m[i,j])
  }
}




arriba<- 0
abajo<- 0
x<- 1

repeat{
  z <- 5 
cam<- vector("numeric")
 ciclo<- while(z>=3 && z<=10){
    print(z)
    cam <- c(cam,z)
    moneda <- rbinom(1,1,0.5)
    if(moneda == 1) { #caminata aleatoria
      z<- z+0.5
      
    } else {
        z<- z-0.5
    }
 }
 
 if(z<3){
   arriba<- arriba+1
 }else {
   abajo<- abajo +1
 }
 x<- x+1
 if(x==100){break}
}
 
arriba
abajo







