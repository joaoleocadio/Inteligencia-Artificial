library(caTools)
library(rpart)
library(rpart.plot)
set.seed(86192)

#Abrir o ficheiro 
osn_dataset <- read.csv("data/encontros.csv")
View(osn_dataset)

#Dividir o conjunto de dados para gerar dados de treinamento e teste.
#A razão de divisão é igual a 0,7, significando que 70% dos dados serão usados
#para treinar e o restante (30%) será usado para teste.
spl = sample.split(osn_dataset$encontro, SplitRatio = 0.7)
osn_ads_train = subset(osn_dataset, spl == TRUE)
osn_ads_test = subset(osn_dataset, spl == FALSE)

osn_ads_model <- rpart(encontro ~., 
                       data = osn_ads_train, 
                       method = 'class')
                       control = rpart.control(
                       minsplit=1)
              
osn_ads_model

osn_ads_model <- rpart(encontro ~., 
                       data = osn_ads_test, 
                       method = 'class',
                       control = rpart.control(
                         minsplit=1)
)
osn_ads_model

#Construir a árvore de decisão
rpart.plot(osn_ads_model, extra = 102)
