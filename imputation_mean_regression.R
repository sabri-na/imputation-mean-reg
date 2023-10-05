
# Funcao: realiza a simulacao dos dados, 
# reduz os dados (transforma em dados faltantes) e faz a imputacao por
# media e por regressao linear

imput_func  <- function(n,p){
# n = tamanho da amostra
# p = proporcao de dados faltantes
  
m <- 1000  ## n de réplicas de monte carlo
EQM <- EQM.media <- EQM.RL <- numeric(m)
EAM <- EAM.media <- EAM.RL <- numeric(m)

set.seed(22222)

for (i in 1:m){
  
  ### geração dos dados
  x2 <- rbinom(n, 1, 0.4) ## covariavel binaria com prob. de sucesso p = 0.4
  x3 <- rexp(n,.2) ## covariavel gerada da dist. exponencial com lambda = 0.2
  x1 <- 2*x2 - .1*x3 + rnorm(n,0,.5)  ## covariável que depende de x2 e x3 acrescido
  # de um ruído gerado pela  dist .normal
  
  y <- 3*x1 - 0.5*x2 + x3 + rnorm(n,0,5) ## variavel resposta do modelo
  
  dados <- as.data.frame(cbind(y,x1,x2,x3)) 
  
  est <-lm(y~x1+x2+x3) ## modelo de regressao
  prev <- predict(est) ## realizando a predicao com o modelo
  
  EQM[i]<-mean((y-prev)^2) ## erro quadratico medio
  EAM[i]<-mean(abs(y-prev)) ## erro absoluto medio
  
  
  missings <- sample(1:n, p*n, replace = FALSE)
  d.red <- dados[-missings,] ## dados reduzidos
  
  
  #### imputação pela media
  DImedia <- dados
  DImedia$x1[missings] <- mean(d.red$x1) ## imputando pela media de x1
  
  est.media<-lm(DImedia$y~DImedia$x1+DImedia$x2+DImedia$x3) ## gerando modelo 
  # com os dados imputados
  prev.media<-predict(est.media)
  
  EQM.media[i]<-mean((DImedia$y-prev.media)^2)
  EAM.media[i]<-mean(abs(DImedia$y-prev.media))
  
  
  ### imputação por regressao linear
  est.glm.RL <- lm(d.red$x1 ~ d.red$x2 + d.red$x3) 
  
  d.missing <- dados[missings,]   ## dados missings para serem imputados
  x1.imput <- est.glm.RL$coef[1] + est.glm.RL$coef[2]*d.missing$x2 + est.glm.RL$coef[3]*d.missing$x3
  
  DI.RL <- dados
  DI.RL$x1[missings] <- x1.imput
  
  ## gerando o modelo com os novos dados imputados
  est.RL <- lm(DI.RL$y ~ DI.RL$x1 + DI.RL$x2 + DI.RL$x3)
  prev.RL <- predict(est.RL)
  
  EQM.RL[i]<-mean((DI.RL$y - prev.RL)^2)
  EAM.RL[i]<-mean(abs(DI.RL$y - prev.RL))
 
}


return(data.frame("EQM" = mean(EQM), 
                  "EQM.media" = mean(EQM.media),
                  "EQM.RL" = mean(EQM.RL), 
                  "EAM" = mean(EAM),
                  "EAM.media"= mean(EAM.media), 
                  "EAM.RL"= mean(EAM.RL),
                  "n" = n, 
                  "percentil" = p))


}

### Funcao auxiliar que retorna a imputacao para todas
# as proporcoes de dados desejados

func2 <- function(n){
  t_l <- imput_func(n, 0.2)
  t <- c(0.05,0.1,0.2,0.3,0.4,0.5)
  j<-1
  while(j <= length(t)){
    t_l <-rbind(t_l,imput_func(n,t[j]))
    j = j+1
  }
  return(t_l)
}


### Dataframe final com os tamanhos de amostra desejados
data_imput <- rbind(func2(20),func2(30),func2(50),
                func2(100),func2(300),func2(500))


#require(rio)
#export(data_imput, "data_imput.xlsx")
