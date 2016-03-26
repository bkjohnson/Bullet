
shinyServer(function(input, output){
  
  ## Function that initializes the graph window and sets up the axes and titles
  graphframe = function(graphTitle, yTitle, xTitle) {
    plot.new()
    title(main = graphTitle, ylab = yTitle, xlab = xTitle)
    box()
  }
  
  output$graph <- renderPlot({
    file = input$fileName
    if (is.null(file))
      return(NULL)
    graphTitle = input$graphTitle
    yTitle = input$yAxis
    xTitle = input$xAxis

    graphframe(graphTitle, yTitle, xTitle)
    })
})