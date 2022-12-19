score <- function(data, model, ...){
    pred.model <- predict(model, newdata = data, type = "response")
    predictions <- data.frame(pred.model, 1-pred.model)
    colnames(predictions)<-c("1","0")
    return(predictions)
}