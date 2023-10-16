
### Loading packages

pacman::p_load(ggplot2,readxl,dplyr,cowplot,xtable)

### Reading data
dados <- read_xlsx('data_imput.xlsx')


###----Plot: fixed size n = 500---####
data500 <- dados %>% filter(n==500)

### Mean square error (Erro quadrático médio- EQM)
EQ500 <- ggplot(data500, aes(x=percentil))+
  geom_line(aes(y=EQM.media), color="#191970", size=1)+
  geom_line(aes(y=EQM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EQM), color="#228B22", size=1)+
  theme_minimal()+
  ylim(17.5,28)+
  scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
  labs(x = "% de dados faltantes", y="EQM",
       title = "EQM", subtitle = "n=500")

### Mean absolute error - (Erro absoluto médio - EAM)
EA500 <- ggplot(data500, aes(x=percentil))+
  geom_line(aes(y=EAM.media), color="#191970", size=1)+
  geom_line(aes(y=EAM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EAM), color="#228B22",size=1)+
  ylim(3.3,4.2)+
  theme_minimal()+
  labs(x = "% de dados faltantes", y="EAM",
       title = "EAM", subtitle = "n=500")+
  annotate("segment", x = 0.4, xend = 0.42, y = 3.6, yend = 3.6,
           colour = "#191970", size=1)+
  annotate(geom="text", x=0.45, y=3.6, label="Média",
           color="black", size = 3)+
  annotate("segment", x = 0.4, xend = 0.42, y = 3.57, yend = 3.57,
           colour = "#b30000", size=1)+
  annotate("segment", x = 0.4, xend = 0.42, y = 3.54, yend = 3.54,
           colour = "#228B22", size=1)+
  annotate(geom="text", x=0.465, y=3.57, label="Regressão",
           color="black", size = 3)+
  annotate(geom="text", x=0.455, y=3.54, label="Original",
           color="black", size = 3)+
  scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
  annotate(geom="text", x=0.05, y=4.2, label="",
           color="black", size = 5)

plot_grid(EQ500,EA500)


###----Plot: fixed size n = 100---####

data100 <- dados %>% filter(n==100)

### Mean square error (Erro quadrático médio- EQM)
EQ100 <- ggplot(data100, aes(x=percentil))+
         geom_line(aes(y=EQM.media), color="#191970", size=1)+
         geom_line(aes(y=EQM.RL), color="#b30000", size=1)+
         geom_line(aes(y=EQM), color="#228B22", size=1)+
         theme_minimal()+ylim(22.4,26.5)+
         scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
         labs(x = "% de dados faltantes", y="EQM",
           title = "EQM", subtitle = "n=100")

### Mean absolute error - (Erro absoluto médio - EAM)
EA100 <- ggplot(data100, aes(x=percentil))+
  geom_line(aes(y=EAM.media), color="#191970", size=1)+
  geom_line(aes(y=EAM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EAM), color="#228B22",size=1)+
  theme_minimal()+
  labs(x = "% de dados faltantes", y="EAM",
    title = "EAM", subtitle = "n=100")+
         ylim(3.8,4.15)+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.12, yend = 4.12,
           colour = "#191970", size=1)+
  annotate(geom="text", x=0.45, y=4.12, label="Média",
           color="black", size = 3)+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.10, yend = 4.10,
         colour = "#b30000", size=1)+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.08, yend = 4.08,
           colour = "#228B22", size=1)+
  annotate(geom="text", x=0.458, y=4.10, label="Regressão",
           color="black", size = 3)+
  annotate(geom="text", x=0.455, y=4.08, label="Original",
           color="black", size = 3)+
    scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
  annotate(geom="text", x=0.05, y=4.2, label="",
           color="black", size = 5)


plot_grid(EQ100,EA100)


###----Plot: fixed size n = 30---####
data30 <- dados %>% filter(n==30)

### Mean square error (Erro quadrático médio- EQM)
EQ30 <-ggplot(data30, aes(x=percentil))+
  geom_line(aes(y=EQM.media), color="#191970", size=1)+
  geom_line(aes(y=EQM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EQM), color="#228B22", size=1)+
  theme_minimal()+
  ylim(17.5,28)+
  scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
  labs(x = "% de dados faltantes", y="EQM",
       title = "EQM", subtitle = "n=30")

### Mean absolute error - (Erro absoluto médio - EAM)
EA30<- ggplot(data30, aes(x=percentil))+
  geom_line(aes(y=EAM.media), color="#191970", size=1)+
  geom_line(aes(y=EAM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EAM), color="#228B22",size=1)+
  ylim(3.3,4.2)+theme_minimal()+
  labs(x = "% de dados faltantes", y="EAM",
       title = "EAM", subtitle = "n=30")+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.17, yend = 4.17,
           colour = "#191970", size=1)+
  annotate(geom="text", x=0.45, y=4.17, label="Média",
           color="black", size = 3)+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.13, yend = 4.13,
           colour = "#b30000", size=1)+
  annotate("segment", x = 0.4, xend = 0.42, y = 4.09, yend = 4.09,
           colour = "#228B22", size=1)+
  annotate(geom="text", x=0.465, y=4.13, label="Regressão",
           color="black", size = 3)+
  annotate(geom="text", x=0.455, y=4.09, label="Original",
           color="black", size = 3)+
  scale_x_continuous(labels = scales :: percent_format(accuracy = 1))+
  annotate(geom="text", x=0.05, y=4.2, label="",
           color="black", size = 5)

plot_grid(EQ30,EA30)
  
  
###############################################################################

###----Plot: fixed na's percentile % = 20 ---####
data0.2 <- dados %>% filter(percentil==0.2)

### Mean square error (Erro quadrático médio- EQM)
EQM_0.2 <- ggplot(data0.2, aes(x=n))+
  geom_line(aes(y=EQM.media), color="#191970", size=1)+
  geom_line(aes(y=EQM.RL), color="#b30000", size=1)+
  geom_line(aes(y=EQM), color="#228B22", size=1)+
  theme_minimal()+
  labs(x = "Tamanho da amostra (n)", y="EQM",
    title = "EQM", subtitle = "DF's = 20%")

### Mean absolute error - (Erro absoluto médio - EAM)
EAM_0.2 <- ggplot(data0.2, aes(x=n))+
    geom_line(aes(y=EAM.media), color="#191970", size=1)+
    geom_line(aes(y=EAM.RL), color="#b30000", size=1)+
    geom_line(aes(y=EAM), color="#228B22", size=1)+
    theme_minimal()+
    labs(x = "Tamanho da amostra (n)", y="EAM",
         title = "EAM", subtitle = "DF's = 20%")+
    annotate("segment", x = 395, xend = 415, y = 3.75, yend = 3.75,
             colour = "#191970", size=1)+
    annotate(geom="text", x=440, y=3.75, label="Média",
             color="black", size = 3)+
    annotate("segment", x = 395, xend = 415, y = 3.73, yend = 3.73,
             colour = "#b30000", size=1)+
    annotate("segment", x = 395, xend = 415, y = 3.71, yend = 3.71,
             colour = "#228B22", size=1)+
    annotate(geom="text", x=458, y=3.73, label="Regressão",
             color="black", size = 3)+
    annotate(geom="text", x=448, y=3.71, label="Original",
             color="black", size = 3)

    
  plot_grid( EQM_0.2, EAM_0.2)
  
###############################################################################
  
# Gerarating Table with the erros
dados_lat <- dados %>% filter(n %in% c(20,50,100,500)) %>% 
  filter(percentil %in% c(0.05,0.2,0.3,0.5)) %>% 
  arrange(n, percentil)

  
dados_lat <- dados_lat[,c(7,8,1,2,3,4,5,6)] 
  
xtable(dados_lat2)
  