library(caTools)
library(rpart)
library(rpart.plot)

osn_datasetT <- read.csv("data/titanic.csv")
View(osn_datasetT)

osn_data <- subset(osn_datasetT, select = - {PassengerId; Ticket})
View(osn_data)
random_indexes <- sample(1:nrow(osn_data))
osn_data <- osn_data[random_indexes,]

spl = sample.split(osn_data$Survived, SplitRatio = 0.75)
osn_ads_train = subset(osn_data, spl == TRUE)
osn_ads_test = subset(osn_data, spl == FALSE)

View(osn_ads_train)
osn_ads_model <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                                                data = osn_ads_train, 
                                                method = 'class',
                                                control = rpart.control(
                                                      minsplit=2
                                                  )
                         )
osn_ads_model

rpart.plot(osn_ads_model, extra = 102)