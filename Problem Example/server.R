library(shiny)

source("global.R")                      #Sources the modules used in the app

questionSet <<- read.csv("./Data/QuestData.csv")
occQuestSet <- questionSet[questionSet$Category == "Occurrence",]

shinyServer(function(input, output, session) {
  observe({
      answerSeto1 <- lapply(1:questionCounts[1], 
                          function(i) {
                            mods <- (paste0('Occurr1',i))
                            a1 <- callModule(questList,mods,occQuestSet[i,])
                           })
  })    
  
  output$answerseT <- renderText(answerSeto1())
})