
corr<- function(directorio="C:/Users/guillermo/Documents/GitHub/Programacion_Actuarial_3/specdata", horizonte=0){
  id<- 1:332
  id
  relacion<- vector("numeric")
  final<- vector("numeric")
 
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
    casoscomp<- complete.cases(leer)
    cas<- leer[casoscomp, ]
    cont<- nrow(cas)
    
    if(cont>=horizonte){
      relacion<- cor(cas[2],cas[3])
      vec<- as.vector(relacion)
      final<- c(final, vec)
     
    }
  }
  final 
}
