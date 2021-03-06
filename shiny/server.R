
shinyServer(function(input, output){
   
  bulletplot=function(file = '', ymin = 0, ymax = 100, intervals = c(.8, .95, .99), graphTitle = '', xTitle = '', yTitle = '') {
    data = read.csv(file)
    ## Set up window
    graphframe(names(data), ymin, ymax, graphTitle, yTitle, xTitle)
    
    ## Get the values for each bullet
    x = 1
    for (name in names(data)) {
      column = c()
      for (num in data[name]) {
        column = c(num) ## The way this works is weird
      }
      
      bulletmean = mean(column, na.rm = TRUE)
      column = column[!is.na(column)]
      ## Get standard error ranges for confidence intervals
      SE = stdErr(column, intervals)
      ## Draw the bullet
      makebullet(x, bulletmean, SE, rgb( 0, 0, 0, 255, maxColorValue=255))
      
      x = x + 1
    }
    
    labels = sprintf("%1.0f%%",rev(intervals) * 100)
    legend(x * .8, ymax * .9, legend = labels, title = "Confidence Intervals", lty=1, lwd = 3, seg.len = c(0.5, 2, 4), xjust = 0.5)
  }
   
  ## Function that initializes the graph window and sets up the axes and titles
  graphframe = function(namelist, ymin, ymax, graphTitle, yTitle, xTitle) {
    xax = c(0, length(namelist) + 1)
    yax = c(ymin, ymax)
    plot.new()
    plot.window(xax, yax)
    title(main = graphTitle, ylab = yTitle, xlab = xTitle)
    axis(1, at = 1:length(namelist), lab = c(namelist))
    axis(2)
    box()
    grid(nx = NA, ny = NULL, lty="solid")
  }
   
  ## Function that computes standard error for 3 given confidence intervals
  stdErr = function(column, ci) {
    ## Get t values for the confidence intervals
    conf80 = qt((ci[1] + 1)/2, df = length(column) - 1)
    conf95 = qt((ci[2] + 1)/2, df = length(column) - 1)
    conf99 = qt((ci[3] + 1)/2, df = length(column) - 1)
    ## Get standard error for each confidence interval
    se = sd(column)/sqrt(length(column))
    c(se * conf80, se * conf95, se * conf99)
  }
   
  ## Function that creates a single bullet
  makebullet = function(x, bulletmean, SE, bulletcolor) {
    widths = c(0.1, 0.06, 0.01)
    for (i in 1:3) {
    ## Draw each separate tier
     ## rect(x1, y1, x2, y2)
      rect(x - widths[i], bulletmean - SE[i], x + widths[i], bulletmean +  SE[i], density = -1, border = NA, col = bulletcolor)
    }
    ## Draw the mean line after so any bulletcolor change won't affect it
    segments(x - 0.16, bulletmean, x + 0.16)
  }
  
  output$graph <- renderPlot({
    file = input$fileName
    if (is.null(file))
      return(NULL)
     
    graphTitle = input$graphTitle
    yTitle = input$yAxis
    xTitle = input$xAxis
    ymin = input$yMin
    ymax = input$yMax
    intervals = c(0.8, 0.95, 0.99)
    bulletplot(file$datapath, ymin, ymax, intervals, graphTitle, xTitle, yTitle)
   })
 })
