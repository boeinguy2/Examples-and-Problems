##########################################################
###     Modules for Generating Dynamic Question Lists                 #####
##########################################################

questListInput <- function(id){
  ns <- NS(id)
  
  tagList(
    tags$hr(style="border-color: darkblue;"),
    h4(textOutput(ns("labelQ"))),
    radioButtons(ns("c1"), "Please Select:", choices = c(""))
  )
  
}

questList <- function(input, output, session, q) {
  
  ###This function requires the type of question to be specified
  
  ns <- session$ns
  
  createLabel <- function(name) {
    paste0(name,": ",q$Element.Question,sep = "")
  }
  
  #output$QID <- as.character(q[2])
  output$labelQ <- renderText({ createLabel(q$QID) })
  
  createOptions <- function() {
    as.matrix(q[5:length(q)])
  }
  
  observe({
    updateRadioButtons(session, "c1", choices = createOptions())
  })
  print("Inside the Module")
  print(input$c1)
  return(
    list(
      answer = reactive({input$c1})
      #quest = reactive({q$QID})
    )
  )
}


