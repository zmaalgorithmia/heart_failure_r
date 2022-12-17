
set.seed(0)
dataFull = read.csv("//uh10010033.bmwgroup.net/home$/QTD9526/Documents/HeartExample/heart_failure.csv", header=TRUE)

# Split data for training and testing
testRows = sample(nrow(dataFull), 0.2*nrow(dataFull))
dataTest = dataFull[testRows, ]
dataTrain = dataFull[-testRows, ]

model2 <- glm(death_event ~ age+ejection_fraction+serum_creatinine+time, family=binomial, data=dataTrain)
summary(model2)

# Code to estimate binary classification and classification error rate for model2
# Obtain predicted probabilities for the test set
pred.model2 <- predict(model2, newdata = dataTest, type = "response")
# Obtain classifications using a classification threshold of 0.5
predClass.model2 <- ifelse(pred.model2 > 0.5, 1, 0)

###SCORING
classification_error_rate <- mean(abs(dataTest$death_event-predClass.model2))

