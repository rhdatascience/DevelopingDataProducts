library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Diabetes prediction"),

  
    sidebarPanel(
            h3('Documentation'),
            h5('Hi,'),
            h5('In order to calculate a diabetes prediction, you need to enter your date of birth and your glucose level in your blood. The result will be displayed on the right side.'),
      h3('Inputs'),
      dateInput('birthday','Enter your date of birth', value = '1990-01-01', min = '1900-01-01', max = Sys.Date()-1, startview = "year", weekstart = 1),
      numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5)
    ),
    mainPanel(        
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('and'),
        verbatimTextOutput("dateInput"),        
        h4('Your diabetes prediction is '),
        verbatimTextOutput("prediction"),
        h4('Your age in days is'),
        verbatimTextOutput("age")
    )
  )
)

