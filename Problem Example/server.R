library(shiny)

source("global.R")                      #Sources the modules used in the app

questionSet <<- read.csv("./Data/QuestData.csv")
occQuestSet <- questionSet[questionSet$Category == "Occurrence",]

shinyServer(function(input, output, session) {
  observe({
    occAnswer1 <- callModule(questList,"occList1",occQuestSet,"Occur1")
  })    
  
  output$answerseT <- renderText(answerSeto1())
})
