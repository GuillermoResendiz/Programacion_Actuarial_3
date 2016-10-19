rankcompleto <- function(resultado, num) {
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
    outcome <- outcome[grep("[[:digit:]]", outcome[,resultado]), ]
    tabla <- data.frame(outcome[,2],outcome[,7], outcome[, resultado])
    tabla <- tabla[order(outcome[,7], outcome[,2]), ]
    final <- NULL
    a = split(tabla, tabla[,2])
    for(y in 1:54){
        num2 <- num
        num1 <- length(which(y == as.numeric(tabla[,2])))
        b <- as.data.frame(a[y])
        a <- b[order(as.numeric(as.vector(b[,3])), b[,1]), ]
        if(num == "mejor"){
            num2 <- 1
        }
        if (num == "peor"){
            num2 <- num1
        }
        a <- data.frame(a[num2,1], a[1,2])
        final <- rbind(final, a)
        a <- split(tabla, tabla[,2])
        num <- num
    }
    colnames(final) <- c("Hospital", "Estado")
    final
    
}
