# Técnicas de Imputação para Variáveis Quantitativas: Imputação por Média e Imputação por Regressão Linear

### Instalação:
Nesse projeto foram utilizadas os seguintes pacotes no código em R: gplot2, readxl, dplyr, xtable.

### Instruções de Uso e Descrição: 
1. Os dados simulados e as imputações foram gerados em *imputation_mean_regression.R*;
2. Os gráficos que comparam os métodos diferentes de imputações estão em *graphics_imputation.R*;
3. O arquivo em *excel* com os resultados dos dados simulados em (1) é o *data_imput.xlsx*.
4. O projeto de Iniciação Científica que descreve de maneira mais detalhada essa pesquisa está em *search_pibic.pdf*

## Resumo:
Este estudo compara dois métodos de Imputação Única que utilizam dois
conceitos muito importantes e disseminados na estatística, a média e a regressão linear.
Através de simulações em R, foi obtido resultados em que a imputação por regressão linear
simples teve melhor performance para diferentes cenários de amostras.

## Contexto e Objetivo:
É comum ter que
lidar com dados que tenham valores ausentes em sua composição. Isso pode decorrer de
vários fatores como falhas humanas no processo de coleta de dados, defeitos operacionais em equipamentos ou ferramentas (RIBEIRO, 2015), alto custo na coleta de dados
(MYRTVEIT et. al., 2001) e até mesmo em decorrência de participantes de pesquisa que
optam por não responder algum item de um questionário (ALLISON, 2001).

A análise de dados incompletos pode gerar vieses de seleção, principalmente se os indivíduos
que respondem e estão na análise são sistematicamenete diferentes daqueles que optaram
pela não resposta (ERCOLE et al., 2010). Ademais, lidar com dados incompletos produz
menor eficiência nas estimativas, já que a amostra é reduzida (NUNES, 2007). Sendo
assim, uma análise incompleta pode causar dependências que impactam os estudo de
características amostrais e na tomada de decisões (CARVALHO, 2017).

Para sanar esse problema, a imputação de dados visa substituir os valores ausentes por dados que
façam sentido.

Na imputação única, os dados ausentes são preenchidos uma única vez
para se obter o banco de dados completo. Dentro desse escopo, alguns dos métodos
existentes são a imputação pela média e a imputação por regressão linear. Dessa forma,
esse estudo se propõe a analisar e comparar esses dois tipos de técnicas na imputação
única, analisando dados simulados com os referentes métodos aplicados.

## Metodologia:

A simulação consistiu em gerar diferentes amostras variando seu tamanho (20, 50, 100
e 200) e sua porcentagem de dados faltantes (5%, 20%, 30%, 50%) a fim de se comparar
a imputação para diferentes cenários. As amostras constituíram-se de quatro variáveis,
sendo três variáveis explicativas e a variável resposta.

Nesse processo foram utilizadas 1000 réplicas de Monte Carlo para gerar cada amostra,
e para aferir as imputações foram calculadas as medidas de Erro Quadrático Médio (EQM) e  Erro Absoluto Médio (EAM), com base nos
valores originais dos dados completos. Essas medidas foram baseadas na média das 1000
réplicas de Monte Carlo.

Além disso, os valores de EQM e EAM do modelo considerando os dados completos
foram calculados com o intuito de comparar o desempenho dos dois métodos de imputação
adotados nesse estudo.


## Resultados:

Para produzir diferentes cenários de imputação, as amostras geradas foram variadas
segundo seu tamanho (n) e sua porcentagem de dados faltantes (df’s), os resultados dessas
variações são apresentados na seguinte Tabela:

<img 
  src="/plots/tabela1.PNG"
  height = 400>

Percebe-se, primeiramente, que valores dos erros são maiores para as
amostras maiores. Identifica-se que as menores medidas de erro são para a amostra de
tamanho 20, com 5% de dados faltantes (EQM - média = 20.8 e EQM - RL = 19.78).
Observa-se também que para todos os tamanhos de amostra (20, 50, 100 e 500) os erros
apresentam um padrão: para todos os casos, em todas as proporções de dados faltantes,
o erro quadrático médio e o erro absoluto médio apresentam maiores valores para a im-
putação por média, enquanto que os EQM’s e os EAM’s para a imputação por regressão
são valores intermediários entre os erros pela imputação por média e os erros da amos-
tra com dados completos. Isso indica a melhor performance da imputação por regressão
independente do tamanho da amostra ou da proporção de dados faltantes.



No gráfico de linhas a seguir, fixou-se o tamanho da amostra igual a 100 e observou-
se o comportamento do EQM e EAM para as diferentes porcentagens de dados faltantes
na amostra. 

<img src="/plots/grafico2.PNG">

O comportamento para as duas medidas de erro se mostra
bastante similar. É possível verificar que a linha azul, que representa a imputação pela
média, apresentou valor de erro superior para todas as porcentagens de dados faltantes.
Já a linha vermelha, que nos mostra a imputação por regressão, com porcentagens de
dados faltantes menores, se aproxima bastante da medida de erro para o conjunto de
dados completos (linha verde) e se mantém abaixo da linha da imputação por média em
todo gráfico. Isso indica a melhor performance da imputação por regressão para uma
amostra de tamanho 100, com diferentes percentis de dados ausentes.

No próximo gráfico é mostrado o comportamento do EQM e do EAM quando há 20% dos dados ausentes para diferentes tamanhos de amostras. 

<img src="/plots/grafico1.PNG">

Vê-se
que ambos gráficos para os diferentes erros possuem comportamentos muito semelhantes.
Primeiramente o que se observa é a crescente dos valores de erro a medida que o tamanho
da amostra cresce. Ademais a imputação pela média apresentou maiores valores de EQM
e EAM quando comparados com aqueles erros obtidos pela imputação por regressão.


## Conclusão:

Através das simulações, foi possível verificar que para vários cenários, onde se foi es-
tabelecido diferentes tamanhos de amostras e diferentes proporções de dados faltantes,
chegando até um caso extremo de 50% de df’s, a imputação por média se mostrou menos
eficiente do que a imputação por regressão, qualquer que seja o tamanho da amostra ou
porcentagem de dados faltantes.

Em observação, entende-se que a imputação por regressão é um método de melhor
performance do que o método realizado pela média, por sua natureza matemática. Note
que, a imputação por regressão em um cenário em que não há correlação entre as variáveis
irá resultar em uma imputação pela média, pois o intecepto de um modelo linear sem
covariáveis é, na realidade, a média. Assim, pode-se considerar que a imputação pela
média é um caso particular da imputação por regressão.



