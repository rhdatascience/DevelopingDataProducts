library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Diabetes prediction"),
  
    sidebarPanel(
      dateInput('birthday','Enter your date of birth', value = '1990-01-01', min = '1900-01-01', max = Sys.Date()-1, startview = "year", weekstart = 1),
      numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5)
    ),
    mainPanel(
        h3('Results of prediction'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('and'),
        verbatimTextOutput("dateInput"),
        h4('Which resulted in a prediction of '),
        verbatimTextOutput("prediction"),
        h4('Your age in days is'),
        verbatimTextOutput("age")
    )
  )
)

