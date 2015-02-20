library(shiny)

diabetesRisk <- function(glucose,birthdate) {
        glucose * ageInDays(birthdate) / 1000
}
ageInDays <- function(birthdate) 
{
        today <- as.POSIXct(Sys.time(),tz='GMT')
        bd <- as.POSIXct(birthdate,tz='GMT')        
        d <- today - bd
        as.numeric(d, units = "days")
}

shinyServer(
  function(input, output) {
    prediction <- reactive({diabetesRisk(input$glucose,input$birthday)})
    output$dateInput <- renderPrint({input$birthday})
    output$age <- renderPrint({ageInDays(input$birthday)})
    output$inputValue <- renderPrint({input$glucose})
    output$prediction <- renderPrint({prediction()})    
  }
)
