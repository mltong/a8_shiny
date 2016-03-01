library(shiny)
data(iris)
shinyServer(
  
  function(input, output) {
    
    output$data <- renderTable({
      colm <- as.numeric(input$iris_LW)
      iris[colm]
    
    })
    
    output$histogram <- renderPlot({
      colm <- as.numeric(input$iris_LW)
      hist(iris[,colm], breaks=seq(0, max(iris[,colm]), l=input$bins+1), col = input$colors, main="Histogram of iris dataset", xlab=names(iris[colm]), xlim=c(0,max(iris[,colm])))
      
    })
    
  }
)
