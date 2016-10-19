mejor <- function(estado, resultado) {
    setwd("C:/Users/guillermo/Documents/GitHub/Programacion_Actuarial_3")
    
    if (resultado=="ataque"){
        resultado<- 11} else{
        if (resultado=="falla"){
            resultado <- 17} else{
            if (resultado=="neumonia"){
                resultado <- 23} else{ 
                stop("Resultado no válido, probar con: ataque, falla, neumonia")}
        }
        }

    #Leectura de datos
    outcome <- read.csv("outcome-of-care-measures.csv")
    lugar <-  as.character(outcome$State)
        if(!(estado %in% lugar)){
            stop("Estado inexistente")
        }
    
    
    #función   
    lugarsolo <- subset(outcome, lugar == estado)  #subconjunto (un estado)
    tenernum<- lugarsolo[grep("[[:digit:]]", lugarsolo[,resultado]), ] #excluir los NA
    solores <-  tenernum[,resultado] 
    ordenar <- sort(as.numeric(as.vector(solores)))
    primer <- as.numeric(ordenar[1]) #tasa más baja
    empate <- subset(tenernum, as.vector(tenernum[,resultado]) == primer) #subconjunto (empatados)
    hospital <- empate[order(empate[,2]),]
    final <- hospital[1,2]
    as.character(final)
    
}