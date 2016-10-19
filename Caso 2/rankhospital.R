rankhospital <- function(estado, resultado, num) {
    setwd("C:/Users/guillermo/Documents/GitHub/Programacion_Actuarial_3")
    
    if (resultado=="ataque"){
        resultado<- 11} else{
            if (resultado=="falla"){
                resultado <- 17} else{
                    if (resultado=="neumonia"){
                        resultado <- 23} else{ 
                            stop("Resultado inválido")}
                }
        }
    
    #Leectura de datos
    outcome <- read.csv("outcome-of-care-measures.csv")
    lugar <-  as.character(outcome$State)
    if(!(estado %in% lugar)){
        stop("Estado inválido")
    }
    
    
    #función   
    lugarsolo <- subset(outcome, lugar == estado)  #subconjunto (un estado)
    tenernum<- lugarsolo[grep("[[:digit:]]", lugarsolo[,resultado]), ] #excluir los NA
    tabla <- data.frame(as.vector(tenernum[,2]), tenernum[, resultado])
    ordenar<- tabla[order(as.numeric(as.vector(tabla[, 2])), tabla[,1]),]
    if (num == "mejor"){
        a<-as.character(ordenar[1, 1])
        print(a)
    } else{
        if (num== "peor"){
        b<-    as.character(ordenar[length(ordenar), 1])
        print(b)
        }else{
        if(!(num == "peor" | num == "mejor")){
    as.character(ordenar[num, 1])
    }   
    }    
    }
}