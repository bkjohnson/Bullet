
shinyUI(fluidPage(
  titlePanel("Bullet Builder"),
  sidebarLayout(
    
    sidebarPanel(
      h2("Choose parameters:"),
      fileInput("fileName", label = "Data:")
    ),
    
    mainPanel()
  )
))