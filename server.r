library(shiny)

shinyServer(
  function(input,output) {
    output$oregressor <- renderPrint({input$ireg})
    output$ocolor     <- renderPrint({input$icolor})
    output$intercept  <- renderPrint(lm(mtcars$mpg ~ mtcars[,as.numeric({input$ireg})])$coefficients[1])
    output$slope      <- renderPrint(lm(mtcars$mpg ~ mtcars[,as.numeric({input$ireg})])$coefficients[2])
    output$plot1      <- renderPlot({
      attach(mtcars)
      if({input$icolor} == "cyl") {
        plot(mtcars[,as.numeric({input$ireg})], mpg, main = "Scatter Plot",
             xlab = names(mtcars)[as.numeric({input$ireg})],
             ylab = "Miles per Gallon", pch = 19, col = as.factor(mtcars$cyl))
        legend('topright', legend = levels(as.factor(mtcars$cyl)), col = 1:3, cex = 0.8, pch = 1, title = "Cylinders")
      }
      if({input$icolor} == "am") {
        plot(mtcars[,as.numeric({input$ireg})], mpg, main = "Scatter Plot",
             xlab = names(mtcars)[as.numeric({input$ireg})],
             ylab = "Miles per Gallon", pch = 19, col = as.factor(mtcars$am))
        legend('topright', legend = levels(as.factor(mtcars$am)), col = 1:3, cex = 0.8, pch = 1, title = "0 auto 1 man")
      }
      if({input$icolor} == "gear") {
        plot(mtcars[,as.numeric({input$ireg})], mpg, main = "Scatter Plot",
             xlab = names(mtcars)[as.numeric({input$ireg})],
             ylab = "Miles per Gallon", pch = 19, col = as.factor(mtcars$gear))
        legend('topright', legend = levels(as.factor(mtcars$gear)), col = 1:3, cex = 0.8, pch = 1, title = "Number of gears")
      }
      abline(lm(mpg ~ mtcars[,as.numeric({input$ireg})]), col="red") 
    })
  }
)