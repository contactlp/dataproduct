library(RCurl)
library(caret)
#mpg <- getURL("http://robertkevinackerman.com/wp-content/uploads/2014/08/mpg.csv")
mpg <- read.csv('car1.csv', na.strings = "?")
mpg<-mpg[!is.na(mpg[,4]),]
mpg<- mpg[,c(1,2,4,5,7,9)]
colnames(mpg)<- c("mpg", "cylinder","horsepower", "weight", "year", "name")

modFit <- train(mpg ~ horsepower + cylinder + weight + year , method="glm", data=mpg)

prediction<- function(cylinder,horsepower,weight,year){
    selections<- as.data.frame(cbind(as.integer(cylinder),as.integer(horsepower),
                                     as.integer(weight), as.integer(year)))
    colnames(selections)<- c("cylinder","horsepower","weight", "year")
    predictionResults<-predict(modFit, newdata=selections)
    predictionResults
}

closest<- function(x){
    mpg[which.min(abs(mpg[,1]-x)),]
}

shinyServer(
    function(input,output){
        #cylinder<- input$cylinder
        #horsepower<-input$horsepower
        #weight<-input$weight
        #year<-input$year
        
        output$selection1<-renderPrint({input$cylinder})
        output$selection2<-renderPrint({input$horsepower})
        output$selection3<-renderPrint({input$weight})
        output$selection4<-renderPrint({input$year})
        output$Prediction<-renderPrint({prediction(input$cylinder,input$horsepower,
                                                   input$weight,input$year)})
        output$suggestion<-renderPrint({closest(prediction(input$cylinder,
                                                           input$horsepower,
                                                   input$weight,input$year))})
        
    }
)