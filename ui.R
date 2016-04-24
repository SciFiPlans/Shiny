library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Regression in MTCars dataset"),
  sidebarPanel(
    h3('Regression and graph options'),
    checkboxGroupInput("ireg","Pick one regressor:",
                       c("Displacement" = 3,
                         "Horse Power" = 4,
                         "Weight" = 6,
                         "Acceleration" = 7)),
checkboxGroupInput("icolor","Color scatter points by:",
                       c("Number of cylinders" = "cyl",
                         "Transmission type" = "am",
                         "Number of gears" = "gear"))
  ),
  
  mainPanel(
    h3('Results Panel'),
    h4('Chosen values:'),
    p('MTCars dataset column'),
    verbatimTextOutput("oregressor"),
    p('Variable for point coloring'),
    verbatimTextOutput("ocolor"),
    p('Linear model intercept:'),
    verbatimTextOutput("intercept"),
    p('Linear model slope'),
    verbatimTextOutput("slope"),
    plotOutput('plot1')
  )
))