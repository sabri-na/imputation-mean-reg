# Técnicas de Imputação para Variáveis Quantitativas: Imputação por Média e Imputação por Regressão Linear

## Resumo:
Este estudo compara dois métodos de Imputação Única que utilizam dois
conceitos muito importantes e disseminados na estatística, a média e a regressão linear.
Através de simulações em R, foi obtido resultados em que a imputação por regressão linear
simples teve melhor performance para diferentes cenários de amostras.

## Contexto e Objetivo:
É comum ter que
lidar com dados que tenham valores ausentes em sua composição. Isso pode decorrer de
vários fatores como falhas humanas no processo de coleta de dados, defeitos operacio-
nais em equipamentos ou ferramentas (RIBEIRO, 2015), alto custo na coleta de dados
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


## Resultados e Conclusão:

No gráfico de linhas da Figura 1, fixou-se o tamanho da amostra igual a 100 e observou-
se o comportamento do EQM e EAM para as diferentes porcentagens de dados faltantes
na amostra. 

Para produzir diferentes cenários de imputação, as amostras geradas foram variadas
segundo seu tamanho (n) e sua porcentagem de dados faltantes (df’s), os resultados dessas
variações são apresentados na Tabela 1:

### Instalação:
Nesse projeto foram utilizadas os seguintes pacotes no código em R: gplot2, readxl, dplyr, xtable.

### Instruções de Uso e Descrição: 
1. Os dados simulados e as imputações foram gerados em *imputation_mean_regression.R*;
2. Os gráficos que comparam os métodos diferentes de imputações estão em *graphics_imputation.R*;
3. O arquivo em *excel* com os resultados dos dados simulados em (1) é o *data_imput.xlsx*.
4. O projeto de Iniciação Científica que descreve de maneira mais detalhada essa pesquisa está em *search_pibic.pdf*
