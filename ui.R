
shinyUI(fluidPage(
  titlePanel("Bullet Builder"),
  sidebarLayout(
    
    sidebarPanel(
      h2("Choose parameters:"),
      fileInput("fileName", label = "Data:"),
      textInput("graphTitle", label = "Graph Title:", value = "Title"),
      textInput("yAxis", label = "Y Axis:", value = "Numbers"),
      textInput("xAxis", label = "X Axis:", value = "Groups")
    ),
    
    mainPanel(
      plotOutput('graph')
    )
  )
))