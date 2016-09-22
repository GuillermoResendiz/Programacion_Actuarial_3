
completos<- function(directorio="C:/Users/guillermo/Documents/GitHub/Programacion_Actuarial_3/specdata", id=1:332){
  num<- vector("numeric")
  setwd(directorio)

for (i in id){
  if (i<10) {
    leer<- read.csv(paste("00", i, ".csv", sep=""))
            } else if(i>=10 && i<100 ) {
    leer<- read.csv(paste("0", i,".csv", sep=""))
  }else {
    leer<- read.csv(paste(i,".csv",sep=""))
  }
  combinar<- cbind(leer[, 2:3])
  casoscomp<- complete.cases(combinar)
  cas<- combinar[casoscomp, ]
  cont<- nrow(cas)
  num<- c(num, cont)
}
resultado<- data.frame(id, nobs= num)
resultado
}
