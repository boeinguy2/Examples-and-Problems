questListInput <- function(id){
  ns <- NS(id)

  uiOutput(ns("c1"))

}

questList <- function(input, output, session, q, l) {
  
  ###This function requires the type of question to be specified
  
  output$c1 <- renderUI({
    lapply(1:nrow(q),
           function(i) {
             
             createLabel <- function(name,j) {
               paste0(name,": ",q$Element.Question[j],sep = "")
             }
             
             labelQ <- createLabel(q[i,]$QID,i)
             
             
             createOptions <- function() {
               as.matrix(q[i,5:length(q)])
             }
             tagList(
               tags$hr(style="border-color: darkblue;"),
               h4((paste0(labelQ))),
               radioButtons(session$ns(paste0(l,i)), "Please Select:", choices = c(createOptions()))
             )
           }
    )
  })

  observe({
    lapply(1:nrow(q), 
           function(i) {
             output[[paste0(l,i)]] <- reactive(paste0(l,i))   
           }
    )
  })
  print("Inside the Module")
  print(input$c1)
  # return(
  #  list(
  #    answer1 = reactive({paste0(l,1)})
  #  )
  # )
}
