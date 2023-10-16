
# Function: does the data simulation, reduces the data (introduzing na's)
# and perform mean imputation and linear regression imputation

imput_func  <- function(n,p){
# n = sample size
# p = missing data proportion
  
m <- 1000  ## monte carlo replicas
EQM <- EQM.media <- EQM.RL <- numeric(m)
EAM <- EAM.media <- EAM.RL <- numeric(m)

set.seed(22222)

for (i in 1:m){
  
  ### generating data
  x2 <- rbinom(n, 1, 0.4) ## binary covariate with probability of success p = 0.4
  x3 <- rexp(n,.2) ## covariate generated from the exponential distri. with lambda = 0.2
  x1 <- 2*x2 - .1*x3 + rnorm(n,0,.5)  ##  covariate that depends on x2 and x3 
  # added an error generated from the normal distribution
  
  y <- 3*x1 - 0.5*x2 + x3 + rnorm(n,0,5) ## response varible of the model
  
  dados <- as.data.frame(cbind(y,x1,x2,x3)) 
  
  est <-lm(y~x1+x2+x3) ## regression model
  prev <- predict(est) ## doing the prediction
  
  EQM[i]<-mean((y-prev)^2) ## mean square error
  EAM[i]<-mean(abs(y-prev)) ## mean absolute error
  
  
  missings <- sample(1:n, p*n, replace = FALSE)
  d.red <- dados[-missings,] ## data reduced
  
  
  #### mean imputation
  DImedia <- dados
  DImedia$x1[missings] <- mean(d.red$x1) ## imputing with the x1 mean
  
  est.media<-lm(DImedia$y~DImedia$x1+DImedia$x2+DImedia$x3) ## generating model
  #with the data imputaded
  prev.media<-predict(est.media)
  
  EQM.media[i]<-mean((DImedia$y-prev.media)^2)
  EAM.media[i]<-mean(abs(DImedia$y-prev.media))
  
  
  ### linear regression imputation
  est.glm.RL <- lm(d.red$x1 ~ d.red$x2 + d.red$x3) 
  
  d.missing <- dados[missings,]   ##  missing data to be imputed
  x1.imput <- est.glm.RL$coef[1] + est.glm.RL$coef[2]*d.missing$x2 +
    est.glm.RL$coef[3]*d.missing$x3
  
  DI.RL <- dados
  DI.RL$x1[missings] <- x1.imput
  
  ## generating the model with the new imputed data
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

### Auxiliar function that returns the imputation for every 
# desired proportion of missing data

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


### Final dataframe with every desired samples sizes
data_imput <- rbind(func2(20),func2(30),func2(50),
                func2(100),func2(300),func2(500))


#require(rio)
#export(data_imput, "data_imput.xlsx")
