id<- vector("character", length = 3L)
contaminante<- vector("character", length = 1L)
directorio<- vector("character", length = 1L)
mediacontaminante<- function(directorio= "C:/Users/guillermo/Documents/GitHub/Programacion_Actuarial_3/specdata", contaminante, id= 1:332){
  if (id < 10){
    id<-paste("00", id, sep="")
  }
  if (id<100 && id>= 10){
    id<- paste("0", id, sep="")
  }
 
  setwd(directorio)
  leer<- read.csv(paste(id, ".csv", sep=""), header = T)
  
  #sacar los promedios
  
  if (contaminante== "nitrato"){
    pn<- mean(leer$nitrate,trim=0, na.rm= TRUE)
    print(pn)
  } else if (contaminante== "sulfato"){
    ps<- mean(leer$sulfate, trim= 0, na.rm =TRUE)
    print(ps)
  }
}