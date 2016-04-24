library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Regression in MTCars dataset"),
  sidebarPanel(
    h3('App Summary'),
    p('This is a very simple app that uses the default dataset MTCars available for GNU R to perform some simple linear analysis'),
    p('The app calculates the relation between in mpg("Miles per gallon") and different regressors using a linear model and shows a scatter plot with the results'),
    h3('Regression and graph options'),
    p('In the following checkbox one and only one regressor must be selected'),
    checkboxGroupInput("ireg","Pick one regressor:",
                       c("Displacement" = 3,
                         "Horse Power" = 4,
                         "Weight" = 6,
                         "Acceleration" = 7)),
    p('In the following checkbox a different variable must be selected, this variable it is only used to color the points'),
    checkboxGroupInput("icolor","Color scatter points by:",
                       c("Number of cylinders" = "cyl",
                         "Transmission type" = "am",
                         "Number of gears" = "gear"))
  ),
  
  mainPanel(
    h3('Results Panel'),
    p('In the following boxes we can see the values of the fitted linear model for the chosen regressor'),
    p('Linear model intercept:'),
    verbatimTextOutput("intercept"),
    p('Linear model slope'),
    verbatimTextOutput("slope"),
    p('In the following graph we can see a scatter plot of mpg versus the selected regressor with a linear model superimposed'),
    p('Additionally the scatter plot points can be colored attending to an addtional parameter, adding additional information'),
    plotOutput('plot1')
  )
))