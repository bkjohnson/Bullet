
shinyServer(function(input, output){

  bulletplot=function(file = '', ymin = 0, ymax = 100, graphTitle = '', xTitle = '', yTitle = '') {
    data = read.csv(file)
    ## Set up window
    graphframe(names(data), ymin, ymax, graphTitle, yTitle, xTitle)
  }
  
  ## Function that initializes the graph window and sets up the axes and titles
  graphframe = function(namelist, ymin, ymax, graphTitle, yTitle, xTitle) {
    xax = c(0, length(namelist) + 1)
    yax = c(ymin, ymax)
    plot.new()
    plot.window(xax, yax)
    title(main = graphTitle, ylab = yTitle, xlab = xTitle)
    axis(1, at = 1:length(namelist), lab = c(namelist))
    box()
  }
  
  output$graph <- renderPlot({
    file = input$fileName
    if (is.null(file))
      return(NULL)
    graphTitle = input$graphTitle
    yTitle = input$yAxis
    xTitle = input$xAxis
    ymin = 0    # temporary
    ymax = 100  # temporary
    
    bulletplot(file$datapath, ymin, ymax, graphTitle, xTitle, yTitle)
  })
})