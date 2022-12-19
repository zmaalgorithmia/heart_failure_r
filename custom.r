# Copyright 2021 DataRobot, Inc. and its affiliates.
#
# All rights reserved.
#
# 
#
# This is proprietary source code of DataRobot, Inc. and its affiliates.
#
# Released under the terms of DataRobot Tool and Utility Agreement.
# init <- function(...) {
#     library(glmnet)
# }

# read_input_data <- function(inupt_data){
#     # dataFull = read.csv("heart_failure.csv", header=TRUE)
#     dataFull = read.csv(inupt_data, header=TRUE)
#     return(dataFull)
# }

# load <- function(){
#     model = readRDS("model.rds")
#     return(model)
# }

# transform <- function(data, model) {
#     data[is.na(data)] <- 0
#     # Split data for training and testing
#     testRows = sample(nrow(data), 0.2*nrow(data))
#     dataTest = data[testRows, ]
#     return(dataTest)
# }

score <- function(data, model){
    pred.model <- predict(model, newdata = data, type = "response")
    predictions <- data.frame(pred.model, 1-pred.model)
    # colnames(predictions)<-c("1","0")
    return(predictions)
}