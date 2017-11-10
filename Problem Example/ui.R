library(shiny)

shinyUI(
  fluidRow(
    lapply(1:questionCounts[1], 
           function(i) {
             questListInput(paste0('Occurr1',i))
           }
    )
    
  )
  # fluidRow(
  #   textOutput('answerseT')
  # )
)