
shinyUI(fluidPage(
  titlePanel("Bullet Builder"),
  sidebarLayout(
    
    sidebarPanel(
      h2("Choose parameters:"),
      fileInput("fileName", label = "Data:"),
      textInput("graphTitle", label = "Graph Title:", value = "Title"),
      textInput("yAxis", label = "Y Axis:", value = "Numbers"),
      textInput("xAxis", label = "X Axis:", value = "Groups"),
      numericInput("yMin", label = "Y min:", value = 0),
      numericInput("yMax", label = "Y max:", value = 100)
    ),
    
    mainPanel(
      plotOutput('graph')
    )
  )
))