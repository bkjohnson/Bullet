
shinyServer(function(input, output){
   
  bulletplot=function(file = '', ymin = 0, ymax = 100, numticks = 20, graphTitle = '', xTitle = '', yTitle = '') {
    data = read.csv(file)
    ## Set up window
    graphframe(names(data), ymin, ymax, numticks, graphTitle, yTitle, xTitle)
  }
   
  ## Function that initializes the graph window and sets up the axes and titles
  graphframe = function(namelist, ymin, ymax, numticks, graphTitle, yTitle, xTitle) {
    xax = c(0, length(namelist) + 1)
    yax = c(ymin, ymax)
    plot.new()
    plot.window(xax, yax)
    title(main = graphTitle, ylab = yTitle, xlab = xTitle)
    axis(1, at = 1:length(namelist), lab = c(namelist))
    axis(2, at = seq(ymin, ymax, ((ymax - ymin)/numticks)), lab = seq(ymin, ymax, ((ymax - ymin)/numticks)))
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
    numticks = 20
    bulletplot(file$datapath, ymin, ymax, numticks, graphTitle, xTitle, yTitle)
   })
 })
